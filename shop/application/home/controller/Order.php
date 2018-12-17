<?php
namespace app\home\controller;
use think\Controller;
use think\Request;
class Order extends Base
{
    //创建结算列表
    public function create()
    {
        $data=request()->param('cart_ids');
        //判定是否登录
        if(!session('?user_info')){
            session('url',"home/cart/index");
            $this->redirect('home/login/login');
        }
        //查询地址信息
        $user_id=session('user_info.id');
        $address= \app\home\model\Address::where('user_id',$user_id)->select();
        $address=(new \think\Collection($address))->toArray();
        //获取配置文件中的支付方式
        $pay_type=config('pay_type');
        //获取商品信息并展示在列表
        $goods_info= \app\home\model\Cart::alias('t1')->join('tpshop_goods t2','t1.goods_id=t2.id','left')
                ->where('t1.user_id',$user_id)->where('t1.id','in',$data)->field('t1.*,t2.goods_name,t2.goods_price,t2.goods_logo')->select();
        //求出总数量和总金额
        $goods_info=(new \think\Collection($goods_info))->toArray();
        $total_number=0;
        $total_price=0;
        foreach($goods_info as $v){
            $total_number+=$v['number'];
            $total_price+=$v['number']*$v['goods_price'];
        }
        return view('create',['address'=>$address,
                              'pay_type'=>$pay_type,
                              'goods_info'=>$goods_info,
                              'total_number'=>$total_number,
                              'total_price'=>$total_price,
                ]);
    }
    //提交订单后自行操作
    //1.保存到order表单
    //2.保存到order_goods表单中
    //3.删除cart中的数据
    //4.判断库存，然后写入数据后，将goods表中的数据删除
    public function savepay(){
        //接收数据，并验证数据
        $data=request()->param();
//        //获取地址，并将地址写入数据库
////        $str='{"consignee":"a","address":"s","phone":"d"}';
//        $str=$data['address'];
//        $address= json_decode($str,true);
//        var_dump($address);
//        var_dump($data);
//        die;
        //验证数据
        $rule=[
            'cart_ids'=>'require',
            'address_id'=>'require',
            'pay_type'=>'require',
        ];
        $msg=[
            'cart_ids.require'=>'参数错误',
            'address_id.require'=>'参数错误',
            'pay_type.require'=>'参数错误',
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
        //数据验证没有问题时，需要将数据写入数据表中
        $user_id=session('user_info.id');
        $address= \app\home\model\Address::find($data['address_id'])->toArray();
        //获取商品信息并展示在列表
        $goods_info= \app\home\model\Cart::alias('t1')->join('tpshop_goods t2','t1.goods_id=t2.id','left')
                ->where('t1.user_id',$user_id)->where('t1.id','in',$data)->field('t1.*,t2.goods_name,t2.goods_price,t2.goods_logo,t2.goods_number')->select();
        //写入数据之前一定要检测下是否库存充足
        $stock=[];      //格式['id'=>['goods_number'=>,'buy_number']]
        foreach($goods_info as $v){
            if(isset($stock[$v['goods_id']])){
                $stock[$v['goods_id']]['buy_number']+=$v['number'];
            }else{
                $stock[$v['goods_id']]=[
                'goods_number'=>$v['goods_number'],
                'buy_number'=>$v['number']
                ];
            }
        }
        foreach($stock as $v){
            if($v['goods_number']<$v['buy_number']){
                $this->error('库存不足','cart/index');
            }
        }
        \think\Db::startTrans();
    try{
        //写入order表单
        $order_sn=time().mt_rand(100000, 999999);
        $order_amount=0;
        foreach($goods_info as $v){
            $order_amount+=$v['number']*$v['goods_price'];
        }
        $order=[
            'order_sn'=>$order_sn,
            'order_amount'=>$order_amount,
            'user_id'=>$user_id,
            'consignee_name'=>$address['consignee'],
            'consignee_phone'=>$address['phone'],
            'consignee_address'=>$address['address'],
            'shipping_type'=>'Yuantong',
            'pay_type'=>$data['pay_type']
        ];
        $order_info=\app\home\model\Order::create($order);
        //写入order_goods表中
        $order_goods=[];
        foreach($goods_info as $v){
            $row=[
                'order_id'=>$order_info['id'],
                'goods_id'=>$v['id'],
                'goods_name'=>$v['goods_name'],
                'goods_price'=>$v['goods_price'],
                'goods_logo'=>$v['goods_logo'],
                'number'=>$v['number'],
                'goods_attr_ids'=>$v['goods_attr_ids'],
            ];
            $order_goods[]=$row;
        }
        $order_goodsinfo=new \app\home\model\OrderGoods();
        $order_goodsinfo->saveAll($order_goods);
        //扣减商品表中的库存
        $updatenum=[];
        foreach($stock as $k=>$v){
            $row=[
                'id'=>$k,
                'goods_number'=>$v['goods_number']-$v['buy_number']
                ];
            $updatenum[]=$row;
        }
        $update=new \app\home\model\Goods();
        $update->saveAll($updatenum);
        //删除cart表单中的数据
        \app\home\model\Cart::destroy($data['cart_ids']);
        \think\Db::commit();
    } catch (Exeception $e){
        \think\Db::rollback();
        $error=$e->getError();
        $this->error($error);
    }
        //进入支付流程
        switch($data['pay_type']){
            case'wechat':
                    $this->error('暂时不支持');
                break;
            case'card':$this->error('暂时不支持');break;
            case'cash':$this->error('暂时不支持');break;
            default:
                $html="<form id='alipayment' action='/plugins/alipay/pagepay/pagepay.php' method='post' style='display:none'> "
                    . "<input id='WIDout_trade_no' name='WIDout_trade_no' value='$order_sn' />"
                    . "<input id='WIDsubject' name='WIDsubject' value='品优购商城订单' />"
                    . "<input id='WIDtotal_amount' name='WIDtotal_amount' value='$order_amount' />"
                    . "<input id='WIDbody' name='WIDbody' value='请付款，但是就是不发货' /></form>"
                    . "<script>document.getElementById('alipayment').submit()</script>";
                echo $html;
        }
    }
    //同步请求
    public function backreturn(){
        //以下代码copy来自alipay的return页面并修改
        require_once("./plugins/alipay/config.php");
        require_once './plugins/alipay/pagepay/service/AlipayTradeService.php';
        $arr=request()->param();
        $alipaySevice = new \AlipayTradeService($config);
        $result = $alipaySevice->check($arr);
        if($result) {//验证成功
            //商户订单号
            $order_sn = htmlspecialchars($arr['out_trade_no']);
            //商户总金额
            $order_amount = htmlspecialchars($arr['total_amount']);
            $order= \app\home\model\Order::where('order_sn',$order_sn)->find();
            if($order&&$order_amount==$order['order_amount']){
                return view('paysuccess',['total_amount'=>$order_amount]);
            }else{
                return view('payfail',['msg'=>'支付失败：支付金额不对']);
            }
         }else{
                return view('payfail',['msg'=>'支付失败：支付宝验证错误']);
         }
    }
    //异步请求
    public function backnotify(){
        require_once './plugins/alipay/config.php';
        require_once './plugins/alipay/pagepay/service/AlipayTradeService.php';

        $arr=request()->param();
        $alipaySevice = new \AlipayTradeService($config);
        $result = $alipaySevice->check($arr);
        if($result) {//验证成功
            if($arr['trade_status'] == 'TRADE_FINISHED') {
                echo "success";	die;
            }
            if($arr['trade_status'] == 'TRADE_SUCCESS') {
                $order_sn = htmlspecialchars($arr['out_trade_no']);
                $order_amount = htmlspecialchars($arr['total_amount']);
                $order= \app\home\model\Order::where('order_sn',$order_sn)->find();
                if($order_amount==$order['order_amount']&&$order['pay_status']==0){
                    $order->pay_statue=1;
                    $order->save();
                    echo "success";die;
                }
            }
        }
        echo "fail";
    }
}
