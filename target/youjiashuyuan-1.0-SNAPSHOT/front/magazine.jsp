<%@ page import="com.shiyuan.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2021/12/10
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>杂志订阅</title>
    <!--layUI的核心CSS文件 -->
    <link rel="stylesheet" type="text/css" href="../js/layui-v2.6.8/layui/css/layui.css" />
    <!--layUI的核心JS文件 -->
    <script src="../js/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="../css/magazine.css" />
</head>
<body>
<%
    User user = (User) session.getAttribute("User");
%>
<div id="top">
    <!--头部-->
    <div class="layui-row" style="border-bottom: 2px solid #888888;">
        <div class="layui-col-xs2" style="height: 42px;margin-top: 10px;color: white;">
            <div class="grid-demo grid-demo-bg1"></div>
        </div>
        <div class="layui-col-xs4" style="height: 42px;margin-top: 10px;line-height: 42px;">
            <div class="grid-demo" style="font-size: 12px;color: #484848;">
                HI，欢迎来到有家书院，订阅热线：400-838-0788，订阅邮箱：vip@youjiashuyuan.com
            </div>
        </div>
        <div class="layui-col-xs4" style="height: 42px;margin-top: 10px;line-height: 42px;">
            <div class="grid-demo grid-demo-bg1">
                <div class="layui-row">
                    <div class="layui-col-xs9" style="height: 42px;line-height: 42px;">
                        <div class="grid-demo grid-demo-bg1" style="font-size: 12px;color: #484848;">
									<span style="margin-right: 29px;">
										<a href="index.jsp" >首页</a>
									</span>
                            <span style="margin-right: 29px;">
										<a href="javascript:">杂志订阅</a>
									</span>
                            <span style="margin-right: 29px;">
										<a href="javascript:">过刊/现货</a>
									</span>
                            <span style="margin-right: 29px;">
										<a href="javascript:">图书</a>
									</span>
                            <span style="margin-right: 29px;">
										<a href="javascript:">订单查询</a>
									</span>
                            <span style="margin-right: 29px;">
										<a href="javascript:">订阅须知</a>
									</span>
                        </div>
                    </div>
                    <div class="layui-col-xs3" style="height: 42px;line-height: 42px;">
                        <div class="grid-demo" style="font-size: 12px;">
                            <div id="before">
                                <span style="margin-right: 20px;color: #484848;">
										<a href="javascript:" >3秒免注册</a>
									</span>
                                <span style="color: red;">
										<a href="login.jsp" style="color: red;">登录</a>
									</span>
                            </div>
                            <div id="after" style="width:120px;height: 42px ;display: none">
                                    <span>
                                        <a href="user.jsp" >个人中心</a>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <%--登录脚本--%>
                    <script type="text/javascript">
                        let userLenth = "<%=(User)session.getAttribute("newUser")%>";
                        console.log(userLenth.length);
                        if (userLenth.length === 4) {  //用户未登录时
                            $("#before").show();
                        } else {             //用户登录时
                            $("#after").show();
                            $("#before").hide();
                        }

                    </script>
                </div>
            </div>
        </div>
        <div class="layui-col-xs2" style="height: 42px;margin-top: 10px;color: white;">
            <div class="grid-demo"></div>
        </div>
    </div>
    <!--搜索框-->
    <div class="layui-row" style="height: 85px;margin-bottom: 15px;">
        <div class="layui-col-xs2" style="height: 85px;color: white;">
            <div class="grid-demo grid-demo-bg1">s</div>
        </div>
        <div class="layui-col-xs8" style=";height: 85px;">
            <div class="grid-demo">
                <div class="layui-row" style="height: 85px;margin-bottom: 15px;">
                    <div class="layui-col-xs2" style="background-color:white;height: 85px;">
                        <div class="grid-demo grid-demo-bg1">
                            <img src="../img/mlogo.png" style="padding-top: 42px;padding-left: 35px;" />
                        </div>
                    </div>
                    <div class="layui-col-xs8" style="height: 85px;">
                        <div class="grid-demo">
                            <div class="indexsearch2">
                                <form action="" class="layui-form" style="width: 700px;height: 57px;">
                                    <label class="layui-form-label" style="width: 100px; height: 38px;margin-left: 10px;padding: 0px;background-color: white;text-align: center;line-height: 38px;">
                                        <select style="width: 20px;">
                                            <option>杂志名称</option>
                                            <option>邮发号/刊号</option>
                                        </select>
                                    </label>
                                    <div class="layui-input-block" style="width: 700px;margin-left: 13px;margin-top: 10px;">
                                        <input type="text" name="title" placeholder="时代周刊、经济学人、新闻周刊" class="layui-input" style="width: 600px;" />
                                        <input type="button" class="layui-slider-input-btn layui-btn-primary layui-icon " value="&#xe615;" style="width: 45px;height: 39px;" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs2" style="height: 85px;">
                        <div class="grid-demo">
                            <div class="mycart">
                                <a href="javascript:" onclick="toShopCart()">
                                    <i></i> 我的购物车
                                </a>
                                <script type="text/javascript">
                                    function toShopCart(){
                                        let userLenth = "<%=(User)session.getAttribute("newUser")%>";
                                        if (userLenth.length === 4){
                                            window.location="login.jsp";
                                        }else {
                                            window.location="shopping_cart.jsp";
                                        }
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs2" style="height: 85px;color: white;">
            <div class="grid-demo">s</div>
        </div>
    </div>
    <!--轮播图-->
    <div class="layui-carousel" id="test10" style="background-color: white">
        <div carousel-item="">
            <div><img src="../img/mban.png"></div>
            <div><img src="../img/mbann.png"></div>
            <div><img src="../img/lun01.jpg" ></div>
            <div><img src="../img/0075TGutgy1guqkyd0aaij62yo1o07wl02.jpg" ></div>
            <div><img src="../img/zz_img/zz08.jpg" ></div>
            <div><img src="../img/chenggan_tiaogao-010.jpg"></div>
            <div><img src="../img/lun02.jpg" ></div>
        </div>
    </div>
    <!--轮播脚本-->
    <script>
        layui.use(['carousel', 'form'], function() {
            var carousel = layui.carousel,
                form = layui.form;
            //轮播样式
            carousel.render({
                elem: '#test10',
                width: '100%',
                height: '400px',
                interval: 3000
            });

        });
    </script>
</div>
<div id="center">
    <div style="width: 1200px;height: 8px;color: white">a</div>
    <div class="nav1">
        <span style="color: #00A2CA;margin-left: 30px;">首页&nbsp;&nbsp;>&nbsp;&nbsp;</span>
        <span style="color: #00A2CA;">订阅&nbsp;&nbsp;>&nbsp;&nbsp;</span>
        <span style="color: #333333;">杂志列表</span>
    </div>
    <div class="nav2">
        <div class="layui-row">
            <div class="layui-col-xs2" style="height: 120px;">
                <div class="grid-demo grid-demo-bg1">
                    <span style="color: #666666;margin-left: 30px;line-height: 40px;">分类</span>
                    <a href="javascript:"onclick="bottnLi(35)">
                        <div style="width: 44px;height: 24px;background-color:#809eae ;float: right;text-align: center;margin-right: 40px;margin-top: 8px;color: white;">
                            不限
                        </div>
                    </a>
                </div>
            </div>
            <div class="layui-col-xs10" style="height: 100px;margin-top: 10px;margin-bottom: 10px;">
                <div id="type" class="grid-demo"></div>
            </div>
            <%--显示杂志种类脚本--%>
            <script type="text/javascript">
                $(document).ready(function (){
                    $.ajax({
                        type : "post",
                        url : "Magazine",
                        data : {
                            action : "getMagazineForType"
                        },
                        success(data){
                            let html;
                            console.log(data);
                            let list = JSON.parse(data);
                            for(i = 0;i <= list.length;i++){
                                html="<span><a href='javascript:' onclick='bottnLi(" + list[i].t_Id + ")' >"+list[i].t_Name+"</a></span>";
                                $("#type").append(html);
                            }
                        }
                    })
                })
            </script>
        </div>
    </div>
    <div class="nav3">
        <div class="layui-col-xs2" style="height: 50px;">
            <div class="grid-demo grid-demo-bg1">
                <span style="color: #666666;margin-left: 30px;line-height: 50px;">周期</span>
                <a href="javascript:" onclick="bottnLi(35)">
                    <div style="width: 44px;height: 24px;background-color:#809eae ;float: right;text-align: center;margin-right: 40px;margin-top: 13px;color: white;line-height: 25px;">
                        不限
                    </div>
                </a>
            </div>
        </div>
        <div class="layui-col-xs10" style="height: 30px;margin-top: 10px;margin-bottom: 10px;line-height: 30px;">
            <div class="grid-demo">
				<span>
								<a href="javascript:"  onclick="buttonByCycle('7')">周刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('10')" >旬刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('15')">半月刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('30')" >月刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('60')" >双月刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('90')">季刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('180')">半年刊</a>
							</span>
                <span>
								<a href="javascript:" onclick="buttonByCycle('360')">年刊</a>
							</span>
            </div>
        </div>
    </div>
    <div class="main">
        <table >
            <tr>
                <th class="th" style="width: 20%;">有家书院库号</th>
                <th class="th" style="width: 30%;">杂志名称</th>
                <th class="th" style="width: 15%;">期数(期/年)</th>
                <th class="th" style="width: 8%;">周期</th>
                <th class="th" style="width: 12%;">订阅价(元/年)</th>
                <th class="th" style="width: 15%;">订阅</th>
            </tr>
            <table id="table" class="table">
                <%--<tr class="tr">
                    <td class="td" style="width: 20%;">有家书院库号</td>
                    <td class="td" style="width: 30%;line-height: 30px;text-align: left">
                        <div style="margin-top: 10px">
                            杂志名称
                        </div>
                    </td>
                    <td class="td" style="width: 15%;">期数(期/年)</td>
                    <td class="td" style="width: 8%;">周期</td>
                    <td class="td" style="width: 12%;">720(元/年)</td>
                    <td class="td" style="width: 15%;">
                        <button class="button">订阅</button>
                    </td>
                </tr>--%>

            </table>
        </table>
        <div class="fenye">
            <ul id="fenye_ul" class="pagination"></ul>
        </div>
        <!--分页脚本 -->
        <script>
            var currentPage1 = 1;//当前页数
            var totalPage = 1;//最大分页数
            var rows = 10;//每页数据
            var type =35;

            //通过杂志分类分页
            function bottnLi(type) {
                $.ajax({
                    type: "post",
                    url: "Magazine",
                    data: {
                        action: "getMagazinesForPage",
                        type: type,
                        currentPage1,
                        rows: rows
                    },
                    success(data) {
                        var json = JSON.parse(data);
                        totalPage = json.totalPage;
                        rows = json.rows;
                        let html = '<li><a href="javascript:" onclick="" >«</a></li>';
                        buttonPage(1, type);
                        //总页数小于10页则直接显示
                        if(totalPage <= 10){
                            for (i=1 ; i <= totalPage; i++) {
                                html += "<li><a  class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                            }
                        }

                        //总页数大于10页小于20页
                        else if(totalPage > 10 ){
                            for(i=1 ; i <= 4; i++){//显示前4页页码
                                html += "<li><a class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                            }
                            html += "<li style=''><a style='pointer-events: none;'>......</a></li>";
                            for(i=totalPage-3; i<= totalPage;i++ ){
                                html += "<li><a class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                            }
                        }
                        html += "<li><a href='#'>»</a></li>";
                        $('#fenye_ul').html(html);
                        //数据太少关闭分页
                        if(json.list.length < 10){
                            console.log(json.list.length);
                            $(".fenye").css("display","none");
                        }else {
                            $(".fenye").css("display","block");
                        }
                    }
                })
            }
            //通过杂志周期分页
            function buttonByCycle(cycle){
                $.ajax({
                    type: "post",
                    url: "Magazine",
                    data: {
                        action: "getMagazinesForPage",
                        type:35,
                        cycle: cycle,
                        currentPage1:1,
                        rows: rows
                    },
                    success(data) {
                        var json = JSON.parse(data);
                        totalPage = json.totalPage;
                        console.log(cycle);
                        rows = json.rows;
                        let html = '<li><a href="javascript:" onclick="" >«</a></li>';
                        buttonPageByCycle(1, cycle);
                        for (i = 1; i <= json.totalPage; i++) {
                                html += "<li><a class='' onclick='buttonPageByCycle(" + i + "," +cycle+ ")'  href='javascript:' >" + i + "</a></li>"
                        }
                        html += "<li><a href='javascript' onclick='' >»</a></li>";

                        $('#fenye_ul').html(html);
                        //数据太少关闭分页
                        if(json.list.length < 10){
                            console.log(json.list.length);
                            $(".fenye").css("display","none");
                        }else {
                            $(".fenye").css("display","block");
                        }
                    }
                })
            }
            $(document).ready(function () {
                $.ajax({
                    type: "post",
                    url: "Magazine",
                    data: {
                        action: "getMagazinesForPage",
                        type: 35,
                        currentPage1,
                        rows: rows
                    },
                    success(data) {
                        var json = JSON.parse(data);
                        let i =1;
                        totalPage = json.totalPage;
                        rows = json.rows;
                        let html = '<li><a href="#">«</a></li>';
                        buttonPage(1, 35);
                        //总页数小于10页则直接显示
                        if(totalPage <= 10){
                            for (i ; i <= totalPage; i++) {
                                if(i === currentPage1){
                                    html += "<li><a class='active' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                                }else {
                                    html += "<li><a class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                                }
                            }
                        }
                        //总页数大于10页小于20页
                        else if(totalPage > 10 ){
                            for(i ; i <= 4; i++){//显示前4页页码
                                if(i === currentPage1){
                                    html += "<li><a class='active' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                                }else {
                                    html += "<li><a class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                                }
                            }
                            html += "<li style=''><a style='pointer-events: none;'>......</a></li>";
                            for(i=totalPage-3; i<= totalPage;i++ ){
                                html += "<li><a class='' onclick='buttonPage(" + i + "," + type + ")'  href='javascript:' >" + i + "</a></li>"
                            }
                        }
                        html += "<li><a href='#'>»</a></li>";
                        $('#fenye_ul').html(html);
                    }
                })
            })

            //通过杂志分类查询杂志
            function buttonPage(i, type) {
                var n = parseInt(i);
                let sta = $("#table");
                console.log("type = "+type);
                $.ajax({
                    type: "post",
                    url: "Magazine",
                    data: {
                        action: "getMagazinesForPage",
                        type: type,
                        currentPage1: n,
                        rows: rows
                    },
                    success(data) {
                        var list = JSON.parse(data).list;
                        let cycle;
                        sta.empty();
                        for (let i = list.length - 1; i >= 0; i--) {
                            var t = i + 1;
                            if(list[i].m_Cycle === "年刊"){
                                cycle = "1";
                            }else if(list[i].m_Cycle === "旬刊"){
                                cycle = "36";
                            }else if(list[i].m_Cycle === "周刊"){
                                cycle = "50";
                            }
                            else if(list[i].m_Cycle === "月刊"){
                                cycle = "12";
                            }
                            else if(list[i].m_Cycle === "双月刊"){
                                cycle = "6";
                            }
                            else if(list[i].m_Cycle === "半月刊"){
                                cycle = "24";
                            }
                            else if(list[i].m_Cycle === "季刊"){
                                cycle = "4";
                            }
                            else {
                                cycle = "12";
                            }

                            if(i%2 == 0){
                                var modle = "<tr class='tr' style='background-color: #FBFBFB' >"
                                ;
                            } else {
                                var modle = "<tr class='tr' >";
                            }
                            modle += "<td class='td'  style='width: 20%;'>"+list[i].m_ID+"</td>"+
                                "<td class='td' style='width: 30%;line-height: 30px;'><div style='margin-top: 10px'>"+
                                list[i].m_Name+
                                "</div></td>"+
                                "<td class='td' style='width: 15%;'>"+cycle+"</td>"+
                                "<td class='td' style='width: 8%;'>"+list[i].m_Cycle+"</td>"+
                                "<td class='td' style='width: 12%;'>"+list[i].m_Price+"</td>"+
                                "<td class='td' style='width: 15%;'><button class='button'>订阅</button></td></tr>"
                            ;
                            sta.append(modle);
                        }
                    }
                })
            }
            //通过杂志周期查询杂志
            function buttonPageByCycle(i,cycle2){
                var n = parseInt(i);
                let sta = $("#table");
                currentPage1 = n;
                console.log("sadsadas = "+currentPage1);
                $.ajax({
                    type: "post",
                    url: "Magazine",
                    data: {
                        action: "getMagazinesForPage",
                        type:35,
                        cycle: cycle2,
                        currentPage1: n,
                        rows: rows
                    },
                    success(data) {
                        var list = JSON.parse(data).list;
                        let cycle;
                        sta.empty();
                        for (let i = list.length - 1; i >= 0; i--) {
                            var t = i + 1;
                            if(list[i].m_Cycle === "年刊"){
                                cycle = "1";
                            }else if(list[i].m_Cycle === "旬刊"){
                                cycle = "36";
                            }else if(list[i].m_Cycle === "周刊"){
                                cycle = "50";
                            }
                            else if(list[i].m_Cycle === "月刊"){
                                cycle = "12";
                            }
                            else if(list[i].m_Cycle === "双月刊"){
                                cycle = "6";
                            }
                            else if(list[i].m_Cycle === "半月刊"){
                                cycle = "24";
                            }
                            else if(list[i].m_Cycle === "季刊"){
                                cycle = "4";
                            }
                            else {
                                cycle = "12";
                            }

                            if(i%2 == 0){
                                var modle = "<tr class='tr' style='background-color: #FBFBFB' >"
                                ;
                            } else {
                                var modle = "<tr class='tr' >";
                            }
                            modle += "<td class='td' style='width: 20%;'>"+list[i].m_ID+"</td>"+
                                "<td class='td' style='width: 30%;line-height: 30px;'><div style='margin-top: 10px'>"+
                                list[i].m_Name+
                                "</div></td>"+
                                "<td class='td' style='width: 15%;'>"+cycle+"</td>"+
                                "<td class='td' style='width: 8%;'>"+list[i].m_Cycle+"</td>"+
                                "<td class='td' style='width: 12%;'>"+list[i].m_Price+"</td>"+
                                "<td class='td' style='width: 15%;'><button class='button'>订阅</button></td></tr>"
                            ;
                            sta.append(modle);
                        }
                    }
                })
            }
        </script>
    </div>
</div>
<!--尾部-->
<div id="bot">
    <div id="low_nav">
        <div id="low_main">
            <div class="low_nav_left">
                <div class="foot_img"><img src="../img/foot_logo.png" /></div>
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
                    <p style="margin-top: 15px;">&nbsp;&nbsp;ICP备案证书号:粤ICP备19092155号 出版物经营许可证 粤公网安备 44010602007101号 © 2018-2020 有家书院 版权所有 杂志网 报刊网 <br><br>杂志订阅 外文期刊 核心期刊 企业订阅 杂志订阅网 外文期刊 书院云
                    </p>
                </div>
            </div>
            <div class="low_nav_right">
                <img src="../img/foot_logo1.png" />
            </div>
        </div>
    </div>
    <!-- //尾部导航栏 -->
</div>
</body>
</html>
