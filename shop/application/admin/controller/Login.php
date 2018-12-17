<?php

namespace app\admin\controller;
use think\Controller;
use think\Request;
class Login extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function login()
    {
        if(request()->isGet()){
            $this->view->engine->layout(false);
            return view();
        }else{
            //获取登录信息
            $data=request()->param();
            //验证登录信息格式
            $rule=[
                'username'=>'require',
                'password'=>'require',
                'code'=>'require|min:4|max:4',
            ];
            $msg=[
                'username.require'=>'用户名不能为空',
                'password.require'=>'用户名不能为空',
                'code.require'=>'验证码不能为空',
                'code.min'=>'验证码错误',
                'code.max'=>'验证码错误',
            ];
            $validate=new \think\Validate();
            if(!$validate->check($data)){
                $error=$validate->error();
                $this->error($error);
            }
            //验证验证码
            if(!captcha_check($data['code'])){
                $this->error('验证码错误');
            }
            //验证密码和用户名
            $password= encrypt_password($data['password']);
            $username=$data['username'];
            $info=\app\admin\model\Manager::where([
                'username'=>$username,
                'password'=>$password
            ])->find();
            if($info){
            //设置session
            session('loginInfo',$info->toArray());
            //变更最后登录时间
            $time=time();
            \app\admin\model\Manager::where(['username'=>$username])->update(['last_login_time'=>$time]);
            //跳转页面
            $this->success('登陆成功','admin/manager/index');
            }else{
            $this->error('密码或用户名错误');
            }
        }
    }
    public function logout(){
        session(null);
        $this->redirect('admin/login/login');
    }
}
