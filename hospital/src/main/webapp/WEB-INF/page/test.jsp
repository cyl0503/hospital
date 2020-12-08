<%--
  Created by IntelliJ IDEA.
  User: 程艳玲
  Date: 2020/4/21
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Left navbar-header -->
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse slimscrollsidebar">
        <ul class="nav" id="side-menu">
            <li style="padding: 10px 0 0;">
                <a href="/home" target="container" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i><span class="hide-menu">控制台</span></a>
            </li>
            <c:forEach var="m" items="${menuList}">
                <li>
                    <a><i class="fa fa-bar-chart-o fa-fw" aria-hidden="true"></i>
                        <span class="hide-menu">${m.menuName}</span></a>
                    <ul class="nav nav-second-level">
                        <c:forEach var="sub_m" items="${m.subList}">
                            <li><a href="${sub_m.url}" target="container">${sub_m.menuName}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
        <div class="center p-20">
            <span class="hide-menu"><a href="#" target="_blank" class="btn btn-danger btn-block btn-rounded waves-effect waves-light">Upgrade to Pro</a></span>
        </div>
    </div>
</div>
                                                                                               
