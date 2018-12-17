<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:71:"E:\PHP\tpshop\public/../application/home\view\login\register_email.html";i:1541759595;}*/ ?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<title>个人注册</title>

    <link rel="stylesheet" type="text/css" href="/static/home/css/all.css" />
    <link rel="stylesheet" type="text/css" href="/static/home/css/pages-register.css" />
    
	<script type="text/javascript" src="/static/home/js/all.js"></script>
	<script type="text/javascript" src="/static/home/js/pages/register.js"></script>
</head>

<body>
	<div class="register py-container ">
		<!--head-->
		<div class="logoArea">
			<a href="" class="logo"></a>
		</div>
		<!--register-->
		<div class="registerArea">
			<h3>注册新用户<span class="go">我有账号，去<a href="login.html" target="_blank">登陆</a></span></h3>
			<div class="info">
				<form class="sui-form form-horizontal" action="<?php echo url('login/registeremail'); ?>" method="post">
					<div class="control-group">
						<label class="control-label">邮箱：</label>
						<div class="controls">
							<input type="text" id="email" name="email" placeholder="请输入你的邮箱" class="input-xfat input-xlarge">
							<span class="error"></span>
						</div>
					</div>
					<div class="control-group">
						<label for="inputPassword" class="control-label">登录密码：</label>
						<div class="controls">
							<input type="password" name="password" placeholder="设置登录密码" class="input-xfat input-xlarge">
							<span class="error"></span>
						</div>
					</div>
					<div class="control-group">
						<label for="inputPassword" class="control-label">确认密码：</label>
						<div class="controls">
							<input type="password" name="repassword" placeholder="再次确认密码" class="input-xfat input-xlarge">
							<span class="error"></span>
						</div>
					</div>
					<div class="control-group">
						<label for="inputPassword" class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<div class="controls">
							<input name="m1" type="checkbox" value="2" checked=""><span>同意协议并注册《品优购用户协议》</span>
							<span class="error"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
						<div class="controls btn-reg">
							<a class="sui-btn btn-block btn-xlarge btn-danger reg-btn" href="javascript:;" target="_blank">完成注册</a>
						</div>
					</div>
				</form>
				<div class="clearfix"></div>
			</div>
		</div>
		<!--foot-->
		<div class="py-container copyright">
			<ul>
				<li>关于我们</li>
				<li>联系我们</li>
				<li>联系客服</li>
				<li>商家入驻</li>
				<li>营销中心</li>
				<li>手机品优购</li>
				<li>销售联盟</li>
				<li>品优购社区</li>
			</ul>
			<div class="address">地址：北京市昌平区建材城西路金燕龙办公楼一层 邮编：100096 电话：400-618-4000 传真：010-82935100</div>
			<div class="beian">京ICP备08001421号京公网安备110108007702
			</div>
		</div>
	</div>
	<script>
		$(function(){
			//注册
			$('.reg-btn').click(function(){
				var flag=0;
				var email=$('#email').val();
				var pattern_mail=/^\w[\w\.-]*@[0-9a-z][0-9a-z-]*(\.[a-z])*(\.[a-z]{2,6})$/i;
				if(email==''){
					$('#email').next().html('邮箱不能为空');
					flag++;
				}else if(!pattern_mail.test(email)){
					$('#email').next().html('邮箱格式不正确');
					flag++;
				}else{
					$('#email').next().html('');
				}
				
				var password=$('input[name=password]').val();
				if(password==''){
					$('input[name=password]').next().html('密码不能为空');
					flag++;
				}else{
					$('input[name=password]').next().html('');
				}

				var repassword=$('input[name=repassword]').val();
				if(repassword==''){
					$('input[name=repassword]').next().html('确认密码不能为空');
					flag++;
				}else if(password!=repassword){
					$('input[name=repassword]').next().html('两次输入密码不一致');
					flag++;
				}else{
					$('input[name=repassword]').next().html('');
				}

				var checked=$(':checkbox').prop('checked');
				if(!checked){
					$(':checkbox').closest('div').find('span').html('请阅读《品优购用户协议》');
					flag++;
				}else{
					$(':checkbox').closest('div').find('span:last').html('');
				}

				if(!flag){
					$('form').submit();
				}
				
			});
		})
	</script>
</body>

</html>