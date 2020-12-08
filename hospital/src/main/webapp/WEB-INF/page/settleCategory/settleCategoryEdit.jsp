<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">修改结算类型</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">结算类型管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">修改结算类型</h3> ${msg}
                    <form action="/settleCategory/updateSettleCategory" method="post" class="form-horizontal" role="form">
                        <div class="scdiv">
                            <label class="scLabel">ID：</label>
                            <input type="text" name="id" value="${settleCategoryy.id}" readonly="readonly">
                        </div>
                        <div class="scdiv">
                            <label class="scLabel">结算类型名称：</label>
                            <input type="text" name="settlename" value="${settleCategoryy.settlename}">
                        </div>
                        <div class="scdiv">
                            <label class="scLabel">状态：</label>
                            <input type="text" name="delflag" value="${settleCategoryy.delflag}" readonly="readonly">
                        </div>
                        <input id="scUpdate" type="submit" value="修改">
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
    .scLabel{
        width:120px;
    }
    .scdiv{
        margin-left: 20px;
        margin-top: 10px;
    }
    #scUpdate{
        margin-top: 20px;
        margin-left: 20px;
    }
</style>