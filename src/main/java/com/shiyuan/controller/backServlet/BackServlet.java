package com.shiyuan.controller.backServlet;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.back.*;

import com.shiyuan.service.Impl.BackServiceImpl;
import com.shiyuan.utils.getuuid;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BackServlet", value = "/back/BackServlet")
@MultipartConfig
public class BackServlet extends HttpServlet {
     private static BackServiceImpl back;
    @Override
    public  void init(){
        back=new BackServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应编码格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        System.out.println(action);
        switch(action){
            case "Echart":{//获取Echart数据
                List<Echarts> Edate=back.getEcharts();
                //将查询到的数据转化为json格式返回
                String dat= JSON.toJSON(Edate).toString();
                response.getWriter().println(dat);
                break;
            }
            case "getTmoney":{//获取今天的营业额
                String date = getuuid.getDate();
                response.getWriter().println(back.getTmoney(date));
                break;
            }
            case "getYmoney":{//获取昨天的营业额
                long time=System.currentTimeMillis()-(1000 * 60 * 60 * 24);//计算昨天的日期
                String date = getuuid.getDate(new Date(time));
                response.getWriter().println(back.getTmoney(date));
                break;
            }
            case "getYearmoney":{//获取一年的营业额
                response.getWriter().println(back.getYearmoney());
                break;
            }
            case "getMonthmoney":{//获取一月的营收
                response.getWriter().println(back.getMonthmoney());
                break;
            }
            case "getreventrend":{//返回back_default中表的数据
                List<BackRevenuetrend> revenuetrends = back.getbackRevenutrend();
                String o = JSON.toJSON(revenuetrends).toString();
                response.getWriter().println(o);
                break;
            }
            case "getBack_strend":{
                String checkdata = request.getParameter("checkdata");
                System.out.println(checkdata);
                List<BackRevenuetrend> back_strend = back.getBack_strend(checkdata);
                String s = JSON.toJSONString(back_strend);
                response.getWriter().println(s);
                break;
            }
            case "hotTop100":{
                List<BackRevenuetrend> hotTop100 = back.getHotTop100();
                String s = JSON.toJSONString(hotTop100);
                response.getWriter().println(s);
                break;
            }
            case "getSortNp":{
                List<BackRevenuetrend> sortNp = back.getSortNp();
                String s = JSON.toJSONString(sortNp);
                response.getWriter().println(s);
                break;
            }
            case "getSellFormByUserId":{
                String userId = request.getParameter("UserId");
                String start = request.getParameter("start");
                System.out.println(userId+"    "+start);
                List<SellFrom> sellFormByUserId = back.getSellFormByUserId(userId, Integer.parseInt(start)*10);
                String s = JSON.toJSONString(sellFormByUserId);
                response.getWriter().println(s);
                break;
            }
            case "getshoppingcart":{
                String start = request.getParameter("start");
                String size = request.getParameter("size");
                int i = Integer.parseInt(start);
                int i1 = Integer.parseInt(size);
                List<BackShoppingCart> getbackshoppingcart = back.getbackshoppingcart(i*i1, 10);
                String s = JSON.toJSON(getbackshoppingcart).toString();
                response.getWriter().println(s);
                break;
            }
            case  "getPageSum":{//获取页面数据总数
                String tableName = request.getParameter("TableName");
                int size =Integer.parseInt(request.getParameter("size"));
                int pagesSum = back.getPagesSum(tableName);
                int maxpage=pagesSum%size==0?pagesSum/size:pagesSum/size+1;

                response.getWriter().println(maxpage);
                break;
            }
            case "getM":{
                String start = request.getParameter("start");
                String size = request.getParameter("size");
                int i = Integer.parseInt(start);
                int i1 = Integer.parseInt(size);
                List<Magazines> manazines = back.getManazines(i*i1, i1);
                response.getWriter().println(JSON.toJSON(manazines));
                break;
            }
            case "getMByID":{
                String id = request.getParameter("ID");
                System.out.println(id);
                Magazines magazinesByID = back.getMagazinesByID(id);
                String s = JSON.toJSONString(magazinesByID);
                System.out.println("JSON.toJSONString(magazinesByID)"+s);
                response.getWriter().println(s);
                break;
            }
            case "clearout":{
                HttpSession session = request.getSession();
                session.removeAttribute("admin");
                session.invalidate();
                //response.sendRedirect("back_login.html");
                break;
            }
            case "uploadimg":{
                final long SIZE=1024*1024*5;
                Part formimg = request.getPart("upload-img");
                if(formimg!=null){
                    long size = formimg.getSize();

                    String name = formimg.getSubmittedFileName();
                    if (!name.endsWith(".jpg")&&!name.endsWith(".jpeg")){
                        //1 文件格式不正确
                        response.getWriter().println(1);
                        return;
                    }
                    //2文件大小不正确
                    if(size>SIZE){
                        response.getWriter().println(2);
                        return;
                    }
                    //存储路径
                    String realPath = request.getServletContext().getRealPath("img/zz_img");
                    //如果文件目录不存在则新建目录
                    File dir=new File(realPath);
                    if(!dir.exists()){
                        dir.mkdir();
                    }
                    String path="../img/zz_img"+"/"+name;
                   formimg.write(realPath+"//"+name);
                    response.getWriter().println(path);
                    return;
                }
                break;
            }
            case "addbook":{
                String uuid = getuuid.getUUID();
                String bookname = request.getParameter("name");//杂志名
                String price = request.getParameter("price");//杂志价格
                String type = request.getParameter("type");//杂志类型
                String cycle = request.getParameter("cycle");//杂志期型
                String imgname = request.getParameter("imgname");//杂志图片名
                String instr = request.getParameter("instr");//杂志简介
                System.out.println(bookname+" "+price+" "+type+" "+cycle+" "+imgname+" "+instr);
                Magazines magazines=new Magazines(uuid,bookname,Float.parseFloat(price),type,cycle,instr,imgname);
                back.setMagazine(magazines);
                request.getRequestDispatcher("addBooks.jsp").forward(request,response);
                break;
            }
            case "upDataBook":{
                String bookid=request.getParameter("id");//杂志Id
                String bookname = request.getParameter("name");//杂志名
                String price = request.getParameter("price");//杂志价格
                String type = request.getParameter("type");//杂志类型
                String cycle = request.getParameter("cycle");//杂志期型
                String imgname = request.getParameter("imgname");//杂志图片名
                String instr = request.getParameter("instr");//杂志简介
                System.out.println(bookid+bookname+" "+price+" "+type+" "+cycle+" "+imgname+" "+instr);
                float p=price == null ? null : Float.parseFloat(price);
                Magazines magazines=new Magazines(bookid,bookname,p,type,cycle,instr,imgname);
                boolean b = back.upDataBooks(magazines);
                request.getRequestDispatcher("back_modityBook.jsp").forward(request,response);
                break;
            }
            case "deleteBook":{
                String id = request.getParameter("id");
                if (id!=null&& !"".equals(id)) {
                    boolean b = back.deleteMagazinesById(id);
                    response.getWriter().println(b?1:0);
                }

            }
            case "getAllAdmin":{
                String check = request.getParameter("check");
                switch (check){
                    case "check":{
                        HttpSession session = request.getSession();
                        Admin admin = (Admin) session.getAttribute("admin");
                        int limits = admin.getLimits();
                        response.getWriter().println(limits);
                        break;
                    }
                    case "getdata":{
                        String start = request.getParameter("start");
                        String size = request.getParameter("size");
                        int i = Integer.parseInt(start);
                        int i1 = Integer.parseInt(size);
                        List<Admin> allAdmin = back.getAllAdmin(i*i1, i1);
                        String s = JSON.toJSONString(allAdmin);
                        response.getWriter().println(s);
                        break;
                    }
                    case "delete":{
                        String id = request.getParameter("id");
                        Admin admin=new Admin();
                        admin.setAdmin(id);
                        boolean b = back.deleteAdmin(admin);
                        response.getWriter().println(b?1:0);
                        break;
                    }
                    case "getAdByID":{
                        String id = request.getParameter("ID");
                        String passwd = request.getParameter("passwd");
                        Admin adminlogin = back.adminlogin(id,passwd);
                        String s = JSON.toJSONString(adminlogin);
                        response.getWriter().println(s);
                        break;
                    }
                    case "addAd":{
                        String admin = request.getParameter("admin");
                        String passwd = request.getParameter("passwd");
                        String limits = request.getParameter("limits");
                        String headerImg = request.getParameter("headerImg");
                        Admin admin1=new Admin(admin,passwd,Integer.parseInt(limits),headerImg);
                        System.out.println(admin1);
                        boolean b = back.insertAdmin(admin1);
                        request.getRequestDispatcher("back_AdminMod.jsp").forward(request,response);
                        break;
                    }
                    case "upAdmin":{
                        String admin = request.getParameter("admin");
                        String passwd = request.getParameter("passwd");
                        String limits = request.getParameter("limits");
                        String headerImg = request.getParameter("headerImg");
                        Admin admin1=new Admin(admin,passwd,Integer.parseInt(limits),headerImg);
                        System.out.println(admin1);
                        boolean b = back.setAdmin(admin1);
                        request.getRequestDispatcher("back_AdminMod.jsp").forward(request,response);
                        break;
                    }
                }
                break;
            }
               case "getbackRevenutrendByID":{
                String id = request.getParameter("id");
                List<BackRevenuetrend> backRevenuetrends = back.getbackRevenutrendByID(id);
                String s = JSON.toJSONString(backRevenuetrends);
                System.out.println(s);
                response.getWriter().println(s);
                break;
            }
            case "getManazinesnull":{
                 String active = request.getParameter("active");
                 String start = request.getParameter("start");
                 Map<String, Object> manazinesnull1 = back.getManazinesnull(Integer.parseInt(start));
                 PageHelper.startPage(1, 10);//使用pageHelper开启分页 1是页码 10是页面的size
                 switch(active){
                    case"getsum":{
                        Map<String,Integer> map=new HashMap<>();
                        map.put("sum",(int)manazinesnull1.get("total"));
                        map.put("sumpages",(int)manazinesnull1.get("pages"));
                        map.put("neww",(int)manazinesnull1.get("pageNum"));
                        String t = JSON.toJSONString(map);
                        System.out.println("map********"+t);
                        response.getWriter().println(t);
                        break;
                    }
                    case"getpages":{
                         List<Magazines> ma =( List<Magazines>)manazinesnull1.get("hwlist") ;
                         String s = JSON.toJSONString(ma);
                        response.getWriter().println(s);
                        break;
                    }
                }


                break;
            }
        }
    }
}
