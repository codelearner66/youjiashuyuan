<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2021/11/21
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<meta charset="UTF-8">--%>
    <title>个人中心</title>
    <!--layUI的核心CSS文件 -->
    <link rel="stylesheet" type="text/css" href="../js/layui-v2.6.8/layui/css/layui.css"/>
    <!--layUI的核心JS文件 -->
    <script src="../js/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="../css/user.css" />
</head>
<body>
<div id="top">
    <div class="layui-row">
        <div class="layui-col-xs2">
            <div class="grid-demo grid-demo-bg1" style="color: #FCFCFC;">3/12</div>
        </div>
        <div class="layui-col-xs5">
            <div class="grid-demo">HI，欢迎来到有家书院，订阅热线：400-838-0788，订阅邮箱：vip@youjiashuyuan.com</div>
        </div>
        <div class="layui-col-xs1">
            <div class="grid-demo grid-demo-bg1" style="color: #FCFCFC;">3/12</div>
        </div>
        <div class="layui-col-xs4">
            <div class="grid-demo">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="nav"><a href="index.jsp">首页</a></span>&nbsp;&nbsp;|&nbsp&nbsp;
                <span class="nav"><a href="javascript:">购物车</a></span>&nbsp;&nbsp;|&nbsp&nbsp;
                <span class="nav"><a href="login.jsp">退出</a></span>
            </div>
        </div>
    </div>
    <div id="center">
        <div class="layui-row">
            <div class="layui-col-xs2">
                <div class="grid-demo grid-demo-bg1" style="color: #FCFCFC;">3/12</div>
            </div>
            <div class="layui-col-xs5">
                <div class="grid-demo">
                    <img src="../img/mlogo.jpg"/>
                </div>
            </div>
            <div class="layui-col-xs1">
                <div class="grid-demo grid-demo-bg1" style="color: #FCFCFC;">3/12</div>
            </div>
            <div class="layui-col-xs4">
                <div class="grid-demo">

                </div>
            </div>
        </div>
    </div>
    <div id="center02">
        <div class="layui-row layui-col-space20">
            <div class="layui-col-md2 left">
                <!--左导航-->
                <div class="grid-demo grid-demo-bg1">
                    <div class="left_1">
                        <a href="user.jsp">
                            个人中心
                        </a>

                    </div>
                    <div class="left_1">
                        <a href="order.jsp">
                            我的订单
                        </a>
                    </div>
                    <div class="left_1">
                        <a href="upuser.jsp">
                            修改信息
                        </a>
                    </div>
                    <div class="left_1">
                        <a href="ordervip.jsp">
                            会员中心
                        </a>
                    </div>
                    <div class="left_1">
                        <a href="orderadd.jsp">
                            地址信息
                        </a>
                    </div>
                    <div class="left_1">
                        <a href="ordershou.jsp">
                            售后退款
                        </a>
                    </div>
                </div>
            </div>
            <div class="layui-col-md10 right">
                <!--右内容-->
                <div class="right3" style="margin-top: 0;">
                    <img src="../img/tupian.jpg"/>
                </div>
                <div class="right4">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title" style="color: #CFA47C;font-size: 14px;">
                            <li class="layui-this">待付款</li>
                            <li>待发货</li>
                            <li>代收款</li>
                            <li>已完成</li>
                            <li>已退款</li>
                        </ul>
                        <div class="layui-tab-content"
                             style="height: 100px;border: 1px solid #eaeaea;margin-top: 10px;">
                            <div class="layui-tab-item layui-show">内容不一样是要有，因为你可以监听tab事件（阅读下文档就是了）</div>
                            <div class="layui-tab-item">内容2</div>
                            <div class="layui-tab-item">内容3</div>
                            <div class="layui-tab-item">内容4</div>
                            <div class="layui-tab-item">内容5</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="bot">
        <div id="low_nav">
            <div id="low_main">
                <div class="low_nav_left">
                    <div class="foot_img"><img src="../img/foot_logo.png"/></div>
                    <div class="foot_nav">
                        <div class="foot_nav1">
                            <a href="#">联系书院</a>
                        </div>
                        <div class="foot_nav1">
                            <a href="#">订阅须知</a>
                        </div>
                        <div class="foot_nav1">
                            <a href="#">过刊/现货</a>
                        </div>
                        <div class="foot_nav1">
                            <a href="#">杂志订阅</a>
                        </div>
                        <div class="foot_nav1">
                            <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
                        </div>
                    </div>
                    <div class="hr1"></div>
                    <div class="foot_text">
                        <p style="margin-top: 15px;">&nbsp;&nbsp;ICP备案证书号:粤ICP备19092155号 出版物经营许可证 粤公网安备 44010602007101号
                            © 2018-2020 有家书院 版权所有 杂志网 报刊网 <br><br>杂志订阅 外文期刊 核心期刊 企业订阅 杂志订阅网 外文期刊 书院云
                        </p>
                    </div>
                </div>
                <div class="low_nav_right">
                    <img src="../img/foot_logo1.png"/>
                </div>
            </div>
        </div>
        <!-- //尾部导航栏 -->
    </div>
</div>
</body>
</html>
