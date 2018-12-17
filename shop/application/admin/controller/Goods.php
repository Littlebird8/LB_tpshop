<?php
namespace app\admin\controller;
use think\Request;
use app\admin\model\Goods as GoodsModel;
class Goods extends Base
{
    public function index(){
        //实例化model对象，调用select方法
        $model=new \app\admin\model\Goods();
        $data=$model->order('id desc')->paginate(5);
        $this->assign('data',$data);
        return view();
        //用最短的代码实现功能
//        return view('index',['data'=> (\app\admin\model\Goods::select())]);
    }
    public function create(){
        //获取分类数据
        $category_one= \app\admin\model\Category::where('pid',0)->select();
        //获取商品类型
        $type= \app\admin\model\Type::select();
        return view('create',['category_one'=>$category_one,'type'=>$type]);
    }
    public function save(Request $request){
        //unlink('./uploads/20181103\19ebf439fbb95a44ec8400a30c43f4ac.jpg');die;
        $data=$request->param();
        //设定添加商品的rule
        //利用插件防止xss攻击
        $data['goods_introduce']=$request->param('goods_introduce','','remove_xss');
        $rule=[
            'goods_name'=>'require',
            'goods_price'=>'require|float|gt:0',
            'goods_number'=>'require|integer|gt:0',
            'cate_id'=>'require|integer|gt:0'
        ];
        //设定添加商品失败的msg
        $msg=[
            'goods_name.require'=>'商品不能为空',
            'goods_price.require'=>'商品价格不能为空',
            'goods_price.float'=>'商品价格格式不正确',
            'goods_price.gt'=>'商品价格必须大于0',
            'goods_number.require'=>'商品数量不能为空',
            'goods_number.integer'=>'商品数量为整数',
            'goods_number.gt'=>'商品数量必须大于0',
             'cate_id.require'=>'商品种类不能为空',
        ];
        //实例化validate
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        //接收图片
        $data['goods_logo']=$this->getLogo();
        $data=\app\admin\model\Goods::create($data,true);
        //保存相册
        $this->getpics($data->id);
        //保存商品属性信息
        $attr_info=request()->param();
        $attr_info=$attr_info['attr_value'];
        $rows=[];
        foreach($attr_info as $k=>$v){
            foreach($v as $value){
                $row=[
                   'goods_id'=> $data->id,
                    'attr_id'=>$k,
                    'attr_value'=>$value
                ];
                $rows[]=$row;
            }
        }
        $attr=new \app\admin\model\GoodsAttr();
        $attr->saveAll($rows);
        //页面跳转
        $this->success('添加成功','index');
    }
    //相册保存功能
    private function getpics($goods_id){
        $files=request()->file('goods_pics');
        $rows=[];
        foreach($files as $file){
            $info=$file->validate(['size'=>5*1024*1024,'ext'=>'jpg,jpeg,png,gif'])->move(ROOT_PATH.'public'.DS.'uploads');
            //获取文件的保存路径20181103/131312.jpg
            $path=$info->getSaveName();
            $path_arr= explode(DS, $path);
                //定义大图、小图的路径
            $pics_big=DS.'uploads'.DS.$path_arr[0].DS.'big_'.$path_arr[1];
            $pics_sma=DS.'uploads'.DS.$path_arr[0].DS.'small_'.$path_arr[1];
            //保存到数据库
            $image= \think\Image::open('.'.DS.'uploads'.DS.$path);
            $image->thumb(800,800)->save('.'.$pics_big);
            $image->thumb(400,400)->save('.'.$pics_sma);
                //unlink('.'.DS.'uploads'.DS.$path);
            $links='.'.DS.'uploads'.DS.$path;
            unset($info);
            unlink("$links");
            $row=[
                'goods_id'=>$goods_id,
                'pics_big'=>$pics_big,
                'pics_sma'=>$pics_sma
            ];
            $rows[]=$row;
        }
        $model=new \app\admin\model\Goodspics();
        $model->saveAll($rows);
    }
    private function getLogo(){
        $file=request()->file('goods_logo');
        if(!$file){
            $this->error('没有上传文件');
        }
        $info=$file->validate(['size'=>5*1024*1024,'ext'=>'jpg,png,jpeg,gif'])->move(ROOT_PATH.'public'.DS.'uploads');
        if($info){
            $path=DS.'uploads'.DS.$info->getSaveName();
            $img= \think\Image::open('.'.$path);
            $img->thumb(200,240)->save('.'.$path);
            return $path;
        }else{
            $error=$file->getError();
            $this->error($error);
        }
    }
    //搜索页面显示信息
    public function search(Request $request){
        //实例化model对象，调用select方法
        $goods_name=$request->param('search');
        $model=new \app\admin\model\Goods();
        $data=$model->where('goods_name','like',"%{$goods_name}%")->order('id desc')->paginate(5,false,['query'=>['search'=>$goods_name]]);
        //将搜索信息显示到页面上
        $this->assign('data',$data);
        $this->assign('goods_name',$goods_name);
        return view('index');
    }
    public function edit(){
        $id=request()->param('id');
        $data= \app\admin\model\Goods::find($id);
        //根据第三级的cate_id   $data['cate_id']获取父级id 和三级分类
        $three=\app\admin\model\Category::where('id',$data['cate_id'])->find();
        $three_all= \app\admin\model\Category::where('pid',$three['pid'])->select();
        $two=\app\admin\model\Category::where('id',$three['pid'])->find();
        $two_all= \app\admin\model\Category::where('pid',$two['pid'])->select();
        $one_all=  \app\admin\model\Category::where('pid',0)->select();
        //获取分类信息type
        $type= \app\admin\model\Type::select();
        //获取商品信息属性信息
        $attribute= \app\admin\model\Attribute::where('type_id',$data['type_id'])->select();
        //获取商品属性值
        $goods_attr= \app\admin\model\GoodsAttr::where('goods_id',$id)->select();
        foreach($goods_attr as $v){
            $ngoods_attr[$v['attr_id']][]=$v['attr_value'];
        }
        foreach($attribute as $k=>$v){
            $attribute[$k]=$v->getData();
            $attribute[$k]['attr_values']= explode(',', $v['attr_values']);
            //防止新增属性时报错
            if(!isset($ngoods_attr[$v['id']])){
                $ngoods_attr[$v['id']][0]='';
            }
        }
        //相册信息
        $goods_pics= \app\admin\model\Goodspics::where('goods_id',$id)->select();
        return view('edit',[
            'data'=>$data,
            'two'=>$two,
            'two_all'=>$two_all,
            'three_all'=>$three_all,
             'one_all'=>$one_all,
            'goods_pics'=>$goods_pics,
            'type'=>$type,
            'attribute'=>$attribute,
            'ngoods_attr'=>$ngoods_attr,
       ]);
    }
    public function update(){
        $request=request();
        $data=$request->param();
        $id=$data['id'];
        //防止富文本编辑器的xss攻击
        $data['goods_introduce']=$request->param('goods_introduce','','remove_xss');
        $rule=[
            'goods_name'=>'require',
            'goods_price'=>'require|float|gt:0',
            'goods_number'=>'require|integer|gt:0',
            'cate_id'=>'require|integer|gt:0'
        ];
        $msg=[
            'goods_name.require'=>'商品名字不能为空',
            'goods_name.max'=>'商品名字最大100字符',
            'goods_price.require'=>'商品价格不能为空',
            'goods_price.float'=>'商品价格格式不正确',
            'goods_price.gt'=>'商品价格必须大于0',
            'goods_number.require'=>'商品数量不能为空',
            'goods_number.integer'=>'商品数量格式不正确',
            'goods_number.gt'=>'商品数量必须大于0',
             'cate_id.require'=>'商品种类不能为空',
        ];
        $validate=new \think\Validate($rule,$msg);
        if(!$validate->check($data)){
            $error=$validate->getError();
            $this->error($error);
        }
        $file=request()->file('goods_logo');
        if($file){
            $data['goods_logo']=$this->getLogo();
        }
        GoodsModel::update($data,[],true);
         //保存相册
        $this->getpics($data['id']);
        //更新商品的信息
        $data=request()->param();
        $attr_value=$data['attr_value'];
        //删除数据表中的原来数据
        \app\admin\model\GoodsAttr::where('goods_id',$id)->delete();
        //添加新的数据
        $rows=[];
       foreach($attr_value as $k=>$v){
           foreach($v as $value){
               $row=[
                   'goods_id'=>$id,
                   'attr_id'=>$k,
                   'attr_value'=>$value
               ];
               $rows[]=$row;
           }
       }
        $attr=new \app\admin\model\GoodsAttr();
        $attr->saveAll($rows);
        //页面跳转
        $this->success('修改成功','index');
    }
    public function detail(){
        $request=request();
        $id=$request->param('id');
        $data= \app\admin\model\Goods::order('id desc')->find($id);
        return view('detail',['data'=>$data]);
    }
    //删除商品
    public function delete($id){
        GoodsModel::destroy($id);
        $this->success('删除成功','index');
    }
    //删除相册的图片
    public function deletepic($id){
        if(!preg_match('/^\d+$/', $id)){
            return json([
                'code'=>10001,
                'msg'=>'参数错误'
            ]);
        }else{
            $pic=\app\admin\model\Goodspics::find($id);
            \app\admin\model\Goodspics::destroy($id);
            unlink('.'.$pic['pics_big']);
            unlink('.'.$pic['pics_sma']);
            return json([
                'code'=>10000,
                'msg'=>'success'
            ]); 
        }
        
    }
}