<?php

namespace app\admin\controller;
use think\Request;

class Type extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $list= \app\admin\model\Type::select();
        return view('index',['list'=>$list]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
         return view();
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
        if($data['type_name']==''){
            $this->error('类型名称不能为空');
        }
        $verify= \app\admin\model\Type::where('type_name',$data['type_name'])->value('id');
        if($verify){
            $this->error('类型不能重复');
        }
        \app\admin\model\Type::create($data,true);
        $this->success('添加成功','index');
    }

    public function edit($id)
    {
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        $data= \app\admin\model\Type::where('id',$id)->find();
        return view('edit',['data'=>$data]);
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request)
    {
        $data=$request->param();
        if($data['type_name']==''){
            $this->error('类型名称不能为空');
        }
        $verify= \app\admin\model\Type::where('type_name',$data['type_name'])->value('id');
        if($verify){
            $this->error('类型不能重复');
        }
        \app\admin\model\Type::update($data,[],true);
        $this->success('修改成功','index');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //判定id是否有效
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        \app\admin\model\Type::destroy($id);
        $this->success('删除成功','index');
    }
}
