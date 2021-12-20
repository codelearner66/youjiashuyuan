<%@ page import="com.shiyuan.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2021/12/15
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <!--layUI的核心CSS文件 -->
    <link rel="stylesheet" type="text/css" href="../js/layui-v2.6.8/layui/css/layui.css"/>
    <!--layUI的核心JS文件 -->
    <script src="../js/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="../css/magazine.css"/>
</head>
<body>
<%
    User user = (User) session.getAttribute("newUser");
%>
<div id="top" style="height: 180px">
    <!--头部-->
    <div class="layui-row" style="border-bottom: 2px solid #EBEBEB;">
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
										<a href="index.jsp">首页</a>
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
										<a href="javascript:">3秒免注册</a>
									</span>
                                <span style="color: red;">
										<a href="login.jsp" style="color: red;">登录</a>
									</span>
                            </div>
                            <div id="after" style="width:120px;height: 42px ;display: none">
                                    <span>
                                        <a href="user.jsp">个人中心</a>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <%--登录脚本--%>
                    <script type="text/javascript">
                        var user = "<%=(User)session.getAttribute("newUser")%>";
                        if (user.length === 4) {  //用户未登录时
                            $("#before").show();
                        } else {             //用户登录时
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
                                }
                            })
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
    <div class="layui-row"
         style="height: 85px;margin-bottom: 15px;padding-bottom: 20px;border-bottom: 2px solid #EBEBEB;">
        <div class="layui-col-xs2" style="height: 85px;color: white;">
            <div class="grid-demo grid-demo-bg1">s</div>
        </div>
        <div class="layui-col-xs8" style=";height: 85px;">
            <div class="grid-demo">
                <div class="layui-row" style="height: 85px;margin-bottom: 15px;">
                    <div class="layui-col-xs2" style="background-color:white;height: 85px;">
                        <div class="grid-demo grid-demo-bg1">
                            <img src="../img/mlogo.png" style="padding-top: 42px;padding-left: 35px;"/>
                        </div>
                    </div>
                    <div class="layui-col-xs8" style="height: 85px;">
                        <div class="grid-demo">
                            <div class="indexsearch2">
                                <form action="" class="layui-form" style="width: 700px;height: 57px;">
                                    <label class="layui-form-label"
                                           style="width: 100px; height: 38px;margin-left: 10px;padding: 0px;background-color: white;text-align: center;line-height: 38px;">
                                        <select style="width: 20px;">
                                            <option>杂志名称</option>
                                            <option>邮发号/刊号</option>
                                        </select>
                                    </label>
                                    <div class="layui-input-block"
                                         style="width: 700px;margin-left: 13px;margin-top: 10px;">
                                        <input type="text" name="title" placeholder="时代周刊、经济学人、新闻周刊" class="layui-input"
                                               style="width: 600px;"/>
                                        <input type="button"
                                               class="layui-slider-input-btn layui-btn-primary layui-icon "
                                               value="&#xe615;" style="width: 45px;height: 39px;"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs2" style="height: 85px;">
                        <div class="grid-demo">
                            <div class="mycart">
                                <a href="#">
                                    <i></i> 我的购物车
                                </a>
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
</div>
<div style="width: 100%;float: left;margin-bottom: 30px">
    <div id="cartcon">
    <%--购物车头部--%>
    <div style="width: 100%;height: 44px;background-color: #F5F5F5;border: 1px solid #EBEBEB;margin-bottom: 20px;float: left">

        <div class="cart1">
            <input class="overhover selectall" type="checkbox" id="" ><span style="">全选</span>
            <%--全选脚本--%>
            <script type="text/javascript">
                $(".selectall").click(function(){
                    $("input[type='checkbox']").each( function() {
                        if($(this).prop("checked")===true) {
                            $("input[type='checkbox']").prop('checked', true);
                        } else {
                            $("input[type='checkbox']").prop('checked', false);
                        }
                    });
                })
            </script>
        </div>
        <div style="width: 332px;height: 44px;line-height: 44px;font-size: 14px;color: #000;float: left">
            <span>商品信息</span>
        </div>
        <div style="width: 152px;height: 44px;line-height: 44px;font-size: 14px;color: #000;float: left">
            <span>加入购物车时间</span>
        </div>
        <div style="width: 120px;height: 44px;line-height: 44px;font-size: 14px;color: #000;float: left">
            <span>单价</span>
        </div>
        <div style="width: 141px;height: 44px;line-height: 44px;font-size: 14px;color: #000;float: left">
            <span>数量</span>
        </div>
        <div style="width: 87px;height: 44px;line-height: 44px;font-size: 14px;color: #000;float: left">
            <span>小计</span>
        </div>
        <div style="width: 30px;height: 44px;line-height: 44px;font-size: 14px;color: #000;float: left">
            <span>操作</span>
        </div>
    </div>
    <%--购物车内容--%>
    <div style="width: 100%;height: auto">
        <ul class="cartlist">
           <%-- <li>
                <div style="width: 44px;height: 100%;padding-left: 37px;float: left;line-height: 68px">
                    <input class="overhover" name="qx" style="margin-top: 25px" type="checkbox" >
                </div>
                <div style="width: 332px;height: 100%;float: left;margin-left: 80px;">
                   <p style="font-size: 14px;color: #000000;margin-top: 15px">
                       杂志名称
                   </p>
                    <div class="cartdy">
                       订阅周期：全年订阅（6期）
                    </div>
                </div>
                <div class="addcartdy">
                    <span>2021-09-20 00:00:00</span>
                </div>
                <div class="price">
                    <span>￥450.00</span>
                </div>
                <div style="width: 140px;height: 22px;float: left;margin-left: 20px">
                    <input type="button" class="butjian"   >
                    <input type="number"   oninput="if (value<1)value=1" value="1" class="txtshu" >
                    <input type="button" class="butjia" >
                </div>
                <div style="width: 80px;height: 68px;line-height: 68px;float: left;margin-left: 20px;margin-right: 20px">
                    <span>￥450.00</span>
                </div>
                <div style="width: 28px;height: 22px;float: left">
                    <a href="javascript:">
                        删除
                    </a>
                </div>
            </li>--%>
        </ul>
        <script type="text/javascript">

                let account="<%=((User) session.getAttribute("newUser")).getAccount()%>";
                $.ajax({
                    type:'POST',
                    url : 'Shopping',
                    data : {
                        action : "getShoppingCart",
                        account : account
                    },
                    success(data){
                        console.log(data);
                        let list = JSON.parse(data);
                        for (let i=0 ; i<=list.length ;i++){
                            let model =  "<li><div style='width: 44px;height: 100%;padding-left: 37px;float: left;line-height: 68px'>"+
                                " <input class='overhover' name='qx' style='margin-top: 25px' type='checkbox' ></div>"+
                                "<div style='width: 332px;height: 100%;float: left;margin-left: 80px;'><p style='font-size: 14px;color: #000000;margin-top: 15px'>"+
                                list[i].name+
                                "</p><div class='cartdy'>订阅周期：全年订阅（6期）</div></div>"+
                                "<div class='addcartdy'>"+
                                "<span>"+list[i].date+"</span></div>"+
                                "<div class='price'><span>￥"+list[i].price+"</span></div>"+
                                " <div style='width: 140px;height: 22px;float: left;margin-left: 20px'>"+
                                "<input type='button' class='butjian' ><input type='number '  oninput='if (value<1)value=1' value='"+list[i].num+"' class='txtshu' >"+
                                "<input type='button' class='butjia' ></div>"+
                                "<div style='width: 80px;height: 68px;line-height: 68px;float: left;margin-left: 20px;margin-right: 20px'>"+
                                "<span>￥"+list[i].xiaoji+"</span></div><div style='width: 28px;height: 22px;float: left'>"+
                                "<a href='javascript:'>删除</a></div></li>";
                            $(".cartlist").append(model);
                        }
                    }
                })
        </script>
    </div>
    <%--购物车尾部--%>
    <div style="width: 100%;height: 68px;background-color: #F5F5F5;border: 1px solid #EBEBEB;margin-top: 20px;float: left">
        <div class="cart2">
            <input class="overhover selectall" type="checkbox"  ><span style="">全选</span>
        </div>
        <div style="width: 281px;height: 68px;line-height: 68px;font-size: 14px;color: #000;float: left">
            <a href="javascript:">批量删除</a>
        </div>
        <div style="width: 140px;height: 68px;line-height: 68px;font-size: 14px;color: #000;float: right">
                 <a href="javascript:" style="display: block;background: #b4a078;text-align: center;font-size: 18px;color: #fff;">
                     提交订单
                 </a>
        </div>
    </div>
</div>
</div>
<!--尾部-->
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
                    <p style="margin-top: 15px;">&nbsp;&nbsp;ICP备案证书号:粤ICP备19092155号 出版物经营许可证 粤公网安备 44010602007101号 ©
                        2018-2020 有家书院 版权所有 杂志网 报刊网 <br><br>杂志订阅 外文期刊 核心期刊 企业订阅 杂志订阅网 外文期刊 书院云
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
</body>
</html>
