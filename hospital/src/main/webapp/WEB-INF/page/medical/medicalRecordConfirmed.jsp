<%--
 table界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../page-head.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">确诊</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">医生工作站管理</a></li>
                    <li class="active">确诊</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <div id="mrcdiv1">
                        <div>
                            病历编号：<input type="text" id="scaseNumber" name="scaseNumber">
                        </div>
                        <div id="mrcdiv1-2">
                            <button id="mrcsearch">搜索</button>
                        </div>
                    </div>
                    <div class="mrcdiv">
                        病历编号：<input type="text" id="caseNumber" name="caseNumber">
                    </div>
                    <div class="mrcdiv">
                        患者姓名：<input type="text" id="realName" name="realName">
                    </div>
                    <div class="mrcdiv">
                        患者性别：<input type="text" id="sex" name="sex">
                    </div>
                    <div class="mrcdiv">
                        患者年龄：<input type="text" id="age" name="age">
                    </div>
                    <div class="formControl">
                        <div class="forDataName">检查结果：</div>
                        <div><textarea class="formData" id="checkResult" name="checkResult"></textarea></div>
                    </div>
                    <div class="formControl">
                        <div class="forDataName">最终诊断：</div>
                        <div><textarea class="formData" id="finalDiagnosis" name="finalDiagnosis"></textarea></div>
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
    #mrcdiv1{
        display: flex;
        margin: 20px;
    }
    #mrcdiv1-2{
        margin-left: 20px;
    }
    .mrcdiv{
        margin: 20px;
    }
    .formControl{
        display: flex;
        margin: 20px;
    }

    .forDataName{
        width: 80px;
    }

    .formData{
        width: 750px;
        height: 50px;
    }
</style>
<script>
    $(function () {
        $("#mrcsearch").click(function () {
            //alert(122);
            $.ajax({
                url:"/register/getPatientMedicalRecordByCaseNumber",
                type:"post",
                data:{scaseNumber:$("#scaseNumber").val()},
                dataType:"json",
                success:function (register) {
                    console.log(register);
                    $("#caseNumber").val(register.caseNumber);
                    $("#realName").val(register.realName);
                    $("#sex").val(register.sex);
                    $("#age").val(register.age);
                    $("#checkResult").val(register.mrecord.checkResult);
                    $("#finalDiagnosis").val(register.mrecord.finalDiagnosis);
                    if(register.sex=='男'){
                        $("#s_sex").val(1);
                    }else {
                        $("#s_sex").val(2);
                    }
                }
            })
        })
    })
</script>