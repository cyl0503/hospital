<%--
 后台管理系统的顶部
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top m-b-0">
    <div class="navbar-header">
        <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse">
            <i class="fa fa-bars"></i></a>
        <div class="top-left-part"><a class="logo" href="index.html"><b>
            <img src="/static/plugins/images/pixeladmin-logo.png" alt="home" /></b>
            <span class="hidden-xs">
            <img src="/static/plugins/images/pixeladmin-text.png" alt="home" />
            </span></a></div>
        <ul class="nav navbar-top-links navbar-left m-l-20 hidden-xs">
            <li>
                <form role="search" class="app-search hidden-xs">
                    <input type="text" placeholder="Search..." class="form-control"> <a href=""><i class="fa fa-search"></i></a>
                </form>
            </li>
        </ul>
        <ul class="nav navbar-top-links navbar-right pull-right">
            <li>
                <a class="profile-pic" href="#">
                    <img src="/static/plugins/images/users/varun.jpg" alt="user-img" width="36" class="img-circle">
                    <b class="hidden-xs">欢迎&nbsp;<%=request.getSession().getAttribute("realName") %>&nbsp;登录</b></a>
            </li>
            <li>
                <a class="profile-pic" href="logout">
                    <b class="hidden-xs">退出</b></a>
            </li>
        </ul>
    </div>
</nav>


