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
                <h4 class="page-title">门诊收费管理</h4></div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="#" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                <ol class="breadcrumb">
                    <li><a href="#">控制台</a></li>
                    <li><a href="#">挂号收费</a></li>
                    <li class="active">门诊收费管理</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">患者信息</h3>
                    <div id="rfdiv1">
                        <div>
                            病历编号：<input type="text" id="scaseNumber" name="scaseNumber">
                        </div>
                        <div id="rfdiv1-2">
                            <button id="rf_search">搜索</button>
                        </div>
                    </div>
                    <div id="rfdiv2">
                       <div>
                           病历编号：<input type="text" id="caseNumber" name="caseNumber">
                       </div>
                       <div>
                           患者姓名：<input type="text" id="realName" name="realName">
                       </div>
                       <div>
                           患者性别：<input type="text" id="sex" name="sex">
                       </div>
                       <div>
                           身份证号：<input type="text" id="idCard" name="idCard">
                       </div>
                    </div>
                    <div id="rfdiv3">
                        <div id="div_title2">
                            <h3 class="box-title">患者消费信息</h3>
                        </div>
                        <form id="rfForm">
                            <table id="mt2" class="table table-hover">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="ciarIds"></th>
                                    <th>病历号</th>
                                    <th>姓名</th>
                                    <th>项目名称</th>
                                    <th>单价</th>
                                    <th>数量</th>
                                    <th>开立时间</th>
                                    <th>收费状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div id="div_total">
                                总计：<input type="text" id="total" readonly="readonly">
                            </div>
                        </form>
                        <div id="rfdiv3_3">
                            <button id="btn_total">计算总额</button>
                            <button id="rfSettlement">结算收费</button>
                            <button id="rfSettlement_test">弹层结算收费</button>
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
    #rfdiv1{
        width: 100%;
        height: 25px;
        margin-left: 20px;
        line-height: 25px;
        display: flex;
        margin-bottom: 20px;
    }
    #rfdiv1-2{
        margin-left: 20px;
    }
    #rfdiv2{
        display: flex;
        margin: 20px;
    }
    #rfdiv2 div{
        flex: 1;
    }

    #rfdiv2 input{
        width: 150px;
    }

    #div_total{
        float: right;
        margin-right: 20px;
    }
    #div_total input{
        width: 80px;
    }
</style>
<script type="text/javascript" src="../../../layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
       $("#rf_search").click(function () {
            $.ajax({
                url:"/register/getPatientCIApplyRecord",
                type:"post",
                data:{scaseNumber:$("#scaseNumber").val()},
                dataType:"json",
                success:function(registerApplyRecordList) {
                    $("#caseNumber").val(registerApplyRecordList[0].caseNumber);
                    $("#realName").val(registerApplyRecordList[0].realName);
                    $("#sex").val(registerApplyRecordList[0].sex);
                    $("#idCard").val(registerApplyRecordList[0].idCard);
                    $("tbody").empty();
                   $.each(registerApplyRecordList,function (key,registerApplyRecord) {
                       var createTime = registerApplyRecord.applyRecord.createTime.substring(0,10);
                       var state="";
                       if(registerApplyRecord.applyRecord.payStatus==1){
                           state="未收费";
                       }else if(registerApplyRecord.applyRecord.payStatus==2){
                           state="已收费";
                       }
                       var str="<tr>" +
                               "<td><input type='checkbox' name='itemIds' value='"+registerApplyRecord.applyRecord.itemId+"'></td>"+
                               "<td>"+registerApplyRecord.caseNumber+"</td>" +
                               "<td>"+registerApplyRecord.realName+"</td>" +
                               "<td>"+registerApplyRecord.applyRecord.itemName+"</td>" +
                               "<td>"+registerApplyRecord.price+"</td>" +
                               "<td>"+registerApplyRecord.applyRecord.number+"</td>" +
                               "<td>"+createTime+"</td>" +
                               "<td>"+state+"</td>" +
                               "</tr>";
                       $("tbody").append(str);
                   })
                }
            })
       });
       //结算收费
       $("#rfSettlement").click(function () {
           var arr=[];
           $("input[name='itemIds']:checked").each(function (i) {
              arr[i]=$(this).val();
           });
          $.ajax({
              url:"/register/updatePatientCIApplyRecordStatus?itemIds="+arr,
              type: "post",
              data:{caseNumber:$("#caseNumber").val()},
              dataType:"json",
              success:function(registerApplyRecordList) {
                  $("#caseNumber").val(registerApplyRecordList[0].caseNumber);
                  $("#realName").val(registerApplyRecordList[0].realName);
                  $("#sex").val(registerApplyRecordList[0].sex);
                  $("#idCard").val(registerApplyRecordList[0].idCard);
                  $("tbody").empty();
                  $.each(registerApplyRecordList,function (key,registerApplyRecord) {
                      var createTime = registerApplyRecord.applyRecord.createTime.substring(0,10);
                      var state="";
                      if(registerApplyRecord.applyRecord.payStatus==1){
                          state="未收费";
                      }else if(registerApplyRecord.applyRecord.payStatus==2){
                          state="已收费";
                      }
                      var str="<tr>" +
                          "<td><input type='checkbox' name='itemIds' value='"+registerApplyRecord.applyRecord.itemId+"'></td>"+
                          "<td>"+registerApplyRecord.caseNumber+"</td>" +
                          "<td>"+registerApplyRecord.realName+"</td>" +
                          "<td>"+registerApplyRecord.applyRecord.itemName+"</td>" +
                          "<td>"+registerApplyRecord.price+"</td>" +
                          "<td>"+registerApplyRecord.applyRecord.number+"</td>" +
                          "<td>"+createTime+"</td>" +
                          "<td>"+state+"</td>" +
                          "</tr>";
                      $("tbody").append(str);
                  })
                  alert("结算成功");
              }
          })
       });

       //全选,反选
        $("#ciarIds").click(function () {
            //alert(123);
            if($(this).is(":checked")){
                $("input[name='itemIds']").prop("checked","true");
            }else {
                $("input[name='itemIds']").removeAttr("checked");
            }
        });

        //计算总额
        $("#btn_total").click(function () {
            var total = 0;
            $("tbody tr").each(function () {
                if($(this).find("td").eq(0).find("input").is(":checked")){
                    var price = parseFloat($(this).find("td").eq(4).text());
                    var number = parseInt($(this).find("td").eq(5).text());
                    total += price*number;
                }
            });
            $("#total").val(total);
        })
        //弹层结算
        $("#rfSettlement_test").click(function () {
            var arr=[];
            $("input[name='itemIds']:checked").each(function (i) {
                arr[i]=$(this).val();
            });

            layer.open({
               type:2,
               title:"弹出一个新页面",
                area:['600px','400px'],
                shadeClose:false,//点击遮罩关闭
                content:"/register/getSettleCategoryList?realName="+$("#realName").val()+"&caseNumber="+$("#caseNumber").val()+"&total="+$("#total").val()+"&itemids="+arr,
                end:function () {
                  alert("结算成功");
                  //window.location.href="registerFee.jsp";
                }
            });
        })
    })
</script>