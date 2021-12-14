<%@ page import="com.shiyuan.entity.back.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2021/10/28
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="back_404page.html" %>
<%!
  Admin ad=null;
%>
<%
 ad=(Admin) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html target="_top">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有家书院后台管理</title>
    <script src="../js/jquery.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="../css/back_index.css"/>
</head>
<body>
<div id="boddy" class="container-fluid">
    <!--头部导航栏-->
    <div id="nav" class="col-md-12 navbar-fixed-top">
        <div class="col-md-3">
            <h3 style="color: white" class="col-md-9">有家书院后台管理系</h3>
            <button id="button" class="col-md-2 btn btn-default btn-md">
                <span style="color: white" class="glyphicon glyphicon-menu-hamburger"></span>
            </button>
        </div>
        <div class="col-md-offset-6 col-md-3">
            <div class="col-md-12">
                <a class="col-md-6">当前用户：<span id="imgid"><img src="<%=ad.getHeaderImg()%>" alt="头像" class="img-circle"/></span></a>
                <div class="dropdown">
                    <button class="btn button btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        <span style="color: white" class="glyphicon glyphicon-wrench"></span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="javascript:void(0)" onclick="location.reload()">刷新</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="back_login.html">切换帐号</a></li>
                        <li><a href="javascript:" onclick="custom_close()">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="main" class="col-md-12">
        <!--左侧边栏-->
        <div id="left_Nav" class="col-md-2">

            <div class="col-md-12">
                <!--第一个下拉菜单-->
                <div class="nameDiv col-md-12">
                    <span class="glyphicon glyphicon-home col-md-1" onclick="clicktochange('后台首页','back_default.html')"> </span>
                    <a id="downlist" class="btn col-md-3 downlist" onclick="clicktochange('后台首页','back_default.html')">后台首页</a>
                    <span class="sgin col-md-offset-4 col-md-1 glyphicon glyphicon-menu-right"
                          onclick="onbuttonclick('list')"></span>
                </div>
                <div id="list" class="col-md-offset-1 col-md-10 list" style="display: none;">
                </div>

                <!--第二个下拉菜单-->
                <div class="nameDiv col-md-12">
                    <span class="glyphicon glyphicon glyphicon-user col-md-1" onclick="onbuttonclick('list1')"> </span>
                    <a id="downlist1" class="btn col-md-3 downlist" onclick="onbuttonclick('list1')">用户管理</a>
                    <span class="sgin col-md-offset-4 col-md-1 glyphicon glyphicon-menu-right"
                          onclick="onbuttonclick('list1')"></span>
                </div>
                <div id="list1" class="col-md-offset-1 col-md-10 list" style="display: none;">
                    <a class="col-md-12" onclick="clicktochange('账单查询','backUserData.html')" href="javascript:">账单查询</a>
                    <a class="col-md-12" onclick="clicktochange('消费趋势','Echart.html')" href="javascript:">消费趋势</a>
                </div>
                <!--第三个下拉菜单-->
                <div class="nameDiv col-md-12">
                    <span class="glyphicon glyphicon glyphicon-cog col-md-1" onclick="onbuttonclick('list2')"> </span>
                    <a id="downlist2" class="btn col-md-3 downlist" onclick="onbuttonclick('list2')">管理员设置</a>
                    <span class="sgin col-md-offset-4 col-md-1 glyphicon glyphicon-menu-right"
                          onclick="onbuttonclick('list2')"></span>
                </div>
                <div id="list2" class="col-md-offset-1 col-md-10 list" style="display: none;">
                    <a class="col-md-12" onclick="LimitCheck()"  href="javascript:void(0)">管理员管理</a>
                </div>
                <!--第四个下拉菜单-->
                <div class="nameDiv col-md-12">
                    <span class="glyphicon glyphicon glyphicon-yen col-md-1" onclick="onbuttonclick('list3')"> </span>
                    <a id="downlist3" class="btn col-md-3 downlist" onclick="onbuttonclick('list3')">财务报表</a>
                    <span class="sgin col-md-offset-4 col-md-1 glyphicon glyphicon-menu-right"
                          onclick="onbuttonclick('list3')"></span>
                </div>
                <div id="list3" class="col-md-offset-1 col-md-10 list" style="display: none;">
                    <a class="col-md-12" onclick="clicktochange('总体销量','sellSort.html')" href="javascript:void(0)">总体销量</a>
                    <a class="col-md-12" onclick="clicktochange('销售趋势','back_strend.jsp')" href="javascript:void(0)">销售趋势</a>
                    <a class="col-md-12" onclick="clicktochange('单本分析','back_singleAnalysis.jsp')" href="javascript:void(0)">单本分析</a>
                </div>
                <!--第五个下拉菜单-->
                <div class="nameDiv col-md-12">
                    <span class="glyphicon glyphicon glyphicon glyphicon-book col-md-1"
                          onclick="onbuttonclick('list4')"> </span>
                    <a id="downlist4" class="btn col-md-3 downlist" onclick="onbuttonclick('list4')">报刊管理</a>
                    <span class="sgin col-md-offset-4 col-md-1 glyphicon glyphicon-menu-right"
                          onclick="onbuttonclick('list4')"></span>
                </div>
                <div id="list4" class="col-md-offset-1 col-md-10 list" style="display: none;">
                    <a class="col-md-12" onclick="clicktochange('添加报刊','addBooks.jsp')" href="javascript:void(0)">添加报刊</a>
                    <a class="col-md-12" onclick="clicktochange('更新报刊','back_modityBook.jsp')" href="javascript:void(0)">更新报刊</a>
                </div>
            </div>
        </div>
        <!--右侧显示区域-->
        <div id="right_main" class="col-md-10">
            <div id="right_all" class="col-md-12">
                <div id="nav_sign" class="col-md-12">
                    <!--上一步图标-->
                    <div class="col-md-1">
                        <a><span class="fast_button col-md-2 glyphicon  glyphicon-fast-backward"> </span></a>
                    </div>
                    <!--标签显示 -->
                    <div id="bqList" class="col-md-10">

                    </div>
                    <!--下一步图标-->
                    <div class="col-md-1">
                        <a><span class="fast_button col-md-offset-10 col-md-2 glyphicon glyphicon-fast-forward"> </span></a>
                    </div>
                </div>
                <div id="iframeDiv" class="col-md-12">
                    <iframe class="col-md-12 ifram viewDatault" src="back_default.html"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/back_index.js"></script>
<script>
    /*
    *侧边导航展开收缩
    * */
    function onbuttonclick(name) {
        var n = "#" + name;
        $(n).slideToggle(500);
    }

    var flag = false;
    $("#button").click(function () {
        if (!flag) {
            console.log(flag);
            $("#left_Nav").removeClass("col-md-2").addClass("col-md-1");
            $(".downlist").css("display", "none");
            $(".sgin").css("display", "none");
            $("#right_main").removeClass("col-md-10").addClass("col-md-11");
            $(".list").removeClass("col-md-10").addClass("col-md-11");
        } else {
            console.log(flag);
            $("#left_Nav").removeClass("col-md-1").addClass("col-md-2");
            $(".downlist").css("display", "inline-block");
            $(".sgin").css("display", "inline-block");
            $("#right_main").removeClass("col-md-11").addClass("col-md-10");
            $(".list").removeClass("col-md-11").addClass("col-md-10");
        }
        flag = !flag;
    })
    function custom_close(){
        var b = confirm("您确定要关闭本页吗？");
        if(b){
            //向后台发送请求移除session中的管理员信息
            $.ajax({
                type:"post",
                url:"BackServlet",
                data:{
                    action:"clearout"
                },
                success(data,state){
                    window.close();
                    window.open("back_login.html","_top")
                }
            })

        }
    }
    function LimitCheck(){
        $.ajax({
            type: "post",
            url: "BackServlet",
            data:{
                action:"getAllAdmin",
                check:"check"
            },
            success(data, state) {
                let number1 = parseInt(data);
                if(number1===1){
                    clicktochange('管理员管理','back_AdminMod.jsp');
                }
                else{
                      alert("您的权限等级不够！无法查看...");
                      return;
                }
            }
        })
    }
</script>
</body>
</html>

