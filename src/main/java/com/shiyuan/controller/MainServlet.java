package com.shiyuan.controller;

import com.alibaba.fastjson.JSON;
import com.shiyuan.entity.User;
import com.shiyuan.service.Impl.LoginServlceImpl;
import com.shiyuan.service.Impl.MainServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MainServlet", urlPatterns = {"/front/MainServlet"})
public class MainServlet extends HttpServlet {
    private  static  MainServiceImpl mainServiceImpl;
    @Override
    public  void init(){
        mainServiceImpl = new MainServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        LoginServlceImpl login = new LoginServlceImpl();
        switch (action){
            case "getUser" : {
                if(req.getSession().getAttribute("user")!=null){
                    User user = (User) req.getSession().getAttribute("user");
                    req.getSession().setAttribute("newUser",login.getUserAll(user));
                    resp.getWriter().println(JSON.toJSON(login.getUserAll(user)));
                }
                break;
            }
            case "getMagazinesForPage":{
                if( req.getParameter("currentPage1")!=null  ){
                    String currentPage1 = req.getParameter("currentPage1");
                    String rows = req.getParameter("rows");
                    String type = req.getParameter("type");
                    System.out.println(rows+"//////////////");
                    resp.getWriter().println(JSON.toJSONString(mainServiceImpl.findMagaByPage(currentPage1, rows, type)));
                }
                break;
            }
            default: {
                break;
            }
        }


    }
    @Override
    public  void destroy(){
        mainServiceImpl.closeSession();

    }
}
