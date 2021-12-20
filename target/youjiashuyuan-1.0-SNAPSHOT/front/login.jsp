<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: ccx
  Date: 2021/9/19
  Time: 14:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/login.css" />
    <title>欢迎登录</title>
</head>
<body>
<div id="all_page">
    <div id="header">
        <div id="header_main">
            <div class="hello">HI，欢迎来到有家书院！</div>
            <div class="header_nav">
                <a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;
                <a href="#">我的书院</a>
            </div>
        </div>
    </div>
    <!--头部导航栏-->
    <div id="main">
        <!-- //中间主界面 -->
        <div id="main_header">
            <div id="main_context">
                <div class="empty"> </div>
                <div class="logo">
                    <span class="span1">有家书院</span>
                    <span class="span2">全球杂志订阅中心</span>
                </div>
                <div class="login_nav">
                    <div class="empty2"> </div>
                    <div class="nav_to_forget">
                        <a id="change_main" href="#">尚未有账号，马上注册 >>></a>
                    </div>
                </div>
            </div>
        </div><!-- //主界面头部 -->
        <div id="main_form">
            <div id="form_context">
                <div id="form_left">
                    <div class="h_text">
                        会员登陆
                    </div>
                    <div id="form_1" class="form_1">
                        <%
                            session.removeAttribute("user");
                        %>
                        <form action="LoginServlet" method="post">
                            <input name="action" value="login" type="hidden">
                            <input id="act1" class="account" name="account" type="text" autocomplete="true"  required="required" placeholder="请输入帐号..." />
                            <input id="pwd1"  class="passwd" name="passwd" type="password" required="required" placeholder="请输入您的密码..." />
                            <input id="submit1" type="submit" class="submit" value="登录" />
                            <div class="find_mima"><a href="#">忘记密码？</a></div>
                            <br>
                            <div class="check">
                                <input type="checkbox" name="checkbox" value="check" required="required" checked="checked" class="checkbox" id="check1">
                                &nbsp;&nbsp;&nbsp;<span>我已看过并同意<b>有家书院注册协议和隐私政策</b></span>
                            </div>
                        </form>
                    </div>
                    <div id="form_2" class="form_1" style="display: none;" onsubmit="return checkForm1()">
                        <form action="LoginServlet" method="post">
                            <input name="action" value="zhuce" type="hidden">
                            <input id="act2" class="account" name="account" required="required" type="text" placeholder="请输入帐号..." />
                            <div class="yuanxheng">
                                <input id="yanzhengma" required="required" type="text" name="yanzheng"  placeholder="请输入验证码">
                                <input type="button" id="button" value="获取验证码" />
                            </div>
                            <input id="pwd2" class="passwd" required="required" name="passwd" type="password" placeholder="请填写您的登录密码..." />
                            <input id="submit" class="submit" type="submit" value="立即注册"/>
                            <br>
                            <div class="check">
                                <input type="checkbox" name="checkbox" value="check" required="required"  checked="checked" class="checkbox" id="check2">
                                &nbsp;&nbsp;&nbsp;<span>我已看过并同意<b>有家书院注册协议和隐私政策</b></span>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="form_right">
                    <div class="empty3"> </div>
                    <div class="right_context">
                        <p>使用合作网站账号快速登陆</p>
                    </div>
                    <div class="hr"> </div>
                    <div class="logo_div">
                        <div class="qq">
                            <span class="qq_span"><a href="#"><img src="../img/user_img/user02.jpg" /></a></span>
                            <span class="qq_span1"><a id="qq_nav" href="#">QQ帐号</a></span>
                        </div>
                        <div class="weixin">
                            <span class="weixin_span"><a href="#"><img src="../img/user_img/user03.jpg" /></a></span>
                            <span class="weixin_span1"><a id="weixin_nav" href="#">微信帐号</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- //主界面表单 -->
    </div>
    <div id="low_nav">
        <div id="low_main">
            <div class="low_nav_left">
                <div class="foot_img"><img src="../img/foot_logo.png" /></div>
                <div class="foot_nav">
                    <div class="foot_nav1"><a href="#">联系书院</a></div>
                    <div class="foot_nav1"><a href="#">订阅须知</a></div>
                    <div class="foot_nav1"><a href="#">过刊/现货</a></div>
                    <div class="foot_nav1"><a href="#">杂志订阅</a></div>
                    <div class="foot_nav1"><a href="#">首页</a></div>
                </div>
                <div class="hr1">  </div>
                <div class="foot_text">
                    <p>&nbsp;&nbsp;ICP备案证书号:粤ICP备19092155号 出版物经营许可证 粤公网安备 44010602007101号 © 2018-2020
                        有家书院 版权所有 杂志网 报刊网 杂志订阅 外文期刊 核心期刊 企业订阅 杂志订阅网 外文期刊 书院云
                    </p>
                </div>
            </div>
            <div class="low_nav_right">
                <img src="../img/foot_logo1.png" />
            </div>
        </div>

    </div><!-- //尾部导航栏 -->
</div>
<script src="../js/jquery.js"></script>
<script src="../js/login.js"></script>
<%
    Enumeration<String> attributeNames = request.getAttributeNames();
    while(attributeNames.hasMoreElements()){
        String tem=attributeNames.nextElement();
        if (tem.equals("msg")){
            String  msg=(String) request.getAttribute("msg");
            PrintWriter myout = response.getWriter();
            myout.println("<script type=\"text/javascript\">");
            myout.println("alert(\""+msg+"\");");
            myout.println("</script>");
        }
    }
%>
</body>
</html>