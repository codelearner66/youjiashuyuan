<%@ page import="com.shiyuan.entity.User" %><%--
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
    <link rel="stylesheet" type="text/css" href="../css/user.css"/>
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
                <%
                    User user = (User) session.getAttribute("newUser");
                %>
                <div class="right5">
                        <div class="right5_img">
                            <img src="<%=user.getTouxiang()%>"/>
                            <span style=" font-size: 15px;text-align: center;margin-left: 20px;">
                                 昵称：<input type="text"  id="name" onchange="checkName()"  name="name" value="<%=user.getName()%>" style="width: 150px;height: 24px;"/>
									 <input type="button" value="修改" id="but2"  style="width: 35px;height: 25px;background-color: #ffffff;border: 1px solid darkslateblue;"/>
                            </span>
                            <%--更新用户昵称脚本--%>
                            <script type="text/javascript">
                                $("#but2").hide();
                                function checkName() { /*检验昵称*/
                                    let name = $("#name").val();
                                    console.log(name);
                                    $.ajax({
                                        type: "post",
                                        url: "UsersServlet",
                                        data: {
                                            action: "checkName",
                                            name: name,
                                        },
                                        success(data) {
                                            console.log(data);
                                            var m = parseInt(data);
                                            if (m === 1) {
                                                alert("昵称可用");
                                                $("#but2").show();
                                            } else {
                                                $("#but2").hide();
                                                alert(data);
                                            }
                                        }
                                    })
                                }
                                $('#but2').click(function () {
                                    //修改昵称提示
                                    let name = $('#name').val();
                                    $.ajax({
                                        type: 'POST' ,
                                        url:  'UsersServlet',
                                        data:{
                                            action: 'upName',
                                            name : name,
                                        },
                                        success(data) {
                                            console.log(data);
                                            alert(data);
                                        }
                                    })
                                })
                            </script>
                        </div>
                    <div class="right6">
                        <form id="form1" style="margin: 0;font-size: 15px">
                            <div class="layui-form-item" style="height: 30px;margin-bottom: 15px">
                                <label class="layui-form-label" style="width: 70px;padding-right: 0">性别：</label>
                                <div class="layui-input-block" >
                                    <input type="radio" name="sex" value="男" title="男" style="width: 20px;height: 20px">男
                                    <input type="radio" name="sex" value="女" title="女" style="width: 20px;height: 20px">女
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">个人简介：</label>
                                <div class="layui-input-block">
                                    <textarea placeholder="请输入内容" class="layui-textarea"
                                              style="width: 300px;"></textarea>
                                </div>
                            </div>
                        </form>
                 <%--       <form id="form2"  method="post"
                              style="width: 420px;height: 189px;margin:0 auto;background-color: #fcfcfc;">&lt;%&ndash;action="UsersServlet?action=upPass"&ndash;%&gt;
                            <input type="password" size="32" id="oldPass" required="required" name="oldpass"/><span
                                    style="font-size: 15px;">请输入当前密码</span><br>
                            <input type="password" size="32" id="pass" required="required" name="newPassCheck"/><span style="font-size: 15px;">请输入新密码</span><br>
                            <input type="password" size="32" id="newPass" onchange="resetPass()" required="required" name="newPass"/>
                            <span style="font-size: 15px;">请再次输入密码</span><br>
                            <input type="reset" id="reset" value="重置"
                                   style="width: 40px;height: 26px;background-color: #f2dede;border: 1px solid darkslateblue;margin-left: 150px"/>
                            <input type="button" disabled="disabled" onclick="submitPass()" id="but4" value="确定"
                                   style="width: 40px;height: 26px;background-color: #f2dede;border: 1px solid darkslateblue;margin-left: 10px"/>
                        </form>
                        &lt;%&ndash;修改密码脚本&ndash;%&gt;
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
                                    alert("两次输入密码不一致！");
                                }
                            }

                            function submitPass(){
                                let oldPass = $("#oldPass").val();//用户输入的passwd
                                let newPass = $("#newPass").val();
                                if(oldPass === '<%=user.getPasswd()%>'){
                                    console.log("<%=user.getPasswd()%>");
                                    con=confirm("你确定要修改?"); //在页面上弹出对话框
                                    if(con==true){
                                        $.ajax({
                                            type: "post",
                                            url : "UsersServlet",
                                            data:{
                                                action:"upPass",
                                                newPass:newPass,
                                            },
                                            success(data){
                                                console.log(newPass);
                                                console.log(data+"asdsadsadsa");
                                            }
                                        })
                                        alert("修改密码成功,请重新登录!");
                                        window.location.href="login.jsp";
                                    }
                                }else {
                                    $("#oldPass").val("");
                                    $("#pass").val("");
                                    $("#newPass").val("");
                                    alert("输入密码错误！");
                                }
                            }
                        </script>--%>
                    </div>
                    <div class="right3" style="margin-top:70px;">
                        <img src="../img/tupian.jpg"/>
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
