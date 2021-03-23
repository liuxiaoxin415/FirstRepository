<%--
  Created by IntelliJ IDEA.
  User: liuxiaoxin
  Date: 2020/11/8
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>滴答办公系统-学员导入</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>

    <script type="text/javascript">

        var form;
        layui
            .use(
                ['form', 'upload', 'layedit', 'laydate'],
                function () {
                    form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
                    initData();
                });


        function initData() {
            $.getJSON("/student_getClasses", null, function (arr) {
                //alert(JSON.stringify(arr));
                for (var i = 0; i < arr.length; i++) {
                    $("#cds").append("<option value='" + arr[i].id + "'>" + arr[i].className + "</option>");
                }
                //渲染下拉框
                form.render("select");
            });
        }

    </script>


</head>
<body>
<div class="layui-container" style="margin-top: 5px">
    <form class="layui-form" action="studentbatch.do" method="post" enctype="multipart/form-data">
        <div class="layui-form-item">
            <label class="layui-form-label">下载模板</label>
            <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux">
                    <a href="${pageContext.request.contextPath}/media/tem/StudnetExcel.xls">批量导入学员模板.xls</a>
                </div>
            </div>

        </div>

        <div class="layui-col-xs3" style="margin-right: 20px">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">导入班级</label>
                <div class="layui-input-block">
                    <select class="layui-input" id="cds" name="classID">

                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择文件</label>
            <div class="layui-input-block">
                <input type="file" name="" id="no1" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn" style="margin-left: 10%" id="btn1" type="submit" value="确认导入">
        </div>
    </form>
</div>
<script src="media/layui/layui.js"></script>
<script>
</script>
</body>
</html>