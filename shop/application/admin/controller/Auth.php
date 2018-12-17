<?php

namespace app\admin\controller;
use think\Request;

class Auth extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $model=new \app\admin\model\Auth();
        $data=$model->select();
        $data= getTree($data);
        return view('index',['data'=>$data]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        $data= \app\admin\model\Auth::where('pid',0)->select();
         return view('create',['data'=>$data]);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        $data=$request->param();
        $rule=[
           'auth_name'=>'require',
            'pid'=>'require',
        ];
        $msg=[
            'auth_name.require'=>'权限名称不能为空',
            'pid.require'=>'上级权限不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        if($data['pid']!=0&&($data['auth_c']=='')){
            $this->error('控制器不能为空');
        }
        if($data['pid']!=0&&($data['auth_a']=='')){
            $this->error('方法不能为空');
        }
        \app\admin\model\Auth::create($data,true);
        $this->success('添加成功','index');
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function setauth()
    {
        return view();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        \app\admin\model\Auth::destroy($id);
        $this->success('删除成功','index');
    }
}
