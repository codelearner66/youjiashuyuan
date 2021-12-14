package com.shiyuan.controller;

import com.shiyuan.entity.User;
import com.shiyuan.service.Impl.LoginServlceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

@WebServlet(name = "LoginServlet", value = "/front/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //创建数据源
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //判断请求类型
        String action = request.getParameter("action");
        String account = request.getParameter("account");
        String pwd = request.getParameter("passwd");
        //初始化一个session对象
        HttpSession session1 = request.getSession();
        Date date01 = new Date();
        //记录用户的账号信息登陆成功后写入到session中保存
        User user = new User(account, pwd);
        LoginServlceImpl login = new LoginServlceImpl();
        switch (action) {
            case "login": {

                if(login.Checkaccount(user)){
                    //将用户信息保存到session中

                    session1.setAttribute("user",user);

                    //请求转发到主页面
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                    //response.sendRedirect("mainPage");
                    break;
                }
                else {
                    request.setAttribute("msg","帐号或者密码错误！");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }

            }
            case "zhuce": {
                String yanzhengma = request.getParameter("yanzheng");
                Boolean flag=false;
                Enumeration<String> attributeNames = session1.getAttributeNames();
                while (attributeNames.hasMoreElements()){
                    if(attributeNames.nextElement().equals("date")){
                        flag=true;
                    }
                }
                if (flag) {
                    if (flag&&date01.getTime() - Long.parseLong(session1.getAttribute("date").toString()) < 60000) {
                        //获取session中的验证码信息与用户提交的验证码进行比较
                        if (session1.getAttribute("ma").toString().equals(yanzhengma)) {
                            //将之前的验证码失效
                            session1.removeAttribute("ma");
                            session1.removeAttribute("date");
                            User usss=new User();
                            usss.setAccount(user.getAccount());
                            if (!login.Checkaccount(usss)) {
                                if (login.addUser(user)) {
                                    System.out.println("注册成功！");
                                    request.setAttribute("msg","注册成功！，请前往登录...");
                                    request.getRequestDispatcher("login.jsp").forward(request,response);
                                }
                            } else {
                                System.out.println("账号已存在，请更换您的帐号！");
                                request.setAttribute("msg","账号已存在，请更换您的帐号！");
                                request.getRequestDispatcher("login.jsp").forward(request,response);
                            }
                        } else {//验证码不匹配

                            System.out.println("验证码不匹配！" + "：" + "：" + yanzhengma);
                            request.setAttribute("msg","验证码不匹配！");
                            request.getRequestDispatcher("login.jsp").forward(request,response);
                        }
                    } else {
                        System.out.println("验证码过期！");
                        request.setAttribute("msg","验证码过期！");
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                    }
                } else {//验证码出错
                    System.out.println("验证码错误！");
                    request.setAttribute("msg","验证码错误！");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }
                break;
            }
            case "yanzhengma": {//生成验证码
                session1 = request.getSession();
                int random1 = (int) (10000 * Math.random() + 1);
                session1.setAttribute("ma", random1);
                session1.setAttribute("date", session1.getLastAccessedTime());
                System.out.println(new Date());
                response.getWriter().println(random1);
                break;
            }

        }

    }
}
