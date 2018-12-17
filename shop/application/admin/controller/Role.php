<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Role extends Base
{
    //显示列表页
    public function index()
    {
        $data=\app\admin\model\Role::select();
        return view('index',['data'=>$data]);
    }

    //分配权限页面
    public function setauth($id)
    {
        //验证$id是否有效
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        $data= \app\admin\model\Role::where('id',$id)->find();
        $auth_one= \app\admin\model\Auth::where('pid',0)->select();
        $auth_two= \app\admin\model\Auth::where('pid','>',0)->select();
        return view('setauth',[
            'data'=>$data,
            'auth_one'=>$auth_one,
            'auth_two'=>$auth_two,
        ]);
    }
     public function updateauth()
    {
        $id=request()->param('role_id');
        $ids=request()->param('id/a');
        $role_auth_ids= implode(',',$ids);
        \app\admin\model\Role::update(['role_auth_ids'=>$role_auth_ids],['id'=>$id]);
        $this->success('分配成功','index');
    }
    public function create()
    {
        $auth_one= \app\admin\model\Auth::where('pid',0)->select();
        $auth_two= \app\admin\model\Auth::where('pid','>',0)->select();
        return view('create',[
            'auth_one'=>$auth_one,
            'auth_two'=>$auth_two,
        ]);
    }
    public function save()
    {
        //获取数据
        $info=request()->param();
        //验证数据
        $rule=[
            'role_name'=>'require',
            'role_auth_ids'=>'require',
        ];
        $msg=[
            'role_name.require'=>'角色名不能为空',
            'role_auth_ids.require'=>'请选择权限',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($info)){
            $error=$validate->getError();
            $this->error($error);
        }
        $info['role_auth_ids']=implode(',',$info['role_auth_ids']);
        //保存数据
        \app\admin\model\Role::create($info,true);
        $this->success('添加成功','index');
    }
    //删除角色
    public function delete($id)
    {
        //验证$id是否有效
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        \app\admin\model\Role::destroy($id);
        $this->success('删除成功','index');
    }
    //编辑角色
    public function edit($id)
    {
        //验证$id是否有效
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        $data= \app\admin\model\Role::find($id);
        return view('edit',['data'=>$data]);
    }
   //编辑角色
    public function update()
    {
        //获取数据
        $data=request()->param();
        //数据验证
        $rule=[
            'id'=>'require|integer',
            'role_name'=>'require',
        ];
        $msg=[
            'id.require'=>'id不能为空',
            'id.integer'=>'id参数不对',
            'role_name.require'=>'角色名字不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        unset($rule,$msg,$validate);
        //修改数据
        \app\admin\model\Role::update($data,[],true);
        $this->success('修改成功','index');
    }
}
