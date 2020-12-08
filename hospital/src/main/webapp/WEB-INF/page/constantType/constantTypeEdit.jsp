<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">修改常数项类型</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">常数项类型管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">修改常数项类型</h3> ${msg}
                    <form action="/constant/updateConstantType" method="post" class="form-horizontal" role="form">
                        <div class="constantTypediv">
                            <label class="constantTypeLabel">常数项类型ID：</label>
                            <input type="text" name="id" value="${constantTypee.id}" readonly="readonly">
                        </div>
                        <div class="constantTypediv">
                            <label class="constantTypeLabel">常数项类型名称：</label>
                            <input type="text" name="constantname" value="${constantTypee.constantname}">
                        </div>
                        <div class="constantTypediv">
                            <label class="constantTypeLabel">状态：</label>
                            <input type="text" name="delflag" value="${constantTypee.delflag}" readonly="readonly">
                        </div>
                        <input id="constantTypeUpdate" type="submit" value="修改">
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
    .constantTypeLabel{
        width:120px;
    }
    .constantTypediv{
        margin-left: 20px;
        margin-top: 10px;
    }
    #constantTypeUpdate{
        margin-top: 20px;
        margin-left: 20px;
    }
</style>