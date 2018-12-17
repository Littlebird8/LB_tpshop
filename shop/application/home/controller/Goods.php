<?php

namespace app\home\controller;

use think\Controller;
use think\Request;

class Goods extends Base
{
    public function index()
    {
        $id=request()->param('id')?:0;
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        //根据cate_id $id 获取商品的分类
        $goods_list=\app\home\model\Goods::where('cate_id',$id)->order('id desc')->paginate(5);
        $cate_name= \app\home\model\Category::where('id',$id)->value('cate_name');

        return view('index',['goods_list'=>$goods_list,'cate_name'=>$cate_name]);
    }
    /**
     * 显示商品详情页
     *
     * @return \think\Response
     */
    public function detail($id)
    {
        //$id为商品的ID，首先验证ID的有效性
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        $goods_info= \app\home\model\Goods::find($id)->toArray();
        $pics_info= \app\home\model\Goodspics::where('goods_id',$id)->select();
        $attr_info= \app\home\model\Attribute::where('type_id',$goods_info['type_id'])->select();
        $goodsattr= \app\home\model\GoodsAttr::where('goods_id',$id)->select();
        $goodsattr_info=[];
        $pics_info=(new \think\Collection($pics_info))->toArray();
        $attr_info=(new \think\Collection($attr_info))->toArray();
        $goodsattr=(new \think\Collection($goodsattr))->toArray();

        foreach($goodsattr as $v){
            $goodsattr_info[$v['attr_id']][]=$v;
        }
        foreach($attr_info as $v){
            if(!isset($goodsattr_info[$v['id']])){
                $goodsattr_info[$v['id']][0]='';
            }
        }
        return view('detail',[
            'goods_info'=>$goods_info,
            'pics_info'=>$pics_info,
            'attr_info'=>$attr_info,
            'goodsattr_info'=>$goodsattr_info,
        ]);
    }

}
