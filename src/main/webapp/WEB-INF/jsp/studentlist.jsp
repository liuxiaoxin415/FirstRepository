<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>滴答办公系统-学员列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>

    <script type="text/javascript">
        //改变页面显示条数
        function changePageSize(select) {
            var page = $(select).val();
            url = "${pageContext.request.contextPath}/student_list/1/" + page;
            $("#ff").prop("action", url);
            $("#ff").submit();//提交表单
        }

        //实现跳转页码
        function changePage() {
            var page = $("#myPage").val();
            if (page <= 0) {
                page = 1;
            } else if (!(/(^[1-9]\d*$)/.test(page))) {
                alert("输入的页码非法");
                $("#myPage").val("");
                $("#myPage").focus();
                return;
            } else if (page >${pageUtil.pageCount}) {
                page = ${pageUtil.pageCount};
            }
            topage(page);
        }

        function toPage(pageIndex) {
            var url = "${pageContext.request.contextPath}/student_list/" + pageIndex + "/${pageUtil.pageSize}";
            $("#ff").prop("action", url);
            $("#ff").submit();
        }

        //导出excel
        function exportExcel() {
            var url = "${pageContext.request.contextPath}/exportExcel";
            $("#ff").prop("action", url);
            $("#ff").submit();//提交表单
        }

        function toQuery() {
            var url = "${pageContext.request.contextPath}/student_list/1/${pageUtil.pageSize}";
            $("#ff").prop("action", url);
            $("#ff").submit();
        }

    </script>

</head>
<body>
<div class="layui-container">
    <div class="layui-row" style="margin-top: 10px">
        <form action="${pageContext.request.contextPath}/student_list/1/${pageUtil.pageSize}" method="post" id="ff">
            <div class="layui-col-xs3" style="margin-right: 20px">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" id="no" name="name" class="layui-input" placeholder="学生姓名">
                    </div>
                </div>
            </div>
            <div class="layui-col-xs3" style="margin-right: 20px">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">班级：</label>
                    <div class="layui-input-block">
                        <select class="layui-input" name="classID" id="mySelect">

                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs2">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="button" onclick="toQuery()"><i
                                class="layui-icon layui-icon-search">搜索</i></button>
                    </div>
                </div>
            </div>
        </form>

        <div class="layui-col-xs2">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <a class="layui-btn layui-btn-mini layui-btn-mini" href="javascript:exportExcel()"
                       lay-event="detail">导出Excel</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="layui-container">
    <table class="layui-table" id="tbdata" lay-filter="tbop">
        <thead>
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>班级</td>
            <td>性别</td>
            <td>手机号</td>
            <td>邮箱</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${pageUtil.records}" var="studnet">
            <tr>
                <td>${studnet.id}</td>
                <td>${studnet.name}</td>
                <td>${studnet.cla.className}</td>
                <td>${studnet.sex}</td>
                <td>${studnet.phone}</td>
                <td>${studnet.email}</td>
                <td><a class="layui-btn layui-btn-mini" href="studentupdate.html">编辑</a>
                    <a class="layui-btn layui-btn-mini layui-btn-mini" href="studentdetails.html" lay-event="detail">查看详情</a>
                    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"
                       onclick="deleteCourse();">删除</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">

        <c:if test="${pageUtil.pageIndex==1}">
            <a href="#" class="layui-laypage-prev ${pageUtil.pageIndex==1?'layui-disabled':''}" data-page="0">
                <i class="layui-icon">&lt;</i>
            </a>
        </c:if>
        <c:if test="${pageUtil.pageIndex!=1}">
            <a href="javascript:toPage(${pageUtil.pageIndex-1})"
               class="layui-laypage-prev ${pageUtil.pageIndex==1?'layui-disabled':''}" data-page="0">
                <i class="layui-icon">&lt;</i>
            </a>
        </c:if>

        <c:forEach begin="${pageUtil.numberStart}" end="${pageUtil.numberEnd}" var="num" step="1">
            <c:if test="${pageUtil.pageIndex==num}">
                <span style="color:red; font-weight: bold;">${num}</span>
            </c:if>
            <c:if test="${pageUtil.pageIndex!=num}">
                <a href="javascript:toPage(${num})">${num}</a>
            </c:if>
        </c:forEach>

        <c:if test="${pageUtil.pageIndex==pageUtil.pageCount}">
            <a href="#" class="layui-laypage-next ${pageUtil.pageIndex==pageUtil.pageCount?'layui-disabled':''}"
               data-page="2">
                <i class="layui-icon">&gt;</i>
            </a>
        </c:if>
        <c:if test="${pageUtil.pageIndex!=pageUtil.pageCount}">
            <a href="javascript:toPage(${pageUtil.pageIndex+1})"
               class="layui-laypage-next ${pageUtil.pageIndex==pageUtil.pageCount?'layui-disabled':''}" data-page="2">
                <i class="layui-icon">&gt;</i>
            </a>
        </c:if>


        <span class="layui-laypage-skip">到第
							   <input id="myPage" type="text" min="1" value="${pageUtil.pageIndex}" class="layui-input">页
								<button type="button" class="layui-laypage-btn" onclick="changePage()">确定</button>
							</span>
        <span class="layui-laypage-count">共${pageUtil.totalCount}条</span>
        <span class="layui-laypage-count">[${pageUtil.pageIndex}/${pageUtil.pageCount}]</span>
        <span class="layui-laypage-limits">
				 <select lay-ignore="" onchange="changePageSize(this)">
						<option value="2" ${pageUtil.pageSize==2?"selected":""}>2 条/页</option>
						<option value="3" ${pageUtil.pageSize==3?"selected":""}>3 条/页</option>
						<option value="4" ${pageUtil.pageSize==4?"selected":""}>4 条/页</option>
						<option value="5" ${pageUtil.pageSize==5?"selected":""}>5 条/页</option>
						<option value="6" ${pageUtil.pageSize==6?"selected":""}>6 条/页</option>
						<option value="7" ${pageUtil.pageSize==7?"selected":""}>7 条/页</option>
                  </select>
		</span>
    </div>
</div>

<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>

<script type="text/javascript">
    function deleteCourse() {
        layui.use('table', function () {
            layer.confirm('是否确认删除学生?', function (index) {
                layer.msg("删除成功", {icon: 6});
                layer.msg("删除失败", {icon: 5});
            });
        });
    }

    $(function () {

        $.ajax({
            url: "${pageContext.request.contextPath}/getClassInfo",
            dataType: "json",
            success: function (result) {
                $("#mySelect").append("<option value='0'>--请选择班级--</option>");
                for (i = 0; i < result.length; i++) {
                    var id = result[i].id;
                    var name = result[i].className
                    $("#mySelect").append("<option value='" + id + "'>" + name + "</option>");
                }
            }
        });
    });
</script>


</body>
</html>
