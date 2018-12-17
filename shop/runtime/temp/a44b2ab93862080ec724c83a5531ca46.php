<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:63:"E:\PHP\tpshop\public/../application/admin\view\type\create.html";i:1541416942;s:48:"E:\PHP\tpshop\application\admin\view\layout.html";i:1542095099;}*/ ?>
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
    
    <!-- 右 -->
    <div class="content">
        <div class="header">
            <h1 class="page-title">商品类型新增</h1>
        </div>

        <div class="well">
            <!-- add form -->
            <form id="tab" action="<?php echo url('save'); ?>" method="post">
                <label>类型名称：</label>
                <input type="text" name="type_name" value="" class="input-xlarge">
                
                <label></label>
                <button class="btn btn-primary" type="submit">保存</button>
            </form>
        </div>
        <!-- footer -->
        <footer>
            <hr>
            <p>© 2017 <a href="javascript:void(0);" target="_blank">ADMIN</a></p>
        </footer>
    </div>

</body>
</html>