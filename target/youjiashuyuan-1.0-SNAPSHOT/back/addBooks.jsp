<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2021/11/17
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  errorPage="back_404page.html" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加杂志</title>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/back_addbooks.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/upload.js"></script>
</head>
<body>

<div class="container-fluid">
    <div class="main col-md-12">
        <div class="book_show col-md-7">
            <table class="table table-hover table-bordered">
                <tr id="TitleTap">
                    <th>序号</th>
                    <th>图书编号</th>
                    <th>杂志名称</th>
                    <th>杂志价格</th>
                    <th>杂志分类</th>
                    <th>杂志期型</th>
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
        <div class="Formofmagazines col-md-5">
            <form action="BackServlet" method="post" role="form" id="upload-form">
                <input type="hidden" name="action" value="addbook">
                <input type="hidden" name="imgname" value="##" id="imgname">
                <div class="form-group col-md-6">
                    <label for="name">杂志名称</label>
                    <input class="form-control" id="name" name="name" placeholder="请输入名称" type="text">
                </div>
                <div class="form-group col-md-6">
                    <label for="price">杂志价格</label>
                    <input class="form-control" id="price" name="price" placeholder="请输入价格" type="text">
                </div>
                <div class=" col-md-6">
                    <label class="col-md-12" for="select">杂志分类</label>
                    <select class="select" id="select" name="type" size="1">
                        <option selected value="1">外国期刊</option>
                        <option value="2"> 蟋蟀童书</option>
                        <option value="3"> 经济金融</option>
                        <option value="4"> 政论时事</option>
                        <option value="5"> 法律军事</option>
                        <option value="6"> 母婴亲情</option>
                        <option value="7"> 教育文学</option>
                        <option value="8"> 少儿阅读</option>
                        <option value="9"> 管理科学</option>
                        <option value="10"> 职场培训</option>
                        <option value="11"> 建筑设计</option>
                        <option value="12"> 自然科学</option>
                        <option value="13"> 旅游地理</option>
                        <option value="14"> 美化住宅</option>
                        <option value="15"> 贸易制造</option>
                        <option value="16"> 高端时尚</option>
                        <option value="17"> 娱乐摄影</option>
                        <option value="18"> 运动生活</option>
                        <option value="19"> 交通运输</option>
                        <option value="20"> 健康美食</option>
                        <option value="21"> 数码电子</option>
                        <option value="22"> 艺术收藏</option>
                        <option value="23"> 医疗生物</option>
                        <option value="24"> 水利能源</option>
                        <option value="25"> 环境安全</option>
                        <option value="26"> 农业科学</option>
                        <option value="27"> 服饰美容</option>
                        <option value="28"> 社会科学</option>
                        <option value="29"> 高校学报</option>
                        <option value="30"> 航空航天</option>
                        <option value="31"> 外文版</option>
                        <option value="32"> 无线电自动化</option>
                        <option value="33"> 报纸</option>
                        <option value="34"> 其他</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="col-md-12" for="select1">期型分类</label>
                    <select class="select" id="select1" name="cycle" size="1">
                        <option selected value="10">旬刊</option>
                        <option value="15"> 半月刊</option>
                        <option value="180"> 半年刊</option>
                        <option value="30"> 月刊</option>
                        <option value="360"> 年刊</option>
                        <option value="60"> 双月刊</option>
                        <option value="7"> 周刊</option>
                        <option value="90"> 季刊</option>
                    </select>
                </div>
            </form>
            <form method="post" role="form" id="pre_img" enctype="multipart/form-data">
                <div class="form-group col-md-12 imgup">
                    <div class="col-md-6">
                        <label for="inputfile">杂志封面上传</label>
                        <input name="upload-img" id="inputfile" type="file">
                        <!--<input type="hidden" name="imgname" value="##" id="imgname">-->
                        <p class="help-block">请选择杂志封面（只支持 jpg,jpeg格式图片）</p>
                        <a class="upload btn  btn-info">点击预览</a>
                    </div>
                    <div class="col-md-6">
                        <h5>封面预览</h5>
                        <img alt="杂志封面" class="img-rounded" id="zazhiF" src="img/20.jpg">
                    </div>
                </div>
            </form>
            <div class="textarea col-md-12">
                <label for="textarea">杂志简介</label>
                <textarea class="form-control col-md-6" name="instr" id="textarea" rows="3" form="upload-form"></textarea>
            </div>
            <div class="buttom col-md-12">
                <button class="btn btn-primary" type="submit" form="upload-form">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    //page设置分页的初始位置
    //size设置分页每页的数据量
    //maxpage表示总共有多少页
    var page = 0;
    var pagesize =10;
    var maxpage = 10;
    $(document).ready(function () {
        $.ajax({
            type: "post",
            url: "BackServlet",
            data: {
                action:"getPageSum",
                TableName:"magazines",
                size: pagesize
            },
            success(data) {
                maxpage=data;
                console.log("maxpage"+maxpage);
            }

        });
        $.ajax({
            type: "post",
            url: "BackServlet",
            data: {
                action: "getM",
                start: page,
                size: pagesize
            },
            success(data) {
                var parse = JSON.parse(data);
                var sta = $("#table_main");
                for (var i = parse.length - 1; i >= 0; i--) {
                    var t = i + 1;
                    var modle = "<tr class='modlle'> " + "      <td>" + t + "</td>\n" +
                        "                    <td>" + parse[i].m_ID + "</td>\n" +
                        "                    <td>" + parse[i].m_Name + "</td>\n" +
                        "                    <td>" + parse[i].m_Price + "</td>\n" +
                        "                    <td>" + parse[i].m_Type + "</td>\n" +
                        "                    <td>" + parse[i].m_Cycle + "</td>\n" +
                        "                </tr>";
                    sta.after(modle);
                }
                console.log(parse);
            }
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

        if (page < maxpage-1) {
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
            url: " BackServlet",
            data: {
                action: "getM",
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
                        "                    <td>" + parse[i].m_ID + "</td>\n" +
                        "                    <td>" + parse[i].m_Name + "</td>\n" +
                        "                    <td>" + parse[i].m_Price + "</td>\n" +
                        "                    <td>" + parse[i].m_Type + "</td>\n" +
                        "                    <td>" + parse[i].m_Cycle + "</td>\n" +
                        "                </tr>";
                    sta.after(modle);
                }
                console.log(parse);
            }
        })
    }
    $(".upload").click(function (){
        var formData = new FormData($("#pre_img")[0]);
        formData.append("action","uploadimg");//添加信息头 让后台servlet识别为文件上传
        $.ajax({
            type:"POST",
            url:"BackServlet",
            data: formData,
            cache:false,
            processData:false,
            contentType:false,
            success:function (data,status){
                var s = parseInt (data);
                if(!isNaN(s)){
                    if(s===1){
                        alert("图片格式错误！请检查...");
                    }
                    if(s===2){
                        alert("图片大小超出限制！请检查...");
                    }
                }
                else{
                    console.log(data)
                    $("#zazhiF").attr("src",data);
                    $("#imgname").attr("value",data);
                    console.log($("#imgname").val());
                }
            }
        });

    });//
</script>
</body>
</html>
