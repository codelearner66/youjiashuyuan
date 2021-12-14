package com.shiyuan.controller.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

@WebFilter(filterName = "BackFilter",urlPatterns ={"/back/back_index.jsp","/back/back_default.html","/back/addBooks.html","/back/Echart.html"})//配置后台过滤器只有登录过才能进入
public class BackFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }
    public void destroy() {
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("进入过滤器！   ");
        HttpServletRequest req=(HttpServletRequest) request;
        HttpServletResponse resp=(HttpServletResponse)response;
        HttpSession session = req.getSession();
        Enumeration<String> attributeNames = session.getAttributeNames();
        while(attributeNames.hasMoreElements()){
            String s = attributeNames.nextElement();
            System.out.println(s);
            if("admin".equals(s)) chain.doFilter(request, response);
        }
        resp.sendRedirect("back_login.html");

    }
}

