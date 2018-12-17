<?php

namespace app\home\model;

use think\Model;

class Cart extends Model
{
    use \traits\model\SoftDelete;
    //添加一条购物车信息
    public static function addcart($goods_id,$goods_attr_ids,$number){
        //判定是否登录
        if(session('?user_info')){
            //已经登录，将数据保存到数据库
            $where=[
            'goods_id'=>$goods_id,
            'goods_attr_ids'=>$goods_attr_ids,
            'user_id'=>session('user_info.id')
             ];
            //判定数据表中是否已有数据
            $data=self::where($where)->find();
            if($data){
                $data->number=$number;
                $data->save();
            }else{
                $where['number']=$number;
                self::create($where);
            }
        }else{
            //未登录
            //取出cookie中的数据，并对数据进行编辑
            $data= cookie('cart')? unserialize(cookie('cart')):[];
            if(isset($data[$goods_id.'-'.$goods_attr_ids])){
                $data[$goods_id.'-'.$goods_attr_ids]+=$number;
            }else{
                $data[$goods_id.'-'.$goods_attr_ids]=$number;
            }
            cookie('cart', serialize($data),7*24*3600);
        }
        return true;
    } 
    //获取购物车的信息
    public static function getcatinfo(){
        //判断是否已经登录
        if(session('?user_info')){
            //登录状态
            $data= self::where('user_id',session('user_info.id'))->select();
            $data= (new \think\Collection($data))->toArray();
        }else{
            //从cookie中获取信息
            $info=cookie('cart')?unserialize(cookie('cart')):[];
            $data=[];
            //cookie中保存的信息为goods_id-goods_attr_ids=>number,对数据进行转化
            foreach($info as $k=>$v){
                $data[]=[
                    'id'=>'',
                    'goods_id'=>explode('-',$k)[0],
                    'goods_attr_ids'=>explode('-',$k)[1],
                    'number'=>$v
                ];
            }
        }
        return $data;
    }
    
    //登录时将cookie中的信息写入数据库
    public static function cookietodb(){
        $info=cookie('cart')?unserialize(cookie('cart')):[];
        foreach($info as $k=>$v){
            $goods_id=explode(',',$k)[0];
            $goods_attr_ids=explode(',',$k)[1];
            $number=$v;
            self::addcart($goods_id,$goods_attr_ids,$number);
        }
        cookie('cart',null);
    }
    
    //当购物车页面点击加号减号或者手动输入时，写入数据库
    public static function updatenumber($goods_id,$goods_attr_ids,$number){
        //判定是否已经登录
        if(session('?user_info')){
            //登陆了，更新数据表信息
            $where=[
                'goods_id'=>$goods_id,
                'goods_attr_ids'=>$goods_attr_ids,
                'user_id'=>session('user_info.id')
            ];
            self::update(['number'=>$number],$where);
        }else{
            //未登录，将cookie信息取出，并添加cookie信息
            $data= cookie('cart')? unserialize(cookie('cart')):'';
            $data[$goods_id.'-'.$goods_attr_ids]=$number;
            cookie('cart',$data,7*24*3600);
        }
        return true;
    }
    //当购物车页面点击删除时，删除数据库
    public static function del($goods_id,$goods_attr_ids){
        //判定是否已经登录
        if(session('?user_info')){
            //登陆了，更新数据表信息
            $where=[
                'goods_id'=>$goods_id,
                'goods_attr_ids'=>$goods_attr_ids,
                'user_id'=>session('user_info.id')
            ];
            self::destroy($where);
        }else{
            //未登录，将cookie信息取出，并添加cookie信息
            $data= cookie('cart')? unserialize(cookie('cart')):'';
            unset($data[$goods_id.'-'.$goods_attr_ids]);
            cookie('cart',$data,7*24*3600);
        }
        return true;
    }
    //计算购物车的数量
    public static function countnum(){
        //判定是否登录
        if(session('?user_info')){
            //如果是登录状态
            $user_id=session('user_info.id');
            $num=self::where('user_id',$user_id)->count('id');
        }
//        }else{
//            $data=cookie('cart')?unserialize(cookie('cart')):[];
//            $num=0;
//            foreach($data as $v){
//                $num++;
//            }
//        }
            $num=0;
        return $num;
    }
}
