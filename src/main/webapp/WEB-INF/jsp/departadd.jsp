<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>滴答办公系统-部门新增</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
    <!--使用了JQuery，需要导入JS-->
    <script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>

    <script type="text/javascript">
        function addDept() {
            $.post("dept_add", $("#ff").serialize(), function (result) {
                if (result.status == "200") {
                    alert(result.message);
                } else {
                    alert(result.message);
                }
            }, "json");
        }
    </script>

</head>
<body>

<div class="layui-container" style="margin-top: 5px">
    <form class="layui-form" action="#" method="post" id="ff">

        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-block">
                <input type="text" id="name" name="dname" lay-verify="name" autocomplete="off"
                       placeholder="请输入部门名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">创立日期</label>
            <div class="layui-input-block">
                <input type="text" id="createtime" name="createtime" placeholder="请输入创立日期" id="date" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <input type="button" class="layui-btn" style="margin-left: 10%" onclick="addDept()" value="确认新增">
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(
        ['form', 'laydate'],
        function () {
            var form = layui.form, layer = layui.layer, laydate = layui.laydate;

            //日期
            laydate.render({
                elem: '#date'
            });


            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                },
                pass: [/(.+){6,12}$/, '密码必须6到12位'],
                content: function (value) {
                    layedit.sync(editIndex);
                }
            });
        });
</script>
</body>
</html>