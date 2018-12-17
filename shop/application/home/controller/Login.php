<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class Login extends Controller
{
    /**
     * 登录
     *
     * @return \think\Response
     */
    public function login()
    {
        $this->view->engine->layout(false);
        return view();
    }
    //登录
    public function dologin(){
        $data=request()->param();
        //数据验证
        $rule=[
            'username'=>'require',
            'password'=>'require|length:6,16'
        ];
        $msg=[
            'username.require'=>'用户名不能为空',
            'password.require'=>'密码不能为空',
            'password.length'=>'密码为6~16位的字符',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        $data['password']= encrypt_password($data['password']);
        //数据验证成功后，验证是否有数据
        $user=\app\home\model\User::where(function($request) use($data){
            $request->where('phone',$data['username'])->whereOr('email',$data['username']);
        })->where('password',$data['password'])->find();
//        $user= \app\home\model\User::where(['username'=>$data['username'],'password'=>$data['password']])->find();
        if($user){
            if(!$user['is_check']){
                $this->error('请先完成激活');
            }else{
                session("user_info",$user->toArray());
                //完成登录后，需将cookie中的购物车信息写入数据库（一定要在session之后）
                \app\home\model\Cart::cookietodb();
                $url='home/index/index';
                if(session('?url')){
                    $url=session('url');
                }
                $this->success('登陆成功',$url);
            }
        }else{
            $this->error('用户名或密码错误');
        }
    }
    //第三方登录
    public function qqcallback(){
        require_once("./plugins/qq/API/qqConnectAPI.php");
        $qc = new \QC();
        $access_token=$qc->qq_callback();
        $openid=$qc->get_openid();
        $qc=new \QC($access_token,$openid);
        //获取用户信息主要是nickname
        $info=$qc->get_user_info();
        $user= \app\home\model\User::where('openid',$openid)->find();
        if($user){
         //更新数据表的username信息
            $user->username=$info['nickname'];
            $user->save();
        }else{
            $data=[
                'username'=>$info['nickname'],
                'openid'=>$openid,
                'is_check'=>1,
            ];
            \app\home\model\User::create($data);
        }
        $user= \app\home\model\User::where('openid',$openid)->find();
        session('user_info',$user->toArray());
        //完成登录后，需将cookie中的购物车信息写入数据库
        \app\home\model\Cart::cookietodb();
        $url='home/index/index';
        if(session('?url')){
            $url=session('url');
        }
        $this->success('登陆成功',$url);
    }
    public function logout(){
        session(null);
        $this->redirect('home/index/index');
    }
    //用于手机注册
    public function register()
    {
        $this->view->engine->layout(false);
        return view();
    }
    //保存数据
    public function save(){
        //获取注册信息
        $data=request()->param();
        $rule=[
            'phone'=>'require|regex:^1[3-9]\d{9}$',
            'code'=>'require|regex:^\d{4}$',
            'password'=>'require|length:9,16|confirm:repassword',
        ];
        $msg=[
            'phone.require'=>'手机号不能为空',
            'phone.regex'=>'手机号格式不正确',
            'code.require'=>'验证码不能为空',
            'code.regex'=>'验证码格式不正确',
            'password.require'=>'密码不能为空',
            'password.length'=>'密码长度为9~16个字符',
            'password.require'=>'两次密码不一致'
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        //对验证码进行验证
        if($data['code']!= cache('code'.$data['phone'])){
            $this->error('短信验证码错误');
        }
        if(\app\home\model\User::where('phone',$data['phone'])->find()){
            $this->error('手机号已被注册');
        }
        cache('code'.$data['phone'],null);
        //对数据进行修改
        $data['username']=$data['phone'];
        $data['password']= encrypt_password($data['password']);
        $data['is_check']=1;
        //保存数据
        \app\home\model\User::create($data,true);
        $this->success('注册成功，请登录','login');
    }
   //发送短信验证码
    public function sendmsg(){
        //接收手机号并验证
        $phone=request()->param('phone');
        if(!preg_match('/^1[0-9]\d{9}$/', $phone)){
            return json([
              'code'=>10001,
              'msg'=>'手机号格式错误'
            ]);
        }
        //生成验证码，并保存，方便后续使用,设置有效时间
        $code=mt_rand(1000,9999);
        //发送请求
        if(time()- cache('code'.$phone.'time')<60){
            $result=[
                'code'=>10003,
                'msg'=>'短信发送频繁，请稍后再试',
            ];
            return json($result);
        }
        $msg="【创信】你的验证码是：{$code}，3分钟内有效！";
        $res=sendmsg($phone, $msg);
//        $res=1;
        if($res){
            $result=[
                'code'=>10000,
                'msg'=>'短信发送成功',
                'data'=>$code    //用户注册完成时不要此条信息
            ];
            cache('code'.$phone,$code,config('msg.time'));
            cache('code'.$phone.'time',time());
            return json($result);
        }else{
            $result=[
                'code'=>10002,
                'msg'=>'短信发送失败',
            ];
            return json($result);
        }
    }
    public function register_email()
    {
        //
        $this->view->engine->layout(false);
        return $this->fetch();
    }
    public function registeremail()
    {
        //接收数据
        $data=request()->param();
       //验证数据
        $rule=[
            'email'=>'require|email',
            'password'=>'require|length:6,16|confirm:repassword',
        ];
        $msg=[
            'email.require'=>'邮箱不能为空',
            'email.require'=>'邮箱格式不正确',
            'password.require'=>'密码不能为空',
            'password.length'=>'密码为6~16位的字符串',
            'password.confirm'=>'两次密码输入不一致',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        //验证是否已被注册过
        $exeit=\app\home\model\User::where('email',$data['email'])->find();
        if($exeit){
            $this->error('该邮箱已被注册，请直接登录');
        }
        //验证成功后，加入数据库
        $data['email_code']=mt_rand(1000,9999);
        $data['password']= encrypt_password($data['password']);
        $data['is_check']=0;
        $data['username']=$data['email'];
        $user=\app\home\model\User::create($data,true);
        //发送短信
        $email=$data['email'];
        $subject="商城注册，请完成认证";
        $url=url('/home/login/emailverify',['id'=>$user['id'],'email_code'=>$data['email_code']],'html',true);
        $body="请点击如下链接完成注册激活："."<a href='$url'>点我完成注册激活</a>。";
        $res=sendmail($email, $subject, $body);
        if($res){
            $this->success('完成注册，请尽快激活','login');
        }else{
            $this->error('发送邮件失败，请联系管理员');
        }
    }
    public function emailverify(){
        $data=request()->param();
        //数据验证
        $rule=[
            'id'=>'require',
            'email_code'=>'require|regex:^\d{4}$',
        ];
        $msg=[
            'id.require'=>'激活失败，参数错误',
            'email_code.require'=>'激活失败，参数错误',
            'email_code.regex'=>'激活失败，参数错误',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $this->error('激活失败，参数错误');
        }
        //数据验证OK,查询数据表信息
        $user= \app\home\model\User::where('id',$data['id'])->where('email_code',$data['email_code'])->find();
        if($user){
            $user->is_check=1;
            $user->save();
            $this->success('激活成功','login');
        }else{
            $this->error('激活失败');
        }
    }
}
