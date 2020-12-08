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
                <h4 class="page-title">患者费用查询</h4></div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">挂号收费</a></li>
                    <li class="active">患者费用查询</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">患者费用信息</h3>
                    <div id="pcdiv1">
                        <div>
                            病历编号：<input type="text" id="caseNumber">
                        </div>
                        <div id="pcdiv1-2">
                            <button id="pc_search">搜索</button>
                        </div>
                    </div>
                    <div id="pcdivtitle">
                        <h3 class="box-title">患者费用信息表</h3>
                    </div>
                    <div id="pcdiv2">
                        <table id="mt2" class="table table-hover">
                            <thead>
                            <tr>
                                <th>病历号</th>
                                <th>姓名</th>
                                <th>项目名称</th>
                                <th>项目类型</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>单项总价</th>
                                <th>开立时间</th>
                                <th>开立医生</th>
                                <th>收费时间</th>
                                <th>结算方式</th>
                            </tr>
                            </thead>
                            <tbody>
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
    #pcdiv1{
        width: 100%;
        height: 25px;
        margin-left: 20px;
        line-height: 25px;
        display: flex;
        margin-bottom: 20px;
    }
    #pcdiv1-2{
        margin-left: 20px;
    }
    #pcdivtitle{
        margin-top: 30px;
    }
</style>
<script type="text/javascript">
    $(function () {
        //根据病历号查询
       $("#pc_search").click(function () {
           $.ajax({
               url:"/patientCosts/getPatientCostsList",
               type:"post",
               dataType:"json",
               data:{caseNumber:$("#caseNumber").val()},
               success:function (patientCostList) {
                   $("tbody").empty();
                   $.each(patientCostList,function (key,patientCosts) {
                       var createTime = patientCosts.createtime.substring(0,10);
                       var paytime = patientCosts.paytime.substring(0,10);
                       var feeType = "";
                       if(patientCosts.feetype==1){
                           feeType="自费";
                       }else if(patientCosts.feetype==2){
                           feeType="新农合";
                       }else if(patientCosts.feetype==3){
                           feeType="市医保";
                       }else if(patientCosts.feetype==4){
                           feeType="省医保";
                       }else if(patientCosts.feetype==7){
                           feeType="移动支付";
                       }
                       var itemType = "";
                       if(patientCosts.itemtype==1){
                           itemType = "检查项目";
                       }else if(patientCosts.itemtype==2){
                           itemType = "检验项目";
                       }
                       var str="<tr>" +
                           "<td>"+patientCosts.casenumber+"</td>" +
                           "<td>"+patientCosts.realName+"</td>" +
                           "<td>"+patientCosts.itemname+"</td>" +
                           "<td>"+itemType+"</td>" +
                           "<td>"+patientCosts.price+"</td>" +
                           "<td>"+patientCosts.number+"</td>" +
                           "<td>"+patientCosts.total+"</td>" +
                           "<td>"+createTime+"</td>" +
                           "<td>"+patientCosts.doctorName+"</td>" +
                           "<td>"+paytime+"</td>" +
                           "<td>"+feeType+"</td>" +
                           "</tr>";
                       $("tbody").append(str);
                   })
               }
           })
       })
    })
</script>