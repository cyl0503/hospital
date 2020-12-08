package com.cyl.hospital.config;

import com.cyl.hospital.beans.userInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        userInfo user = (userInfo)request.getSession().getAttribute("userInfo");
        if(user==null){  //没有登陆
           request.setAttribute("msg","没有权限，请先登录！");
           //request.getRequestDispatcher("/WEB-INF/page/login.jsp").forward(request,response);    //请求的转发
           response.sendRedirect("/login");
            return false;
        }else{   //已登录
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
