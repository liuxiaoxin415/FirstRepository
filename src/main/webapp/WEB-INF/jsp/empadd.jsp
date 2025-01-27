<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>滴答办公系统-员工新增</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>

    <script type="text/javascript">
        //新增员工
        function addEmp() {
            $.post("addEmp", $("#tt").serialize(), function (result) {
                if (result.status == 200) {
                    alert(result.message);
                    //跳转知道员工列表
                    location.href = "${pageContext.request.contextPath}/emp_list/1/1";
                } else {
                    alert(result.message);
                }
            }, "json");
        }
    </script>

</head>
<body>
<div class="layui-container" style="margin-top: 5px">
    <form class="layui-form" method="post" id="tt">
        <div class="layui-form-item">
            <label class="layui-form-label">员工工号</label>
            <div class="layui-input-block">
                <input type="text" name="no" lay-verify="name" autocomplete="off"
                       placeholder="请输入工号" id="no1" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="name" autocomplete="off"
                       placeholder="请输入姓名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属部门</label>
            <div class="layui-input-block">
                <select name="did" id="cds">
                    <option value="-1">--请选择部门--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="required" placeholder="请输入有效邮箱" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" lay-verify="required" placeholder="请输入手机号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">QQ</label>
            <div class="layui-input-inline">
                <input type="text" name="qq" lay-verify="required" placeholder="请输入QQ号码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">入职日期</label>
            <div class="layui-input-inline">
                <input type="text" name="createdate" id="date" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">照片</label>
            <button type="button" class="layui-btn" id="upfile">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
            <input type="hidden" name="photo" id="p1">
            <div class="layui-input-block">
                <img alt="个人一寸照片" src="${pageContext.request.contextPath}/media/images/no.jpg" id="img1" width="200px"
                     height="300px">
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn" style="margin-left: 10%" id="btn1" disabled="disabled" type="button" value="确认新增"
                   onclick="addEmp()">
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var form;
    layui
        .use(
            ['form', 'upload', 'layedit', 'laydate'],
            function () {
                form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
                var upload = layui.upload;

                //执行实例
                var uploadInst = upload.render({
                    elem: '#upfile' //绑定元素
                    , url: 'photoUpload'//上传接口
                    , done: function (obj) {
                        //上传完毕回调
                        console.log(obj);
                        if (obj.status == 200) {
                            $("#p1").val(obj.message);
                            $("#img1")[0].src = "${pageContext.request.contextPath}/media/upload/" + obj.message;
                            $("#btn1").attr("disabled", false);
                        }

                    }
                    , error: function () {
                        //请求异常回调
                    }
                });
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
                initData();
            });

    //初始化数据
    function initData() {
        $.get("findDepts", function (arr) {
            for (i = 0; i < arr.length; i++) {
                $("#cds").append("<option value='" + arr[i].id + "'>" + arr[i].name + "</option>");
            }
            form.render("select");
        }, "json");
    }
</script>
</body>
</html>
