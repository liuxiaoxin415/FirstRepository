<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>滴答办公系统-员工列表</title>
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
            location.href = "${pageContext.request.contextPath}/emp_list/1/" + page;
        }

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
            location.href = "${pageContext.request.contextPath}/emp_list/" + page + "/${pageUtil.pageSize}";
        }
    </script>
</head>
<body>
<div class="layui-container">
    <table class="layui-table" id="tbdata" lay-filter="tbop">
        <thead>
        <tr>
            <td>序号</td>
            <td>工号</td>
            <td>姓名</td>
            <td>部门</td>
            <td>性别</td>
            <td>手机号</td>
            <td>QQ号</td>
            <td>邮箱</td>
            <td>入职日期</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageUtil.records}" var="emp">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.no}</td>
                <td>${emp.name}</td>
                <td>${emp.depart.dname}</td>
                <td>${emp.sex}</td>
                <td>${emp.phone}</td>
                <td>${emp.qq}</td>
                <td>${emp.email}</td>
                <td>${emp.createdate}</td>
                <td><a class="layui-btn layui-btn-mini" href="empupdate.html">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-mini"
                       lay-event="del" onclick="deleteCourse();">删除</a></td>
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
            <a href="${pageContext.request.contextPath}/emp_list/${pageUtil.pageIndex-1}/${pageUtil.pageSize}"
               class="layui-laypage-prev ${pageUtil.pageIndex==1?'layui-disabled':''}" data-page="0">
                <i class="layui-icon">&lt;</i>
            </a>
        </c:if>


        <c:forEach begin="${pageUtil.numberStart}" end="${pageUtil.numberEnd}" var="num" step="1">
            <c:if test="${pageUtil.pageIndex==num}">
                <span style="color:red; font-weight: bold;">${num}</span>
            </c:if>
            <c:if test="${pageUtil.pageIndex!=num}">
                <a href="${pageContext.request.contextPath}/emp_list/${num}/${pageUtil.pageSize}">${num}</a>
            </c:if>
        </c:forEach>

        <c:if test="${pageUtil.pageIndex==pageUtil.pageCount}">
            <a href="#" class="layui-laypage-next ${pageUtil.pageIndex==pageUtil.pageCount?'layui-disabled':''}"
               data-page="2">
                <i class="layui-icon">&gt;</i>
            </a>
        </c:if>
        <c:if test="${pageUtil.pageIndex!=pageUtil.pageCount}">
            <a href="${pageContext.request.contextPath}/emp_list/${pageUtil.pageIndex+1}/${pageUtil.pageSize}"
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
            layer.confirm('是否确认删除员工?', function (index) {
                layer.msg("删除成功", {icon: 6});
                layer.msg("删除失败", {icon: 5});
            });
        });
    }
</script>

</body>
</html>
