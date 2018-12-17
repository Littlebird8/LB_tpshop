<?php

namespace app\home\model;

use think\Model;

class GoodsAttr extends Model
{
    //展示商品的属性信息
    public static function showattr($goods_attr_ids){
        //根据商品属性的id获取商品的属性名称和属性值
        $attr=self::alias('t1')->field('t1.*,t2.attr_name')->join('tpshop_attribute t2','t1.attr_id=t2.id','left')->where('t1.id','in',$goods_attr_ids)->select();
        return (new \think\Collection($attr))->toArray();
    }
}
