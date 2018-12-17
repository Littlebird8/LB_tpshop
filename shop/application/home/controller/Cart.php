<?php
namespace app\home\controller;
class Cart extends Base
{
     //我的购物车
    public function index(){
        //获取到根据登录信息获取到购物车信息
        $info=\app\home\model\Cart::getcatinfo();
        //将商品信息和商品属性的信息全部写到数组中去
        //获取商品的id,并将商品信息匹配到info中去
        $goods_ids=[];
        $attr_ids=[];
        foreach($info as $v){
            $goods_ids[]=$v['goods_id'];
            $attr_ids= array_merge($attr_ids, explode(',', $v['goods_attr_ids']));
        }
        //去掉重复的元素
        $goods_ids= array_unique($goods_ids);
        $attr_ids= array_unique($attr_ids);
        //查询商品信息
        $goods_infos=\app\home\model\Goods::where('id','in',$goods_ids)->select();
        $goods_infos= (new \think\Collection($goods_infos))->toArray();
        //将goods_infos的格式转化为id=>一条信息
        $newgoods_infos=[];
        foreach($goods_infos as $k=>$v){
            $newgoods_infos[$v['id']]=$v;
        }
        //查询属性信息
        $attr_infos= \app\home\model\GoodsAttr::showattr($attr_ids);
        //将$attr_infos的格式转化为id=>一条信息
        $newattr_infos=[];
        foreach($attr_infos as $k=>$v){
            $newattr_infos[$v['id']]=$v;
        }
        //将$info中的goods_id和goods_attrs中新增商品和商品属性信息
        foreach($info as $k=>$v){
            $info[$k]['goods_infos']=$newgoods_infos[$v['goods_id']];
            $tem=[];
            foreach(explode(',',$v['goods_attr_ids']) as $ids){
                $tem[]=$newattr_infos[$ids];
            }
            $info[$k]['attr_infos']=$tem;
        }
        //删除数据表中不必要的字段，应该在查询时，就不要查询那么多的字段
        foreach($info as &$v){
            unset($v['create_time']);
            unset($v['update_time']);
            unset($v['delete_time']);
                unset($v['goods_infos']['create_time']);
                unset($v['goods_infos']['update_time']);
                unset($v['goods_infos']['delete_time']);
                foreach($v['attr_infos'] as &$value){
                    unset($value['create_time']);
                    unset($value['update_time']);
                    unset($value['delete_time']);  
                }     
        }
        unset($v);
        unset($value);
        return $this->fetch('index',['info'=>$info]);
    }
    //商品已成功加入购物车
    public function addcart(){
        if(request()->isGet()){
            $this->redirect('home/index/index');
        }
        //接受数据
        $data=request()->param();
        //对数据进行验证
        $rule=[
            'goods_id'=>'require',
            'number'=>'require|integer',
            'goods_attr_ids'=>'require',
        ];
        $msg=[
            'goods_id.require'=>'参数错误',
            'number.require'=>'参数错误',
            'number.integer'=>'参数错误',
            'goods_attr_ids.require'=>'参数错误',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        //显示在成功加入购物车页面的信息
        \app\home\model\Cart::addcart($data['goods_id'],$data['goods_attr_ids'],$data['number']);
        $goods_info= \app\home\model\Goods::where('id',$data['goods_id'])->find();
        $attr_info= \app\home\model\GoodsAttr::showattr($data['goods_attr_ids']);
        return $this->fetch('addcart',['goods_info'=>$goods_info,'attr_info'=>$attr_info]);
    }
    //当页面点击加号减号或者手动修改的时候，实现数据写入数据库或者cookie中
    public function updatenumber(){
       $date1= microtime(true);
        $data= request()->param();
        //验证数据
         $rule=[
            'goods_id'=>'require',
            'number'=>'require|integer',
            'goods_attr_ids'=>'require',
        ];
        $msg=[
            'goods_id.require'=>'参数错误',
            'number.require'=>'参数错误',
            'number.integer'=>'参数错误',
            'goods_attr_ids.require'=>'参数错误',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $res=[
                'code'=>10001,
                'msg'=>'参数错误'
            ];
            return json($res);
        }
        //将数据写入数据库或者cookie中
        \app\home\model\Cart::updatenumber($data['goods_id'], $data['goods_attr_ids'], $data['number']);
      $date2= microtime(true);
        $res=[
                'code'=>10000,
                'msg'=>'修改成功',
                'date'=>[$date2,$date1]
        ];
        return json($res);
    }
     public function del(){
        $data= request()->param();
        //验证数据
         $rule=[
            'goods_id'=>'require',
            'goods_attr_ids'=>'require',
        ];
        $msg=[
            'goods_id.require'=>'参数错误',
            'goods_attr_ids.require'=>'参数错误',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $res=[
                'code'=>10001,
                'msg'=>'参数错误'
            ];
            return json($res);
        }
//        //将数据写入数据库或者cookie中
//        dump($data);
//        die;
        \app\home\model\Cart::del($data['goods_id'], $data['goods_attr_ids']);
//        $date2= microtime(true);
        $res=[
                'code'=>10000,
                'msg'=>'删除成功',
//                'date'=>[$date2,$date1]
        ];
        return json($res);
    }
}