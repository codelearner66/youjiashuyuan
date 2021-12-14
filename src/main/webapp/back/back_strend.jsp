<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2021/12/7
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script type="text/javascript" src="../js/echarts.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../css/back_strend.css">
    <style>
    </style>
</head>
<body>
<div class="container-fluid">
    <div id="showType" class="col-md-12">
        <div class="col-md-12" style="height: 80px;">
            <h3 style="text-align: center">请勾选出您要查看的分类，最多勾选五种！</h3><br>
            <div class="col-md-12" style="height: 10px;"></div>
        </div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="1">外国期刊</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="2"> 蟋蟀童书</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="3"> 经济金融</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="4"> 政论时事</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="5"> 法律军事</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="6"> 母婴亲情</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="7"> 教育文学</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="8"> 少儿阅读</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="9"> 管理科学</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="10"> 职场培训</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="11"> 建筑设计</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="12"> 自然科学</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="13"> 旅游地理</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="14"> 美化住宅</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="15"> 贸易制造</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="16"> 高端时尚</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="17"> 娱乐摄影</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="18"> 运动生活</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="19"> 交通运输</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="20"> 健康美食</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="21"> 数码电子</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="22"> 艺术收藏</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="23"> 医疗生物</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="24"> 水利能源</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="25"> 环境安全</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="26"> 农业科学</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="27"> 服饰美容</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="28"> 社会科学</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="29"> 高校学报</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="30"> 航空航天</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="31"> 外文版</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="32"> 无线电自动化</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="33"> 报纸</input>
        </label></div>
        <div class="col-md-1"><label class="checkbox-inline">
            <input type="checkbox" class="checkbox" name="checkbox" value="34">其他</input>
        </label></div>
        <div id="buttonP" class="col-md-12">
             <span style="line-height: 40px;margin-right: 0;padding-right: 0;" class="col-md-12">
                  <h4 class="col-md-2"><B>选定后双击刷新----></B></h4>
                  <button class="btn-xs btn-default col-md-1" id="buttonofchecked">刷新折线图</button>
              </span>
        </div>
    </div>
    <div class="col-md-12" id="echarts">
        <div id="Echart1" class="col-md-12">

        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        var myChart = echarts.init(document.getElementById("Echart1"));
        window.onresize = function () {
            myChart.resize();
        };
        // 绘制图表
        option = {
            title: {
                text: '近期销售趋势'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['国外期刊', '职场培训', '建筑设计', '自然科学', '旅游地理']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['2015', '2016', '2017', '2018', '2019', '2020', '2021']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '国外期刊',
                    type: 'line',
                    stack: 'Total',
                    data: [120, 132, 0, 134, 90, 230, 210]
                },
                {
                    name: '职场培训',
                    type: 'line',
                    stack: 'Total',
                    data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: '建筑设计',
                    type: 'line',
                    stack: 'Total',
                    data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name: '自然科学',
                    type: 'line',
                    stack: 'Total',
                    data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name: '旅游地理',
                    type: 'line',
                    stack: 'Total',
                    data: [820, 932, 901, 100, 1290, 1330, 1320]
                }
            ]
        };
        myChart.setOption(option);
        var checked = new Set();//被选中的type id;
        var checkedName = ['外国期刊', '蟋蟀童书', '经济金融', '政论时事',
            '法律军事', '母婴亲情', '教育文学', '少儿阅读', '管理科学', '职场培训', '建筑设计',
            '自然科学', '旅游地理', '美化住宅', '贸易制造', '高端时尚', '娱乐摄影', '运动生活',
            '交通运输', '健康美食', '数码电子', '艺术收藏', '医疗生物', '水利能源', '环境安全', '农业科学', '服饰美容',
            '社会科学', '高校学报', '航空航天', '外文版', '无线电自动化', '报纸', '其他'];
        var bookList = [];//被选中的图书列表
        var bookmap = new Map();
        var temp = new Map();
        $("#buttonofchecked").click(function () {
            doclick();
        })

        function doclick() {
            $(".checkbox:checked").each(function () {
                checked.add($(this).val());
            });
            if (checked.size > 0) {
                var tx = 0;
                for (var x of checked.keys()) {
                    bookList.push(checkedName[parseInt(x) - 1]);
                    bookmap.set(tx, checkedName[parseInt(x) - 1]);
                    getdate(tx, x);
                    tx++;
                }
                var ttttt = new Map();
                var yyyy = new Map();
                var t = 0;
                var max = 0;
                var maxdata;
                for (var ldata = 0; ldata < temp.size; ldata++) {
                    var parse = JSON.parse(temp.get(ldata));
                    var xdate = [];
                    var ydate = [];
                    var i = 0;
                    for (; i < parse.length; i++) {
                        xdate.push(parse[i].dat);
                        ydate.push(parseFloat(parse[i].money));
                    }
                    if (parse.length > max) {
                        maxdata = xdate;
                        max = parse.length;
                    }
                    ttttt.set(t, xdate);
                    yyyy.set(t, ydate);
                    t++;
                }
                //把数据合并成 name + data
                myChart.setOption({
                    legend: {
                        data: bookList
                    },
                    xAxis: {
                        data: maxdata
                    },
                    series: [
                        {
                            name: bookmap.get(0),
                            data: yyyy.get(0)
                        },
                        {
                            name: bookmap.get(1),
                            data: yyyy.get(1)
                        },
                        {
                            name: bookmap.get(2),
                            data: yyyy.get(2)
                        },
                        {
                            name: bookmap.get(3),
                            data: yyyy.get(3)
                        },
                        {
                            name: bookmap.get(4),
                            data: yyyy.get(4)
                        },

                    ]
                })
                ttttt.clear();
                yyyy.clear();
                checked.clear();
                bookList.length = 0;
                bookmap.clear();
                temp.clear();
            }
        }

        function getdate(t, i) {
            let ajax = $.ajax({
                type: 'post',
                url: "BackServlet",
                data: {
                    checkdata: i,
                    action: 'getBack_strend'
                },
                success(data) {
                    temp.set(t, data);
                }
            });
        }
    })
</script>
</body>
</html>