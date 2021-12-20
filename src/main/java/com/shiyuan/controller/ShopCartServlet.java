package com.shiyuan.controller;

import com.alibaba.fastjson.JSON;
import com.shiyuan.entity.MType;
import com.shiyuan.entity.User;
import com.shiyuan.service.Impl.MTypeServiceImpl;
import com.shiyuan.service.Impl.MainServiceImpl;
import com.shiyuan.service.Impl.ShopCartServiceImpl;
import com.shiyuan.service.MTypeService;
import com.shiyuan.service.MainService;
import com.shiyuan.service.ShopCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Shopping", urlPatterns = {"/front/Shopping"})
public class ShopCartServlet extends HttpServlet {
    private static ShopCartService shopCartService;
    @Override
    public  void init(){
         shopCartService = new ShopCartServiceImpl();
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
        System.out.println("============================"+action);
        switch (action){
            case "getShoppingCart" : {
                System.out.println("*******************************");
                String account = req.getParameter("account");
                if(account!= null){
                    System.out.println("account =="+account);
                    System.out.println(shopCartService.selectShopCart(account));
                    resp.getWriter().println(JSON.toJSONString(shopCartService.selectShopCart(account)));
                }else {
                    resp.getWriter().println(1);
                }
                break;
            }
            case "deleteShoppingCart":{

                break;
            }
            case "BuyMagazine" : {

                break;
            }
            default: {
                break;
            }
        }


    }
    @Override
    public  void destroy(){

    }
}
