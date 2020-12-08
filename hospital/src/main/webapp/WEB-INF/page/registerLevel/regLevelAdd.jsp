<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">添加挂号级别</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">系统管理</a></li>
                    <li class="active">挂号级别管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">添加挂号级别</h3> ${msg}
                    <form action="/registerLevel/addReglevel" method="post" class="form-horizontal" role="form">
                        <div class="regLeveldiv">
                            <label class="regLevelLabel">挂号级别名称：</label>
                            <input type="text" name="levelName">
                        </div>
                        <div class="regLeveldiv">
                            <label class="regLevelLabel">挂号费用：</label>
                            <input type="text" name="registrationFee">
                        </div>
                        <div class="regLeveldiv">
                            <label class="regLevelLabel">挂号限额：</label>
                            <input type="text" name="levelQuota">
                        </div>
                        <input id="regLevelAdd" type="submit" value="添加">
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
    .regLevelLabel{
        width:100px;
    }
    .regLeveldiv{
        margin-left: 20px;
        margin-top: 10px;
    }
    #regLevelAdd{
        margin-top: 20px;
        margin-left: 20px;
    }
</style>