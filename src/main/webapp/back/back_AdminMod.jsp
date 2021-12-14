<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2021/11/24
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="back_404page.html"%>
<html>
<head>
    <title>修改杂志信息</title>
    <script src="../js/jquery.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../css/back_modityBook.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
    <div class="col-md-12" id="mainTable">
        <div class="col-md-6" id="TableHidden">
            <div class="Formofmagazines col-md-12">
                <form action="BackServlet" id="upload-form" method="post" role="form">
                    <input name="action" type="hidden" value="getAllAdmin">
                    <input type="hidden" id="check" name="check">
                    <input id="imgname" name="imgname" type="hidden" value="##">
                    <div class="form-group col-md-6">
                        <label for="admin">管理员帐号</label>
                        <input class="form-control" readonly="readonly" id="admin" name="admin" value="" type="text">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="passwd">管理员密码</label>
                        <input class="form-control" id="passwd" name="passwd" value=""  type="text">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="limits">管理员权限等级</label>
                        <input class="form-control" id="limits" name="limits" value=""  type="text">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="headerImg">管理员头像地址</label>
                        <input class="form-control" id="headerImg" name="headerImg" value=""  type="text">
                    </div>
                </form>
                <form enctype="multipart/form-data" id="pre_img" method="post" role="form">
                    <div class="form-group col-md-12 imgup">
                        <div class="col-md-6">
                            <label for="inputfile">用户头像上传</label>
                            <input id="inputfile"  name="upload-img" type="file">
                            <p class="help-block">请选择用户头像（只支持 jpg,jpeg格式图片）</p>
                            <a class="upload btn  btn-info">点击预览</a>
                        </div>
                        <div class="col-md-6">
                            <h5>用户头像</h5>
                            <img alt="用户头像" class="img-rounded" id="zazhiF" src="../img/20.jpg">
                        </div>
                    </div>
                </form>
                <div class="buttom col-md-12">
                    <button class="btn btn-primary" form="upload-form" type="submit">提交</button>
                    <button onclick="$('#TableHidden').slideToggle()" type="button">关闭</button>
                </div>
            </div>
        </div>
        <div class="col-md-12" id="mainShow">
            <div class="book_show col-md-12">
                <table class="table table-hover table-bordered">
                    <tr id="TitleTap">
                        <th>序号</th>
                        <th>管理员帐号</th>
                        <th>管理员密码</th>
                        <th>权限等级</th>
                        <th>头像地址</th>
                        <th>添加管理员</th>
                        <th>修改账号</th>
                        <th>删除账号</th>
                    </tr>
                    <tr id="table_main"></tr>
                </table>
                <nav aria-label="...">
                    <ul class="pager">
                        <li><a href="#" id="prepage" onclick="PrePage()">上一页</a></li>
                        <li><a href="#" id="nextpage" onclick="NextPage()">下一页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</div>
<script>
    //page设置分页的初始位置
    //size设置分页每页的数据量
    //maxpage表示总共有多少页
    var page = 0;
    var pagesize = 10;
    var maxpage = 10;
    $(document).ready(function () {
        $.ajax({
            type: "post",
            url: "BackServlet",
            data: {
                action: "getPageSum",
                TableName: "admintable",
                size: pagesize
            },
            success(data) {
                maxpage = data;
                getpages();
            }
        }),
            // $.ajax({
            //   type: "post",
            //   url: "BackServlet",
            //   data: {
            //     action: "getAllAdmin",
            //     start: page,
            //     size: pagesize
            //   },
            //   success(data) {
            //     var parse = JSON.parse(data);
            //     var sta = $("#table_main");
            //     for (var i = parse.length - 1; i >= 0; i--) {
            //       var t = i + 1;
            //       var modle = "<tr class='modlle'> " + "      <td>" + t + "</td>\n" +
            //               "                    <td>" + parse[i].admin + "</td>\n" +
            //               "                    <td>" + parse[i].passwd + "</td>\n" +
            //               "                    <td>" + parse[i].limits + "</td>\n" +
            //               "                    <td>" + parse[i].headerImg + "</td>\n" +
            //               "                    <td><button class='btn-danger'  onclick=deleteBook(\'" + parse[i].m_ID + "\')>删除</button></td>\n" +
            //               "                    <td><button class='btn-primary' onclick=ModityeBook(\'" + parse[i].m_ID + "\')>修改</button></td>\n" +
            //               "                </tr>";
            //       sta.after(modle);
            //     }
            //     console.log(parse);
            //   }
            // }),
            $(".upload").click(function () {
                var formData = new FormData($("#pre_img")[0]);
                formData.append("action", "uploadimg");//添加信息头 让后台servlet识别为文件上传
                $.ajax({
                    type: "POST",
                    url: "BackServlet",
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (data, status) {
                        var s = parseInt(data);
                        if (!isNaN(s)) {
                            if (s === 1) {
                                alert("图片格式错误！请检查...");
                            }
                            if (s === 2) {
                                alert("图片大小超出限制！请检查...");
                            }
                        } else {
                            console.log(data)
                            $("#zazhiF").attr("src", data);
                            $("#imgname").attr("value", data);
                            $("#headerImg").val(data);
                            console.log($("#imgname").val());
                        }
                    }
                })
            })
    })

    function PrePage() {
        if (page > 0) {
            $(".modlle").remove();
            page = page - 1;
            getpages();
        } else {
            $("#prepage").css("disabled", "true");
        }
    }

    function NextPage() {

        if (page < maxpage) {
            $(".modlle").remove();
            page = page + 1;
            getpages();
        } else {
            $("#nextpage").css("disabled", "true");
        }
    }

    function getpages() {
        $.ajax({
            type: "post",
            url: "BackServlet",
            data: {
                action: "getAllAdmin",
                check:"getdata",
                start: page,
                size: pagesize
            },
            success(data) {
                var parse = JSON.parse(data);
                var sta = $("#table_main");
                console.log(parse);
                for (var i = parse.length - 1; i >= 0; i--) {
                    var t = i + 1;
                    var modle = "<tr class='modlle'> " + "      <td>" + t + "</td>\n" +
                        "                    <td>" + parse[i].admin + "</td>\n" +
                        "                    <td>" + parse[i].passwd + "</td>\n" +
                        "                    <td>" + parse[i].limits + "</td>\n" +
                        "                    <td>" + parse[i].headerImg + "</td>\n" +
                        "                    <td><button class='btn-primary'  onclick=addAdmin(\'" + "\')>添加</button></td>\n" +
                        "                    <td><button class='btn-primary' onclick=ModityeBook(\'" + parse[i].admin + "\',\'"+parse[i].passwd+"\')>修改</button></td>\n" +
                        "                    <td><button class='btn-danger'  onclick=deleteAdmin(\'" + parse[i].admin + "\')>删除</button></td>\n" +
                        "                </tr>";
                    sta.after(modle);
                }
            }
        })
    }

    function deleteAdmin(id) {
        let b = confirm("管理员账号删除后可能带来不可挽回的损失，是否确定要删除！" + id);
        if(b){
            $.ajax({
                type:"post",
                url: "BackServlet",
                data: {
                    action: "getAllAdmin",
                    check:"delete",
                    id:id
                },
                success: function (data) {
                    let number = parseInt(data);
                    if(number===0){
                        alert("删除失败！")
                    }
                    else{
                        alert("删除成功！");
                        $(".modlle").remove();
                        getpages();
                    }
                }
            })
        }
    }

    function ModityeBook(id,passwd) {
        $('#TableHidden').slideToggle();
        $.ajax({
            type: "post",
            url: " BackServlet",
            data: {
                action: "getAllAdmin",
                check:"getAdByID",
                ID:id,
                passwd:passwd
            },
            dataType: 'json',
            success: function (parse) {
                console.log(parse);
                console.log(parse.m_Name);
                $("#check").val("upAdmin")
                $("#admin").val(parse.admin);
                $("#passwd").val(parse.passwd);
                $("#limits").val(parse.limits);
                $("#headerImg").val(parse.headerImg);
                $("#zazhiF").attr("src",parse.headerImg);
            }
        })
    }
    function addAdmin(){
        $('#TableHidden').slideToggle();
        $("#check").val("addAd");
        $("#admin").attr("required",true).attr("readonly",false);
        $("#passwd").attr("required",true);
        $("#limits").attr("required",true);
        $("#headerImg").attr("required",true);
    }
</script>
</body>
</html>
