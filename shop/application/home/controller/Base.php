<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{
    public function __construct(Request $request = null) {
        parent::__construct($request);
        //获取标签栏并展示到页面
        $this->getbasecategory();
    }
    //获取标签栏并展示到页面
    private function getbasecategory(){
        $base_cate= \app\home\model\Category::field('id,cate_name,pid,is_show')->select();
        $base_cate=(new \think\Collection($base_cate))->toArray();
        $base_cate= get_cate_tree($base_cate);
        $cart_num=\app\home\model\Cart::countnum();
        $this->assign('base_cate',$base_cate);
        $this->assign('cart_num',$cart_num);
    }
}
