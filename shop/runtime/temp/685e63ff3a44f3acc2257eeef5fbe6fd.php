<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:64:"E:\PHP\tpshop\public/../application/admin\view\goods\create.html";i:1541501395;s:48:"E:\PHP\tpshop\application\admin\view\layout.html";i:1542095099;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/static/admin/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="/static/admin/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/admin/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <script src="/static/admin/js/jquery-1.8.1.min.js"></script>
    <script src="/static/admin/js/bootstrap.min.js"></script>

</head>
<body>
    <!-- 上 -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav pull-right">
                    <li id="fat-menu" class="dropdown">
                        <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user icon-white"></i><?php echo \think\Session::get('loginInfo.username'); ?>
                            <i class="icon-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="<?php echo url('admin/manager/editpwd'); ?>">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="<?php echo url('admin/login/logout'); ?>">安全退出</a></li>
                        </ul>
                    </li>
                </ul>
                <a class="brand" href="index.html"><span class="first">后台管理系统</span></a>
                <ul class="nav">
                    <li class="active"><a href="javascript:void(0);">首页</a></li>
                    <li><a href="<?php echo url('admin/manager/index'); ?>">权限管理</a></li>
                    <li><a href="<?php echo url('admin/login/login'); ?>">登录</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 左 -->
    <div class="sidebar-nav">
        <?php foreach($base_one as $k=>$baseone): ?>
            <a href="#error-menu<?php echo $k; ?>" class="nav-header collapsed" data-toggle="collapse">
                <i class="icon-exclamation-sign"></i><?php echo $baseone['auth_name']; ?></a>
            <ul id="error-menu<?php echo $k; ?>" class="nav nav-list collapse in">
                <?php foreach($base_two as $v): if($v['pid']==$baseone['id']): ?>
                    <li><a href="<?php echo url($v['auth_c'].'/'.$v['auth_a']); ?>"><?php echo $v['auth_name']; ?></a></li>
                    <?php endif; endforeach; ?>
            </ul>
        <?php endforeach; ?>
        
    </div> 
        <title>后台管理系统</title>
    <script type="text/javascript" charset="utf-8" src="/plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/plugins/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
    <!-- 右 -->
    <div class="content">
        <div class="header">
            <h1 class="page-title">商品新增</h1>
        </div>
        
        <!-- add form -->
        <form action="<?php echo url('save'); ?>" method="post" id="tab" enctype="multipart/form-data">
            <ul class="nav nav-tabs">
              <li role="presentation" class="active"><a href="#basic" data-toggle="tab">基本信息</a></li>
              <li role="presentation"><a href="#desc" data-toggle="tab">商品描述</a></li>
              <li role="presentation"><a href="#attr" data-toggle="tab">商品属性</a></li>
              <li role="presentation"><a href="#pics" data-toggle="tab">商品相册</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="basic">
                    <div class="well">
                        <label>商品名称：</label>
                        <input type="text" name="goods_name" value="" class="input-xlarge">
                        <label>商品价格：</label>
                        <input type="text" name="goods_price" value="" class="input-xlarge">
                        <label>商品数量：</label>
                        <input type="text" name="goods_number" value="" class="input-xlarge">
                        <label>商品logo：</label>
                        <input type="file" name="goods_logo" value="" class="input-xlarge">
                        <label>商品分类：</label>
                        <select name="" class="input-xlarge" id='cate_one'>
                            <option value="">请选择一级分类</option>
                            <?php foreach($category_one as $v): ?>
                                <option value="<?php echo $v['id']; ?>"><?php echo $v['cate_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <select name="" class="input-xlarge" id='cate_two'>
                            <option value="">请选择二级分类</option>
                        </select>
                        <select name="cate_id" class="input-xlarge" id='cate_three'>
                            <option value="">请选择三级分类</option>
                        </select>
                    </div>
                </div>
                <div class="tab-pane fade in" id="desc">
                    <div class="well">
                        <label>商品简介：</label>
                        <!--修改富文本编辑器-->
                        <textarea name="goods_introduce" id="editor" style="width:800px;height:300px;" class="input-xlarge"></textarea>
                    </div>
                </div>
                <div class="tab-pane fade in" id="attr">
                    <div class="well">
                        <label>商品类型：</label>
                        <select name="type_id" class="input-xlarge">
                            <option value="">请选择商品类型</option>
                            <?php foreach($type as $v): ?>
                                <option value="<?php echo $v['id']; ?>"><?php echo $v['type_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <div id='goods_item'>
                            
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="pics">
                    <div class="well">
                        <div>[<a href="javascript:void(0);" class="add">+</a>]商品图片：<input type="file" name="goods_pics[]" value="" class="input-xlarge"></div>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">保存</button>
            </div>
        </form>
        <!-- footer -->
        <footer>
            <hr>
            <p>© 2017 <a href="javascript:void(0);" target="_blank">ADMIN</a></p>
        </footer>
    </div>
    <script type="text/javascript">
        $(function(){
            //富文本编辑器
            var ue = UE.getEditor('editor');
            $('.add').click(function(){
                var add_div = '<div>[<a href="javascript:void(0);" class="sub">-</a>]商品图片：<input type="file" name="goods_pics[]" value="" class="input-xlarge"></div>';
                $(this).parent().after(add_div);
            });
            $('.sub').live('click',function(){
                $(this).parent().remove();
            });
            
            //获取二级标签的内容
            $('#cate_one').change(function(){
                var id=$(this).val();
                    $('#cate_two').html('<option value="">请选择二级分类</option>');
                    $('#cate_three').html('<option value="">请选择三级分类</option>');
                if(id==''){
                    return;
                }
                $.ajax({
                    'url':"<?php echo url('admin/category/getallcate'); ?>",
                    'type':'post',
                    "data":{"id":id},
                    'dataType':'json',
                    'success':function(res){
                        var html='<option value="">请选择二级分类</option>';
                        if(res.code!=10000){
                            alter(res.msg);return;
                        }
                        $.each(res.data,function(i,v){
                            html+="<option value='"+v.id+"'>"+v.cate_name+"</option>";
                        });
                        $('#cate_two').html(html);
                    }
                });
            });
            //获取三级标签的内容
            $('#cate_two').change(function(){
                var id=$(this).val();
                $('#cate_three').html('<option value="">请选择三级分类</option>');
                if(id==''){
                    return;
                }
                $.ajax({
                    'url':"<?php echo url('admin/category/getallcate'); ?>",
                    'type':'post',
                    "data":{"id":id},
                    'dataType':'json',
                    'success':function(res){
                        var html='<option value="">请选择三级分类</option>';
                        if(res.code!=10000){
                            alter(res.msg);return;
                        }
                        $.each(res.data,function(i,v){
                            html+="<option value='"+v.id+"'>"+v.cate_name+"</option>";
                        });
                        $('#cate_three').html(html);
                    }
                });
            });
            
            //选择商品商品的属性
            $("select[name=type_id]").change(function(){
                $('#goods_item').html('');
                var type_id=$(this).val();
                if(type_id==''){
                    alert('请选择分类');return;
                }
                var data={'type_id':type_id};
                $.ajax({
                   'url':"<?php echo url('admin/attribute/getinfo'); ?>",
                   'type':'post',
                   'data':data,
                   'dataType':'json',
                   'success':function(res){
                       if(res.code!=10000){
                           alert(res.msg);return;
                       }
                       var data=res.data;
                       var html='';
                       $.each(data,function(i,v){
                           html+="<label>"+v.attr_name+"：</label>";
                           if(v.attr_input_type==0){
                               html+='<input type="text" name="attr_value['+v.id+'][]" value="" class="input-xlarge">';
                           }else if(v.attr_input_type==1){
                               html+='<select name="attr_value['+v.id+'][]">';
                               $.each(v.attr_values,function(index,value){
                                   html+='<option value="'+value+'">'+value+'</option>';
                               });
                               html+='</select>';
                           }else{
                               
                               $.each(v.attr_values,function(index,value){
                                   html+='<input type="checkbox" name="attr_value['+v.id+'][]" value="'+value+'">'+value;
                               });
                           }
                       });
                       //将拼接好的html加到页面中显示
                       $('#goods_item').html(html);
                   }
                });
            });
        });
    </script>

</body>
</html>