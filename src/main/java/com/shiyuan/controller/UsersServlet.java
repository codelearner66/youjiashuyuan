package com.shiyuan.controller;

import com.alibaba.fastjson.JSON;
import com.shiyuan.entity.User;
import com.shiyuan.service.Impl.UserServiceImpl;
import com.shiyuan.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UsersServlet", urlPatterns = {"/front/UsersServlet"})
public class UsersServlet extends HttpServlet {

    @Override
    public  void init(){

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //初始化一个session对象
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session1 = req.getSession();
        String action = req.getParameter("action");
        System.out.println(action);
        UserService userService = new UserServiceImpl();
        User user = new User();
        System.out.println("=====================================================================================1");
        switch (action){
            case "checkName" : {
                String name = req.getParameter("name");
                String msg = null;
                if (name == null || name.equals("")){
                    msg = "昵称不可为空";
                    resp.getWriter().println(msg);
                }
                else if(name.length()>20 ){
                    msg = "昵称过长";
                    resp.getWriter().println(msg);
                }
                else if(userService.checkName(name)>0){
                    msg = "昵称已被占用";
                    resp.getWriter().println(msg);
                }
                else {
                    resp.getWriter().println(1);
                }
                break;
            }
            case "upName" : {
                System.out.println("=====================================================================================2");
                user = (User) session1.getAttribute("newUser");//获取用户信息
                String newName = req.getParameter("name");
                if( userService.upName(user.getAccount(),newName)){          //通过id更新用户昵称
                    session1.setAttribute("newUser",userService.getUser(user.getAccount()));
                    resp.getWriter().println("用户名修改成功");
                } else {
                    resp.getWriter().println("用户名修改失败");
                }
                break;
            }
            case "upPass" : {
                user = (User) session1.getAttribute("newUser");
                String pass = req.getParameter("newPass");
                if(userService.upPass(user.getAccount(),pass)){
                    session1.setAttribute("newUser",user.getAccount());
                    resp.getWriter().println("修改密码成功");
                }
                else {
                    resp.getWriter().println("修改密码失败");
                }
                break;
            }
            default:{
                break;
            }
        }
    }
    @Override
    public  void destroy(){

    }
}