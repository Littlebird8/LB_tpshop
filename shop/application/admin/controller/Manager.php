<?php

namespace app\admin\controller;
use think\Request;
use app\admin\model\Manager as MangerModel;

class Manager extends Base
{
    //获取管理员列表
    public function index()
    {
//        $search=request()->param('search');
//        dump($search);
        $search='';
        $num=5;         //每页显示的数量
        if(empty(request()->param('search'))){
            $data=MangerModel::alias('m')->join('tpshop_role r','m.role_id=r.id','left')->field('m.*,r.role_name')->paginate($num);            
        }else{
            $search=request()->param('search');
            $data=MangerModel::alias('m')->join('tpshop_role r','m.role_id=r.id','left')->field('m.*,r.role_name')->
                    where('username','like',"%{$search}%")->paginate($num,false,['query' => ['search'=>$search]]);  
        }
        $this->assign('search',$search);
        return view('index',['data'=>$data]);
    }
    
    public function create()
    {
        $role= \app\admin\model\Role::select();
        return view('create',['role'=>$role]);
    }
    public function save()
    {
        //获取数据
        $data=request()->param();
        //验证数据
        $user='admin';
        $rule=[
            'username'=>'require|different:'.$user,
            'nickname'=>'require',
            'password'=>'require',
            'role_id'=>'require',
            'email'=>'require|regex:/^\w[\w\.-]*@[a-z0-9][a-z0-9\-]*(\.[a-z]+)*(\.[a-z]{2,6})$/i',
        ];
        $msg=[
            'username.require'=>'用户名不能为空',
            'username.different'=>'用户名已被注册',
            'nickname.require'=>'昵称不能为空',
            'password.require'=>'密码不能为空',
            'email.require'=>'邮箱不能为空',
            'email.regex'=>'邮箱格式不正确',
            'role_id.require'=>'角色不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        if($data['username']=='admin'){
            $this->error('管理员重复');
        }
        $data['password']= encrypt_password($data['password']);
        //保存数据
        MangerModel::create($data,true);
        //页面跳转
        $this->success('添加成功','index');
    }

    public function edit($id)
    {
       $data= MangerModel::find($id);
       $role= \app\admin\model\Role::select();
       return view('edit',['data'=>$data,'role'=>$role]);
    }
    public function update($id)
    {
        //获取数据
       $data= request()->param();
       //数据验证
        $rule=[
            'nickname'=>'require',
            'role_id'=>'require',
            'email'=>'require|regex:/^\w[\w\.-]*@[a-z0-9][a-z0-9\-]*(\.[a-z]+)*$/i',
        ];
        $msg=[
            'nickname.require'=>'昵称不能为空',
            'email.require'=>'邮箱不能为空',
            'email.regex'=>'邮箱格式不正确',
            'role_id.require'=>'角色不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
       $num=MangerModel::update($data,[],['email','nickname']);
       if($num){
           $this->success('修改成功','index');
       }else{
           $this->success('没有修改内容','index');
       }
    }
    public function delete($id){
        $num=MangerModel::destroy($id);
        if($num){
           $this->success('删除成功','index');
        }else{
            $this->error('删除失败');
        }
    }
    //重置密码
    public function reencrpt($id)
        {
        $password= encrypt_password('123456');
        MangerModel::update(['password'=>$password],['id'=>$id],true);
        $this->success('重置完成','index');
        }
    public function editpwd()
        {
            return view();
        }
    public function saveeditpwd()
   {
       $id= session('loginInfo')['id'];
       $data= request()->param();
       $password=$data['password'];
       $newpwd= $data['newpwd'];
       $renewpwd= $data['renewpwd'];
       //判定是否为空
       if($password==''){
           $this->error('原密码不能为空');
       }
       if($newpwd==''){
           $this->error('新密码不能为空');
       }
       if($renewpwd==''){
           $this->error('确认密码不能为空');
       }
       if($renewpwd!=$newpwd){
           $this->error('两次密码不一致');
       }
       $newpwd= encrypt_password($data['newpwd']);
       $renewpwd= encrypt_password($data['renewpwd']);
       $pwd= MangerModel::where('id',$id)->value('password');
       if(encrypt_password($password)!=$pwd){
           $this->error('原密码错误');
       }
       if($pwd==$newpwd){
           $this->error('密码与原密码一致');
       }
       MangerModel::update(['password'=>$newpwd],['id'=>$id],true);
       $this->redirect('admin/login/login');
   }
}
