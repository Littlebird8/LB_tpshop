<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:62:"E:\PHP\tpshop\public/../application/admin\view\role\index.html";i:1541320723;s:48:"E:\PHP\tpshop\application\admin\view\layout.html";i:1542095099;}*/ ?>
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
            <h1 class="page-title">角色列表</h1>
        </div>

        <div class="well">
        <a class="btn btn-primary" href="<?php echo url('create'); ?>">新增</a>
            <!-- table -->
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>用户组(角色名称)</th>
                        <th>权限ids</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($data as $v): ?>
                    <tr class="success">
                        <td><?php echo $v['id']; ?></td>
                        <td><?php echo $v['role_name']; ?></td>
                        <td><?php echo $v['role_auth_ids']; ?></td>
                        <td>
                            <a href="<?php echo url('admin/role/setauth',['id'=>$v['id']]); ?>"> 分派权限 </a>
                            <a href="<?php echo url('admin/role/edit',['id'=>$v['id']]); ?>"> 编辑 </a>
                            <a href="javascript:void(0);" onclick="if(confirm('确认删除？')) location.href='<?php echo url('delete',['id'=>$v['id']]); ?>'"> 删除 </a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <!-- pagination -->
            
        </div>
        <!-- footer -->
        <footer>
            <hr>
            <p>© 2017 <a href="javascript:void(0);" target="_blank">ADMIN</a></p>
        </footer>
    </div>

</body>
</html>