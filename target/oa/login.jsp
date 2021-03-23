<%--
  Created by IntelliJ IDEA.
  User: liuxiaoxin
  Date: 2020/10/26
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>协同办公平台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/layui/css/layui.css"
          media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/login.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/verify.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>

    <script type="text/javascript">

        var ip = "";
        var address = "";

        //获取登陆地的IP地址
        $(function () {

            //获取IP
            ip = returnCitySN["cip"];
            // $('#logincity').val(returnCitySN["cname"]);
            $.ajax({
                url: 'http://api.map.baidu.com/location/ip?ak=ia6HfFL660Bvh43exmH9LrI6',
                type: 'POST',
                dataType: 'jsonp',
                success: function (data) {
                    //获取城市
                    address = data.content.address_detail.province + "," + data.content.address_detail.city;
                }
            });
        })


        //登录
        function empLogin() {
            var no = $("[name='no']").val();
            var pass = $("[name='pass']").val();
            $.getJSON("emp_login", {"no": no, "pass": pass, "ip": ip, "address": address}, function (result) {
                if (result.status == 200) {
                    location.href = "page_index";//跳转到首页
                } else {
                    alert(result.message);
                    window.location.reload();//刷新页面
                }
            });
        }

        // function empLogin() {
        //     var no = $("[name='no']").val();
        //     var pass = $("[name='pass']").val();
        //     $.getJSON("emp_login",{"no":no,"pass":pass},function (result) {
        //         if(result.status==200){
        //             location.href = "index.jsp";
        //         }else{
        //             $('#message').css("color","red");
        //             $('#message').html(result.message);
        //         }
        //     });
        // }

    </script>

</head>
<body class="layui-bg-black">
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
    <form action="emp_login" method="post">
        <h1>
            <strong>协同办公平台</strong> <em>Tick-tock Office System</em>
        </h1>
        <span id="message"></span>
        <div class="layui-user-icon larry-login">
            <input type="text" placeholder="账号" class="login_txtbx" name="no"/>
        </div>
        <div class="layui-pwd-icon larry-login">
            <input type="password" placeholder="密码" name="pass" class="login_txtbx"/>
        </div>
        <input type="hidden" name="ip" id="ip1">
        <input type="hidden" name="city" id="cy1">
        <div class="feri-code">
            <div id="mpanel4"></div>
        </div>
        <div class="layui-submit larry-login">
            <input type="button" id="btn1" disabled="disabled" value="立即登陆"
                   class="submit_btn" onclick="empLogin();"/>
        </div>
    </form>
    <div class="layui-login-text">
        <p>© 2016-2018 北京协同科技有限公司 版权所有</p>
    </div>
</div>
<script type="text/javascript" src="media/js/login.js"></script>
<script type="application/javascript" src="media/js/verify.min.js"></script>
<script type="text/javascript">
    $(function () {
        //滑动验证码
        $('#mpanel4').pointsVerify({
            defaultNum: 6, //默认的文字数量
            checkNum: 3, //校对的文字数量
            vSpace: 5, //间隔
            imgName: ['1.jpg', '2.jpg'],
            imgSize: {
                width: '400px',
                height: '200px',
            },
            barSize: {
                width: '400px',
                height: '40px',
            },
            ready: function () {
            },
            success: function () {
                //......后续操作
                $("#btn1").attr("disabled", false);
            },
            error: function () {
            }
        });
    });
</script>
</body>
</html>
