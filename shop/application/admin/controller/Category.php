<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Category extends Base
{
    //获取所有的父级pid为$id所有分类
    public function getallcate($id){
        if($id==''){
             $data=[
                'code'=>10001,
                'msg'=>''
            ];
           return json($data);  
        }
        $data=\app\admin\model\Category::where('pid',$id)->select();
        $data=[
            'code'=>10000,
            'msg'=>'',
            'data'=>$data,
        ];
        return json($data);
    }
    public function index(Request $request){
        $search='';
        $search_pid='';
        if(!empty(request()->param('search'))){
            $search=request()->param('search');
        }
        if(!empty(request()->param('search_pid'))){
            $search_pid=request()->param('search_pid');
        }
        //获取所有的一级的id
        //获取所有的二级的id
        //获取所有的三级的id
        $cate_one=\app\admin\model\Category::where('pid',0)->column('id');
        $cate_two=\app\admin\model\Category::where('pid','in',$cate_one)->column('id');
        $cate_three=\app\admin\model\Category::where('pid','in',$cate_two)->column('id');
//       dump($cate_one);
//       dump($cate_two);
//       dump($cate_three);
        $data= \app\admin\model\Category::where('cate_name','like',"%{$search}%")->where('pid','like',"%{$search_pid}%")->paginate(20,false,['query'=>['search'=>$search,'search_pid'=>$search_pid]]);
        return view('index',[
            'cate_one'=>$cate_one,
            'cate_two'=>$cate_two,
            'cate_three'=>$cate_three,
            'data'=>$data,
            'search'=>$search,
            'search_pid'=>$search_pid,
        ]);
    }
}
