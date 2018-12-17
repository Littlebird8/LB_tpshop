<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Attribute extends Base
{
    //展示列表
    public function index()
    {
        //将数据表中的数据查出并展示到页面，其中把商品的type_name也一起展示出来
        $list=\app\admin\model\Attribute::alias('t1')->field('t1.*,t2.type_name')
                ->join('tpshop_type t2','t1.type_id=t2.id','left')->select();
        return view('index',['list'=>$list]);
    }
    public function create()
    {
        $type= \app\admin\model\Type::select();
        return view('create',['type'=>$type]);
    }
    public function save(Request $request)
    {
        $data=$request->param();
        //数据验证
        $rule=[
            'attr_name'=>'require|max:100',
            'type_id'=>'require|integer',
            'attr_type'=>'require|integer',
            'attr_input_type'=>'require'
        ];
        $msg=[
            'attr_name.require'=>'属性名称不能为空',
            'attr_name.max'=>'属性名称最大100个字符',
            'type_id.require'=>'商品类型不能为空',
            'type_id.integer'=>'商品类型参数错误',
            'attr_type.require'=>'属性类型不能为空',
            'attr_type.integer'=>'属性类型参数错误',
            'attr_input_type.require'=>'录入方式不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        //将字符串中可能出现的中文逗号改为英文
        $data['attr_values']=str_replace('，',',', $data['attr_values']);
        $data['attr_values']= rtrim($data['attr_values'],',');
//        //确定下该商品类型有无商品，无商品才可添加
//        $exeit= \app\admin\model\Goods::where('type_id',$data['type_id'])->select();
//        if($exeit){
//            $this->error('该分类下已有商品，请先更新商品信息，再增加属性');
//        }
        //保存数据
        \app\admin\model\Attribute::create($data,true);
        //页面跳转
        $this->success('添加成功,请修改商品的属性信息','index');
    }
    //编辑
    public function edit($id)
    {
        //判定ID
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        $type= \app\admin\model\Type::select();
        $list=\app\admin\model\Attribute::alias('t1')->field('t1.*,t2.type_name')
                ->join('tpshop_type t2','t1.type_id=t2.id','left')->find($id);
        $list=$list->getData();
        return view('edit',['list'=>$list,'type'=>$type]);
    }
    //更新
    public function update(Request $request, $id)
    {
        //验证id
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        $data=$request->param();
        //数据验证
        $rule=[
            'attr_name'=>'require|max:100',
            'type_id'=>'require|integer',
            'attr_type'=>'require|integer',
            'attr_input_type'=>'require'
        ];
        $msg=[
            'attr_name.require'=>'属性名称不能为空',
            'attr_name.max'=>'属性名称最大100个字符',
            'type_id.require'=>'商品类型不能为空',
            'type_id.integer'=>'商品类型参数错误',
            'attr_type.require'=>'属性类型不能为空',
            'attr_type.integer'=>'属性类型参数错误',
            'attr_input_type.require'=>'录入方式不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        //将字符串中可能出现的中文逗号改为英文
        $data['attr_values']=str_replace('，',',', $data['attr_values']);
        //保存数据
        \app\admin\model\Attribute::update($data,[],true);
        //页面跳转
        $this->success('修改成功','index');
    }
    //删除
    public function delete($id)
    {
        //验证id
        if(!verify_id($id)){
            $this->error('参数错误');
        }
        \app\admin\model\Attribute::destroy($id);
        $this->success('删除成功','index');
    }
    //获取信息提供给goods create/edit表使用
    public function getinfo(){
         //判定ID
        $type_id= request()->param('type_id');
        if(!verify_id($type_id)){
            $res=[
                'code'=>10001,
                'msg'=>'参数错误'
            ];
            return json($res);
        }
        $data= \app\admin\model\Attribute::where('type_id',$type_id)->select();
        //尽量不使用传址引用，否则要销毁变量
        foreach($data as $k=>$v){
            $data[$k]=$v->getData();
            $data[$k]['attr_values']= explode(',', $v['attr_values']);
        }
        return json([
            'code'=>10000,
            'msg'=>'success',
            'data'=>$data,
        ]);
    }
}
