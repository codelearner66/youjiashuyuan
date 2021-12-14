<%@ page import="com.shiyuan.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2021/11/27
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <!--layUI的核心CSS文件 -->
    <link rel="stylesheet" type="text/css" href="../js/layui-v2.6.8/layui/css/layui.css" />
    <!--layUI的核心JS文件 -->
    <script src="../js/layui-v2.6.8/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
    <script src="../js/jquery.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="../css/user.css" />
    <link rel="stylesheet" type="text/css" href="../css/user2.css" />
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
                <span class="nav"><a href="index.jsp" style="margin: 0">首页</a></span>&nbsp;&nbsp;|&nbsp&nbsp;
                <span class="nav"><a href="javascript:" style="margin: 0">购物车</a></span>&nbsp;&nbsp;|&nbsp&nbsp;
                <span class="nav"><a href="login.jsp" style="margin: 0">退出</a></span>
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
                    <img src="../img/mlogo.jpg" />
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
                <div style="width: 900px;height: 233px;">
                    <div style="width: 260px;height: 233px; background-color: #d2b984; border-radius: 30px 0 0 0;margin-right: 0;">
                        <table style="width: 260px;height: 50%; color: white; border-bottom: 1px solid #808080;">
                            <tr>
                                <td><img src="../img/touxiang.jpg" style="margin-right: 20px; margin-left: 20px; margin-top: 10px;">
                                    <p style="margin-left: 100px; margin-top: -45px; font-size: 14px;">有家书院</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="margin-left: 90px; font-size: 20px;">注册会员</p>
                                </td>
                            </tr>
                        </table>
                        <table style="margin: auto; margin-top: 20px;">
                            <tr>
                                <td>消费金额</td>
                            </tr>
                            <tr>
                                <td style="margin-left: 190px;">0.00</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <%
                        User user = (User) session.getAttribute("newUser");
                    %>
                    <div style="width: 625px;height: 231px; margin-left: 260px;border: 1px solid #eaeaea;margin-top: -233px;">
                        <div style="width: 620px; height: 30px; border-bottom: 1px solid #e1d9c9;">
                            <p style="float: left; color: #D2B984; margin-left: 20px; margin-top: 2px;font-size: 16px;">会员专享权力</p>
                            <p>
                                <%--<span style="margin-left: 80px;font-size: 15px">重置密码</span><button class="layui-icon layui-icon-set-sm" id="but3" onclick="" style="width: 30px;height: 30px;margin-left: 15px">
                                </button>--%>
                               <form id="form2"  method="post"
                                       style="width: 420px;height: 189px;margin:0 auto;background-color: #fcfcfc;"><%--action="UsersServlet?action=upPass"--%>
                                      <span style="font-size: 15px;margin-left: 50px">当前密码：</span>
                                      <input type="password" size="32" id="oldPass" required="required" name="oldpass" style="width: 160px;height: 22px;margin-bottom: 10px"/>
                                      <span id="msg1" style="font-size: 12px;color: red">*</span><br>
                                      <span style="font-size: 15px;margin-left: 65px">新密码：</span>
                                      <input type="password" size="32" id="pass" required="required" name="newPassCheck" style="width: 160px;height: 22px;margin-bottom: 10px"/>
                                      <span id="msg2" style="font-size: 12px;color: red">*</span><br>
                                      <span style="font-size: 15px;margin-left: 20px">再次输入密码：</span>
                                      <input type="password" size="32" id="newPass" onchange="resetPass()" onblur="" required="required" name="newPass" style="width: 160px;height: 22px;margin-bottom: 10px"/>
                                      <span id="msg3" style="font-size: 12px;color: red">*</span><br>
                                      <input type="reset" id="reset" value="重置"
                                            style="width: 40px;height: 26px;background-color: #f2dede;border: 1px solid darkslateblue;margin-left: 130px;margin-top: 20px"/>
                                      <input type="button" disabled="disabled" onclick="submitPass()" id="but4" value="确定"
                                           style="width: 40px;height: 26px;background-color: #f2dede;border: 1px solid darkslateblue;margin-left: 10px"/>
                               </form>
                                <a href="javascript:" id="but3" onclick="" style="float: right; color: #D2B984; margin-top: 2px;font-size: 16px;">修改密码</a>
                            </p>
                            <%--修改密码脚本--%>
                            <script type="text/javascript">
                                $("#form2").hide();
                                //弹窗脚本
                                layui.use('layer', function () { //独立版的layer无需执行这一句
                                    var $1 = layui.jquery,
                                        layer = layui.layer; //独立版的layer无需执行这一句
                                    $1('#but3').on('click', function () {
                                        layer.open({
                                            type: 1,
                                            title: '修改密码',
                                            skin: 'layui-layer-rim', //加上边框
                                            area: ['420px', '240px'], //宽高
                                            content: $1("#form2"),
                                            cancel: function(index, layero){
                                                if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
                                                    $("#form2").hide();
                                                    layer.closeAll('page');
                                                }
                                                return false;
                                            }
                                        });
                                    });
                                })

                                function resetPass(){
                                    let pass = $("#pass").val();
                                    let newPass = $("#newPass").val();
                                    if(pass === newPass){
                                        console.log("asdasdasdasdsadsa");
                                        $("#but4").attr("disabled",false);
                                    }else {
                                        $("#msg2").text("两次输入密码不一致");
                                        $("#msg3").text("两次输入密码不一致");
                                        $("#pass").css("border","2px solid red");
                                        $("#newPass").css("border","2px solid red");
                                        $("#pass").focus(function (){
                                            $("#msg2").text("*");
                                            $("#msg3").text("*");
                                            $("#pass").css("border","2px solid #4c3434");
                                            $("#newPass").css("border","2px solid #4c3434");
                                        })
                                    }
                                }

                                function submitPass(){
                                    let oldPass = $("#oldPass").val();//用户输入的passwd
                                    let newPass = $("#newPass").val();
                                    if(oldPass === '<%=user.getPasswd()%>'){
                                        console.log("<%=user.getPasswd()%>");
                                        //con=confirm("你确定要修改?");
                                        // 在页面上弹出对话框
                                        layer.confirm('你确定要修改？',function (index){
                                            $.ajax({
                                                type: "post",
                                                url : "UsersServlet",
                                                data:{
                                                    action:"upPass",
                                                    newPass:newPass,
                                                },
                                                success(data){
                                                    console.log(data);

                                                }
                                            })
                                            //alert("修改密码成功,请重新登录!");
                                            layer.msg('修改密码成功,请重新登录!', {icon: 6});
                                            setTimeout(function () {
                                                window.location.href="login.jsp";  //转到login页面
                                            }, 1000);
                                        })
                                        /*if(con === true){
                                            $.ajax({
                                                type: "post",
                                                url : "UsersServlet",
                                                data:{
                                                    action:"upPass",
                                                    newPass:newPass,
                                                },
                                                success(data){
                                                    console.log(data);
                                                }
                                            })
                                            alert("修改密码成功,请重新登录!");
                                            window.location.href="login.jsp";
                                        }*/
                                    }else {
                                        $("#oldPass").val("");
                                        $("#pass").val("");
                                        $("#newPass").val("");
                                        layer.alert("当前密码错误！");
                                    }
                                }
                            </script>
                        </div>
                        <div>
                            <p style="font-size: 14px; margin-left: 260px; margin-top: 80px;">更多特权尽请期待</p>
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
</div>
</body>

</html>
