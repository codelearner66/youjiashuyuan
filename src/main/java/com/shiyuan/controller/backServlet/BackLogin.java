package com.shiyuan.controller.backServlet;

import com.shiyuan.service.Impl.BackServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "BackLogin", value = "/back/BackLogin")
public class BackLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BackServiceImpl back=new BackServiceImpl();
        String acc = request.getParameter("account");
        String passwd = request.getParameter("passwd");
        if(acc==null||passwd==null||"".equals(acc)||"".equals(passwd)) response.sendRedirect("back_login.html");
        if (back.checkadmin(acc, passwd)) {
            HttpSession admin = request.getSession();
            admin.setAttribute("admin", back.adminlogin(acc, passwd));
            request.getRequestDispatcher("back_index.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("back_login.html");
        }
    }
}
