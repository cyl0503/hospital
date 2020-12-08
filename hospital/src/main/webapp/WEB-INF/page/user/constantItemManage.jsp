<%--
 table界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">门诊退号管理</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">常数项管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">常数项管理</h3>
                    <div>
                        <a href="/constant/gotoAddConstantItem"><div class="col-sm-6 col-md-4 col-lg-3">增加<i class="fa fa-plus"></i></div></a>
                        ${msg}
                    </div>
                    <div id="div2">
                        <table id="constantTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>常数项类型</th>
                                <th>常数项名称</th>
                                <th>标志</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${constList}" var="constant">
                                <tr>
                                    <td>${constant.id}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${constant.constantid==1}">
                                                性别类型
                                            </c:when>
                                            <c:when test="${constant.constantid==2}">
                                                支付方式
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${constant.constantitemname}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${constant.delflag==1}">
                                                正常
                                            </c:when>
                                            <c:when test="${constant.delflag==0}">
                                                异常
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td><a href="/constant/update_constant?id=${constant.id}" target="_self">修改</a>|<a href="/constant/delete_constant?id=${constant.id}" onclick="return confirm('确定删除吗？') ">删除</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<!-- /#page-wrapper -->
<jsp:include page="../js-core.jsp"></jsp:include>
<style type="text/css">
    th,tr,td{
        text-align: center;
    }
    body{
        margin: 0;
        padding: 0;
    }

</style>