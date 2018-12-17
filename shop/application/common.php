<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

    // 密码加密
    if(!function_exists('encrypt_password')){
        function encrypt_password($data){
            $salt='addfasgfasfeasgfas';
            return md5(md5($data).$salt);
        }
    }
    //使用插件防止xss攻击
    if (!function_exists('remove_xss')) {
    //使用htmlpurifier防范xss攻击
    function remove_xss($string){
        //相对index.php入口文件，引入HTMLPurifier.auto.php核心文件
        require_once './plugins/htmlpurifier/HTMLPurifier.auto.php';
        // 生成配置对象
        $cfg = HTMLPurifier_Config::createDefault();
        // 以下就是配置：
        $cfg -> set('Core.Encoding', 'UTF-8');
        // 设置允许使用的HTML标签
        $cfg -> set('HTML.Allowed','div,b,strong,i,em,a[href|title],ul,ol,li,br,p[style],span[style],img[width|height|alt|src]');
        // 设置允许出现的CSS样式属性
        $cfg -> set('CSS.AllowedProperties', 'font,font-size,font-weight,font-style,font-family,text-decoration,padding-left,color,background-color,text-align');
        // 设置a标签上是否允许使用target="_blank"
        $cfg -> set('HTML.TargetBlank', TRUE);
        // 使用配置生成过滤用的对象
        $obj = new HTMLPurifier($cfg);
        // 过滤字符串
        return $obj -> purify($string);
    }
}
    
    //验证$id是否有效
    if(!function_exists('verify_id')){
        function verify_id($id){
            if(!preg_match('/^\d+$/', $id)){
                return false;
            }else{
                return true;
            }
        }
    }
    
    //树形结构
    if (!function_exists('getTree')) {
        //递归方法实现无限极分类
        function getTree($list,$pid=0,$level=0) {
            static $tree = array();
            foreach($list as $row) {
                if($row['pid']==$pid) {
                    $row['level'] = $level;
                    $tree[] = $row;
                    getTree($list, $row['id'], $level + 1);
                }
            }
            return $tree;
        }
    }
    
    //获取树形结构用于展示前台的分类展示
    if(!function_exists('get_cate_tree')){
        //递归方式实现 无限极分类树
        function get_cate_tree($list, $pid=0){
            $tree = array();
            foreach($list as $row) {
                if($row['pid']==$pid) {
                    $row['son'] = get_cate_tree($list, $row['id']);
                    $tree[] = $row;
                }
            }
            return $tree;
        }
    }
    
    //封装外部访问的功能
    if(!function_exists('curl_request')){
        function curl_request($url,$post=false,$param=[],$https=false){
            //初始化请求回话
            $ch = curl_init($url);
            //设置请求参数
            //确定请求方式
            if($post){
                curl_setopt($ch,CURLOPT_PORT, true);
                //如果是post请求，确定请求参数
                curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
            }
            //设置请求协议
            if($https){
                //如果请求协议为https,需要禁止验证本地客户端的证书
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            }
            //设置返回参数
            curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
            //执行请求
            $res= curl_exec($ch);
            //如果请求失败可通过如下代码获取错误信息
//            if(!$res){
//                $error=curl_error($ch);
//                dump($error);
//                die();
//            }
            //关闭请求会话
            curl_close($ch);
            //返回参数
            return $res;
        }
    }
    
    //封装发送短信验证的函数
    if(!function_exists('sendmsg')){
        function sendmsg($phone,$msg){
            //拼接请求路径
            $url=config('msg.path')."?mobile={$phone}&content={$msg}&appkey=".config('msg.appkey');
//            var_dump($url);  //打印路径
            //调用函数请求第三方
            $res=curl_request($url,true,[],true);
//            dump($res);  //打印第三方返回信息
            if(!$res){
                //如果返回数据为false代表请求失败
                return false;
            }
            
            $arr= json_decode($res,true);
            if($arr['code']==10000){
                //接收到的数据code为10000代表为发送成功
                return true;
            }else{
                //返回数不是10000还可以通过$arr['msg']来获取失败原因
                return false;
            }
        }
    }
    //封装发送邮箱的函数
    if(!function_exists('sendemail')){
        function sendmail($email,$subject,$body){
            $mail=new PHPMailer\PHPMailer\PHPMailer();
//            $mail->SMTPDebug = 2;             // 调试信息输出
            $mail->isSMTP();                     // Set mailer to use SMTP
            $mail->Host = config('email.host');  // 设置邮件服务地址
            $mail->SMTPAuth = true;                // Enable 开启 SMTP 认证
            $mail->Username = config('email.email');                 // SMTP username
            $mail->Password = config('email.password');                          // SMTP password
            $mail->SMTPSecure = 'tls';          // 安全加密方式Enable TLS encryption, `ssl` also accepted
            $mail->Port = 25;                  // 端口号TCP port to connect to
            $mail->CharSet = 'utf-8';                           //设置字符编码
            
            //Recipients
            $mail->setFrom(config('email.email'));          //发件人的账号
            $mail->addAddress($email);     // Add a recipient
//          $mail->addAddress('ellen@example.com');               // Name is optional
//          $mail->addReplyTo('info@example.com', 'Information');
//          $mail->addCC('cc@example.com');
//          $mail->addBCC('bcc@example.com');

            //Attachments
//          $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments添加附件
//          $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
            //Content
            $mail->isHTML(true);                     // 设置邮箱内容的格式Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body    = $body;
//            $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            if($mail->send()){
                return true;
            }else{
                return $mail->ErrorInfo;
            }          
        }
    }
    if(!function_exists('encrypt_phone')){
        function encrypt_phone($phone){
            return substr($phone,0,3).'****'.substr($phone,-4);
        }
    }