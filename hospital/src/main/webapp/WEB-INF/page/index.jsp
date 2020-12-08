<%--
  Created by IntelliJ IDEA.
  User: 程艳玲
  Date: 2020/4/20
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <jsp:include page="page-head.jsp"></jsp:include>
    <title>Title</title>
</head>
<body>
<!-- Preloader -->
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
<div id="wrapper">
    <!--引入了顶部-->
    <jsp:include page="frame-head.jsp"></jsp:include>
    <!--引入了侧边栏-->
    <%--<jsp:include page="test.jsp"></jsp:include>--%>
    <jsp:include page="/menu/getMenuLeft"></jsp:include>
    <%--  内容区域
    src="/home" 每次刷新界面都会定位到这里
    --%>
    <iframe name="container" width="100%" height="100%" scrolling="yes" frameborder="0" src="/home">

    </iframe>

</div>
<jsp:include page="js-core.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(function () {
        $('#side-Menu').metisMenu(); // ul.nav#side-menu
    });
</script>
</body>
</html>
