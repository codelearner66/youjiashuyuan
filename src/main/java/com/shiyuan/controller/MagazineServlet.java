package com.shiyuan.controller;

import com.alibaba.fastjson.JSON;
import com.shiyuan.entity.MType;
import com.shiyuan.entity.User;
import com.shiyuan.service.Impl.LoginServlceImpl;
import com.shiyuan.service.Impl.MTypeServiceImpl;
import com.shiyuan.service.Impl.MainServiceImpl;
import com.shiyuan.service.MTypeService;
import com.shiyuan.service.MainService;

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

@WebServlet(name = "Magazine", urlPatterns = {"/front/Magazine"})
public class MagazineServlet extends HttpServlet {
    private static MTypeService mTypeService ;
    private static MainService mainService;
    @Override
    public  void init(){
         mTypeService = new MTypeServiceImpl();
         mainService = new MainServiceImpl();
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

        switch (action){
            case "getMagazineForType" : {
                Map<Integer, String> map = new HashMap<>();
                List<MType> mTypes = mTypeService.selectByMType();
                List<MType> list = new ArrayList<>();
                for ( MType m:mTypes) {
                    map.put(Integer.parseInt(m.getT_Id()),m.getT_Name());
                }
                for (int i=1; i<=map.size();i++){
                    MType mType = new MType();
                    mType.setT_Id(String.valueOf(i));
                    mType.setT_Name(map.get(i));
                    list.add(mType);
                }
                resp.getWriter().println(JSON.toJSON(list));
                break;
            }
            case "getMagazinesForPage":{
                String currentPage1 = req.getParameter("currentPage1");
                String rows = req.getParameter("rows");
                String type = req.getParameter("type");
                if(req.getParameter("cycle")!=null){
                    String cycle = req.getParameter("cycle");
                    System.out.println("cycle = " + cycle);
                    resp.getWriter().println(JSON.toJSONString(mainService.findMagaByPageByCycle(currentPage1, rows,cycle)));
                }else {
                    if(type.equals("35")){
                        resp.getWriter().println(JSON.toJSONString(mainService.findMagaByPage(currentPage1, rows)));
                    }else {
                        resp.getWriter().println(JSON.toJSONString(mainService.findMagaByPage(currentPage1, rows,type)));
                    }
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
        mTypeService.closeSession();
    }
}
