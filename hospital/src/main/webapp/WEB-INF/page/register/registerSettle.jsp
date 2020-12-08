<%--
  Created by IntelliJ IDEA.
  User: 程艳玲
  Date: 2020/5/4
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../js-core.jsp"></jsp:include>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        $(function () {
            $("#rs_save").click(function () {
                document.rsForm.submit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index); //关闭当前弹窗
                //window.parent.location.reload();//父窗口重新加载
            })
        })
    </script>
</head>
<body>
<form action="/register/updatePatientCIApplyRecordStatus1" name="rsForm" method="post">
    <input type="hidden" name="caseNumber" value="${caseNumber}">
    <input type="hidden" name="itemIds" value="${str}">
    <div id="rsdiv1">
        <label class="rsLabel">患者姓名：</label>
        <input type="text" value="${realName}">
    </div>
    <div id="rsdiv2">
        <label class="rsLabel">结算方式：</label>
        <select name="feeType">
            <option value="-1">--请选择--</option>
            <c:forEach var="settleCategory" items="${settleCategoryList}">
                <option value="${settleCategory.id}">${settleCategory.settlename}</option>
            </c:forEach>
        </select>
    </div>
    <div id="rsdiv3">
        <label class="rsLabel">总计：</label>
        <input type="text" value="${total}">
    </div>
</form>
    <div id="rsdiv4">
        <button id="rs_save">收费</button>
    </div>
</body>
</html>
