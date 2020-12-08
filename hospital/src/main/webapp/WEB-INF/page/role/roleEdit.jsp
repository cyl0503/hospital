<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">修改角色</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">角色管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">修改角色</h3> ${msg}
                    <form action="/role/updateRole" method="post" class="form-horizontal" role="form">
                        <div class="rolediv">
                            <label class="roleLabel">角色ID：</label>
                            <input type="text" name="id" value="${rolee.id}" readonly="readonly">
                        </div>
                        <div class="rolediv">
                            <label class="roleLabel">角色名称：</label>
                            <input type="text" name="roleName" value="${rolee.roleName}">
                        </div>
                        <div class="rolediv">
                            <label class="roleLabel">角色描述：</label>
                            <input type="text" name="des" value="${rolee.des}">
                        </div>
                        <div class="rolediv">
                            <label class="roleLabel">状态：</label>
                            <input type="text" name="delFlag" value="${rolee.delFlag}" readonly="readonly">
                        </div>
                        <input id="roleUpdate" type="submit" value="修改">
                    </form>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<!-- /#page-wrapper -->
<!-- /#page-wrapper -->
<jsp:include page="../js-core.jsp"></jsp:include>
<style type="text/css">
    .roleLabel{
        width:120px;
    }
    .rolediv{
        margin-left: 20px;
        margin-top: 10px;
    }
    #roleUpdate{
        margin-top: 20px;
        margin-left: 20px;
    }
</style>