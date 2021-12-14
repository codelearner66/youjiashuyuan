<%@ page import="java.util.List" %>
<%@ page import="com.shiyuan.entity.Magazines" %>
<%@ page import="com.shiyuan.entity.PageBean" %>
<%@ page import="com.shiyuan.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8"/>
    <title>有家书院</title>
    <!--layUI的核心CSS文件 -->
    <link rel="stylesheet" type="text/css" href="../js/layui-v2.6.8/layui/css/layui.css"/>
    <!--layUI的核心JS文件 -->
    <script src="../js/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="../css/index.css"/>
</head>
<body>
<%--头部导航--%>
<div id="top">
    <div class="hand_nav">
        <div class="logo">
            <a href="/">
                <img src="../img/logo.png" width="152px" height="43px"/>
            </a>
        </div>
        <div class="indexrdg">
            <%session.setAttribute("user",session.getAttribute("user"));%>
            <a href="login.jsp" id="but1" class="layui-btn layui-btn-primary layui-border-white  layui-btn-sm" style="background-color: #3c66a3;border-radius: 50%;margin-top: 3px">登录</a>
            <a href="login.jsp" id="but2" class="layui-btn layui-btn-primary layui-border-white  layui-btn-sm" style="background-color: #3c66a3;border-radius: 50%;margin-top: 3px" >注册</a>
            <%--用户登录脚本--%>
            <script type="text/javascript">
                var userLenth = "<%=(User)session.getAttribute("user")%>".length;
                var sta = $(".indexrdg");
                console.log(userLenth);
                if (userLenth == 4) {  //用户未登录时
                    $("#but1").show();
                    $("#but2").show();
                } else {             //用户登录时
                    $("#but1").hide();
                    $("#but2").hide();
                    var user = "<%=(User)session.getAttribute("user")%>";
                    console.log(user);
                    $.ajax({
                        type: "post",
                        url: "MainServlet",
                        data: {
                            action: "getUser",
                            user: user,
                        },
                        success(data) {
                            console.log(user);
                            var json = JSON.parse(data);
                            console.log(json);
                            var name = '';
                            if(json.name === null || json.name === "" || json.name === undefined){
                                name = json.account;
                            }else {
                                name = json.name;
                            }
                            var modle = "<a href='javascript:' class='user_imge' onmouseenter='xianshi()' style='display: block;width: 100px;height: 1px;margin-left: 50px' ><img src='../" + json.touxiang + "'/></a>" +
                                '<span class="user_fromation">' +
                                '<img src="../' + json.touxiang + '" style="border-radius: 50%;width: 70px;height: 70px;" /> <br> '+
                                "&nbsp;&nbsp;&nbsp;" + name +"<br>"+
                                "<button class='user_exit' onclick='toUsers()'  style='width:60px; '>个人中心</button>  "+
                                "<BUTTON  class='user_exit' onclick='toIogin()' style='' >退出</BUTTON>" +
                                '</span>'
                            ;
                            sta.html(modle);
                        }
                    })
                }
                function toIogin(){
                    con=confirm("你确定要退出?"); //在页面上弹出对话框
                    if(con==true){
                        window.location.href="login.jsp";
                    }
                }
                function toUsers(){
                    window.location.href="user.jsp";
                }
                function xianshi() {
                    //头像hover事件
                    $(".user_imge ").mouseenter(function () {
                        $(".user_fromation").css("display", "block");
                    })
                    $(".user_fromation").mouseenter(function () {
                        $(".user_fromation").css("display", "block");
                    })
                    $(".user_imge").mouseleave(function () {
                        $(".user_fromation").css("display", "none");
                    })
                    $(".user_fromation").mouseleave(function () {
                        $(".user_fromation").css("display", "none");
                    })
                }//用户信息的显示
            </script>
        </div>
        <div class="hotline">订阅热线：400 838 0788</div>
        <ul class="navlist">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="">杂志订阅</a></li>
            <li><a href="">过刊/现货</a></li>
            <li><a href="">图书</a></li>
            <li><a href="">订单查询</a></li>
            <li><a href="aboutbook.html">关于书院</a></li>
        </ul>
        <div class="cls"></div>
        <div class="indexsearch">
            <form action="" class="layui-form">
                <label class="layui-form-label"
                       style="width: 100px; height: 38px;padding: 0px;margin-left: 40px; margin-right: 0px; background-color: white;text-align: center;line-height: 38px;">
                    <select>
                        <option>杂志名称</option>
                        <option>邮发号/刊号</option>
                    </select>
                </label>
                <div class="layui-input-block" style="width: 650px;">
                    <input type="text" name="title" placeholder="时代周刊、经济学人、新闻周刊" class="layui-input"
                           style="width: 620px;"/>
                    <input type="button" class="layui-slider-input-btn layui-btn-primary layui-icon " value="&#xe615;"
                           style="width: 45px;height: 38px;"/>
                </div>
            </form>
        </div>
        <div class="handtext">
            <p>高尔基说：</p><br>
            <p>书籍是人类进步的阶梯</p>
        </div>
    </div>
</div>
<%--主题内容--%>
<div id="main">
    <!--  轮播图 -->
    <div class="layui-carousel" id="test2" style="margin-top: 15px;margin-left: auto;margin-right: auto;">
        <div carousel-item="">
            <div><img src="../img/zz_img/zz02.png" style="width: 800px;height: 300px;"/></div>
            <div><img src="../img/zz_img/zz03.jpg" style="width: 800px;height: 300px;"/></div>
            <div><img src="../img/zz_img/zz15.jpg" style="width: 800px;height: 300px;"/></div>
            <div><img src="../img/zz_img/zz13.jpg" style="width: 800px;height: 300px;"/></div>
            <div><img src="../img/zz_img/zz16.jpg" style="width: 800px;height: 300px;"/></div>
            <div><img src="../img/zz_img/zz11.jpg" style="width: 800px;height: 300px;"/></div>
        </div>
    </div>
    <%--轮播图脚本    --%>
    <script>
        // 改变下时间间隔、动画类型、高度、宽度
        layui.use(['carousel', 'form'], function () {
            var carousel = layui.carousel
                , form = layui.form;
            carousel.render({
                elem: '#test2'
                , interval: 2200
                , anim: 'fade'
                , width: '800px'
                , height: '300px'

            });
        });
    </script>
    <h2>热门杂志推荐</h2>
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title" style="width: 600px;margin: 0 auto;">
            <li class="layui-this" onclick="bottnLi(1)">国外期刊</li>
            <li onclick="bottnLi(27)">服饰美容</li>
            <li onclick="bottnLi(11)">建筑设计</li>
            <li onclick="bottnLi(9)">管理科学</li>
            <li onclick="bottnLi(4)">政论时事</li>
            <li onclick="bottnLi(3)">经济金融</li>
        </ul>
        <hr/>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show" style="border:4px solid #ebcbbe;">
                <ul id="main_ul" class="mainList"></ul>
                <div class="fenye">
                    <ul id="fenye_ul" class="pagination"></ul>
                </div>
            </div>
            <!--分页脚本 -->
            <script>
                var currentPage1 = 1;
                var totalPage = 1;//最大分页数
                var rows = 2;//每页数据
                var type = 1;

                function bottnLi(type) {
                    $.ajax({
                        type: "post",
                        url: "MainServlet",
                        data: {
                            action: "getMagazinesForPage",
                            type: type,
                            currentPage1,
                            rows: 2
                        },
                        success(data) {
                            var json = JSON.parse(data);
                            totalPage = json.totalPage;
                            rows = json.rows;
                            let html = '<li><a href="javascript:">«</a></li>';
                            buttonPage(1, type);
                            console.log("type = " + type);
                            for (i = 1; i <= json.totalPage; i++) {
                                html += "<li><a class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i +
                                    "</a></li>"
                            }
                            html += "<li><a href='javascript'>»</a></li>";
                            $('#fenye_ul').html(html);
                        }
                    })
                }

                $(document).ready(function () {
                    $.ajax({
                        type: "post",
                        url: "MainServlet",
                        data: {
                            action: "getMagazinesForPage",
                            type: 1,
                            currentPage1,
                            rows: 2
                        },
                        success(data) {
                            var json = JSON.parse(data);
                            totalPage = json.totalPage;
                            rows = json.rows;
                            let html = '<li><a href="#">«</a></li>';
                            buttonPage(1, 1);
                            for (i = 1; i <= json.totalPage; i++) {
                                html += "<li><a class='' onclick='buttonPage(" + i + "," + 1 + ")'  href='javascript:' >" + i + "</a></li>"
                            }
                            html += "<li><a href='#'>»</a></li>";
                            $('#fenye_ul').html(html);
                        }
                    })
                })

                function buttonPage(i, type) {
                    var n = parseInt(i);
                    $.ajax({
                        type: "post",
                        url: "MainServlet",
                        data: {
                            action: "getMagazinesForPage",
                            type: type,
                            currentPage1: n,
                            rows: 2
                        },
                        success(data) {
                            var list = JSON.parse(data).list;
                            var sta = $("#main_ul");
                            sta.empty();
                            for (var i = list.length - 1; i >= 0; i--) {
                                var t = i + 1;

                                var modle = " <li class='mainList_li_frist'>" +
                                    " <div class='mainList_li_div'> <a href='#'> <div class='mainList_li_img'>" +

                                    " <img src='" + list[i].m_ImgUrl + "'></div>" +
                                    " <div class='mainList_li_introduce'>" +
                                    list[i].m_Name +
                                    "  <span >价格：" +
                                    list[i].m_Price +
                                    "(元)<br>订阅周期：" +
                                    list[i].m_Cycle +
                                    "</span></div></a></div></li>"
                                ;
                                sta.append(modle);
                            }
                        }
                    })
                }
            </script>
        </div>
    </div>
</div>
<%--尾部--%>
<div id="bot">
    <div id="low_nav">
        <div id="low_main">
            <div class="low_nav_left">
                <div class="foot_img"><img src="../img/foot_logo.png"/></div>
                <div class="foot_nav">
                    <div class="foot_nav1"><a href="#">联系书院</a></div>
                    <div class="foot_nav1"><a href="#">订阅须知</a></div>
                    <div class="foot_nav1"><a href="#">过刊/现货</a></div>
                    <div class="foot_nav1"><a href="#">杂志订阅</a></div>
                    <div class="foot_nav1"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></div>
                </div>
                <div class="hr1"></div>
                <div class="foot_text">
                    <p style="margin-top: 15px;">&nbsp;&nbsp;ICP备案证书号:粤ICP备19092155号 出版物经营许可证 粤公网安备 44010602007101号 © 2018-2020
                        有家书院 版权所有 杂志网 报刊网 <br><br>杂志订阅 外文期刊 核心期刊 企业订阅 杂志订阅网 外文期刊 书院云
                    </p>
                </div>
            </div>
            <div class="low_nav_right">
                <img src="../img/foot_logo1.png"/>
            </div>
        </div>
    </div><!-- //尾部导航栏 -->
</div>
</body>
</html>
