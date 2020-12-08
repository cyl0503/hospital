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
                <h4 class="page-title">病例</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">医生工作站管理</a></li>
                    <li class="active">病例</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">患者信息</h3>
                    <div id="mrdiv1">
                        <div>
                            病历编号：<input type="text" id="fcaseNumber" name="caseNumber" value="${register.caseNumber}">
                        </div>
                        <div>
                            患者姓名：<input type="text" id="realName" name="realName" value="${register.realName}">
                        </div>
                        <div>
                            患者性别：<input type="text" id="sex" name="sex" value="${register.sex}">
                        </div>
                        <div>
                            患者年龄：<input type="text" id="age" name="age" value="${register.age}">
                        </div>
                        <div id="d1-3-3">
                            挂号日期：<input type="date" id="createTime" name="createTime" value="<fmt:formatDate value='${register.createTime}' pattern='yyyy-MM-dd'></fmt:formatDate>">
                        </div>
                    </div>
                    <h3 class="box-title">病例信息</h3>
                    <div id="mrdiv2">
                        <form id="mrh_form1">
                            <input type="hidden" id="caseNumber" name="caseNumber" value="${register.caseNumber}">
                            <div class="formControl">
                                <div class="forDataName">主诉：</div>
                                <div><textarea class="formData" id="description" name="description">${mdr.description}</textarea></div>
                            </div>
                            <div class="formControl">
                                <div class="forDataName">疾病史：</div>
                                <div><textarea class="formData" id="medicalHistory" name="medicalHistory">${mdr.medicalHistory}</textarea></div>
                            </div>
                            <div class="formControl">
                                <div class="forDataName">家族病史：</div>
                                <div><textarea class="formData" id="familyHistory" name="familyHistory">${mdr.familyHistory}</textarea></div>
                            </div>
                            <div class="formControl">
                                <div class="forDataName">检查结果：</div>
                                <div><textarea class="formData" id="checkResult" name="checkResult">${mdr.checkResult}</textarea></div>
                            </div>
                            <div class="formControl">
                                <div class="forDataName">初步诊断：</div>
                                <div><textarea class="formData" id="primaryDiagnosis" name="primaryDiagnosis">${mdr.primaryDiagnosis}</textarea></div>
                            </div>
                            <div class="formControl">
                                <div class="forDataName">最终诊断：</div>
                                <div><textarea class="formData" id="finalDiagnosis" name="finalDiagnosis">${mdr.finalDiagnosis}</textarea></div>
                            </div>
                        </form>
                        <div id="mrdiv2_7">
                            <button id="btn_tempSave">暂存</button>
                            <button id="btn_confirmSave">确诊</button>
                            <button id="return">返回</button>
                        </div>
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

    #mrdiv1{
        display: flex;
        margin: 20px;
    }

    #mrdiv1 div{
        flex: 1;
    }

    #mrdiv2{
        width: 100%;
        padding-left: 20px;
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

    #mrdiv2_7{
        text-align: right;
        padding-right: 95px;
    }
</style>
<script>
    $(function () {
        //暂存
        $("#btn_tempSave").click(function () {
              $.ajax({
                  url:"/medical/saveMedicalRecord?flag=1",
                  type:"post",
                  data:$("#mrh_form1").serialize(),
                  dataType:"json",
                  success:function (medRecord) {
                      alert("success");
                      $("#description").html(medRecord.description);
                      $("#medicalHistory").html(medRecord.medicalHistory);
                      $("#familyHistory").html(medRecord.familyHistory);
                      $("#primaryDiagnosis").html(medRecord.primaryDiagnosis);
                      $("#checkResult").html(medRecord.checkResult);
                      $("#finalDiagnosis").html(medRecord.finalDiagnosis);
                  }
              })
        });
        //确诊
        $("#btn_confirmSave").click(function () {
                $.ajax({
                    url:"/medical/saveMedicalRecord?flag=2",
                    type:"post",
                    data:$("#mrh_form1").serialize(),
                    dataType:"json",
                    success:function (medRecord) {
                        alert("success");
                        $("#description").html(medRecord.description);
                        $("#medicalHistory").html(medRecord.medicalHistory);
                        $("#familyHistory").html(medRecord.familyHistory);
                        $("#primaryDiagnosis").html(medRecord.primaryDiagnosis);
                        $("#checkResult").html(medRecord.checkResult);
                        $("#finalDiagnosis").html(medRecord.finalDiagnosis);
                        if(medRecord.status==2) {
                            $("#btn_tempSave,#btn_confirmSave").attr("disabled","disabled");
                        }
                    }
                })
            })

        //返回
        $("#return").click(function () {
            window.location.href="/medical/medicalRecordList";
        });
    })
</script>