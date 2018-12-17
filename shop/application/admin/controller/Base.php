<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;


class Base extends Controller
{
   public function __construct() {
     parent::__construct();
//     验证是否有session信息，防止翻墙
//     if(!session('loginInfo')){
//         $this->redirect('admin/login/login');
//     }
     //防止管理员越权访问
     $this->basevoid();
     //展示layout页面的左侧菜单栏
     $this->getLeft();
  }
  
  //展示layout页面的左侧菜单栏
  public function getLeft(){
      $role_id=session('loginInfo.role_id');
      if($role_id==1){
          $base_one= \app\admin\model\Auth::where('pid',0)->where('is_nav',1)->select();
          $base_two= \app\admin\model\Auth::where('pid','>',0)->where('is_nav',1)->select();
      }else{
          $auth_id= \app\admin\model\Role::where('id',$role_id)->value('role_auth_ids');
          $base_one= \app\admin\model\Auth::where('pid',0)->where('is_nav',1)->where('id','in',$auth_id)->select();
          $base_two= \app\admin\model\Auth::where('pid','>',0)->where('is_nav',1)->where('id','in',$auth_id)->select();
      }
      $this->assign('base_one',$base_one);
      $this->assign('base_two',$base_two);
  }
  
  //防止管理员越权访问
  public function basevoid(){
      //获取当前的role_id
      $role_id=session('loginInfo.role_id');
      //超级管理员可以访问任何页面
      if($role_id==1){
          return;
      }
      //获取当前的控制器和方法
      $controller= request()->controller();
      $action= request()->action();
      //判定如果是默认页则可以访问
      if($controller=='Index'&&$action=='index'){
          return;
      }
      //获取角色可以操作的auth_ids
      $auth_id= \app\admin\model\Role::where('id',$role_id)->value('role_auth_ids');
      //获取当前的auth_ids
      $role_auth_id= \app\admin\model\Auth::where('auth_c',$controller)->where('auth_a',$action)->value('id');
      if(!in_array($role_auth_id, explode(',', $auth_id))){
          $this->error('没有权限访问','admin/index/index');
      }
  }
}
