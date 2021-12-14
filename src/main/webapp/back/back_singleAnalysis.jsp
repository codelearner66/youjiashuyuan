<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2021/12/10
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../js/echarts.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../css/back_singeAnalysis.css">
</head>
<body>

<didv class="container-fluid">
      <div class="col-md-12">
          <div class="book_show col-md-12" style="height: 575px">
              <table class="table table-hover table-bordered">
                  <tr id="TitleTap">
                      <th>序号</th>
                      <th>杂志名称</th>
                      <th>杂志价格</th>
                      <th>杂志分类</th>
                      <th>销售量</th>
                      <th>总收入</th>
                      <th>销售趋势</th>
                  </tr>
                  <tr id="table_main"></tr>
              </table>
              <nav aria-label="...">
                  <ul class="pager">
                      <li><a href="javascript:void(0)" onclick="location.reload()">刷新</a></li>
                      <li><a href="javascript:void(0)" id="prepage" onclick="PrePage()">上一页</a></li>
                      <li>跳转到&nbsp;<input type="text" onchange="getchanges()" class="for form-inline" id="skippages"/> </li>
                      <li>当前页码<span id="newpages">1</span></li>
                      <li>总页码<span id="allpages">1</span></li>
                      <li><a href="javascript:void(0)" id="nextpage" onclick="NextPage()">下一页</a></li>
                  </ul>
              </nav>
          </div>

      </div>

     <div class="col-md-12" id="echarts">
         <div class="col-md-12">
             <h4 style="text-align: center">单本销售趋势图</h4>
         </div>
        <div id="Echart1" class="col-md-12" style="height: 500px">

        </div>
    </div>
</didv>


<script>
    var myChart  = echarts.init(document.getElementById("Echart1"));
    window.onresize = function () {
        myChart.resize();
    };
    option = {
        backgroundColor: '#fff',
        title: {
            text: "营销额（元）",
            left: "2%",
            top: "0",
            textStyle: {
                color: "#999",
                fontSize: 12,
                fontWeight: '400'
            }
        },
        color: ['#73A0FA', '#73DEB3', '#FFB761'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                },
                lineStyle: {
                    type: 'dashed'
                }
            }
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        legend: {
            data: ['订单总笔数']
        },
        xAxis: {
            type: 'category',
            data: ['01-01', '01-02', '01-03', '01-04', '01-05', '01-06', '01-07'],
            splitLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: true
            },
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                color: '#999',
                textStyle: {
                    fontSize: 12
                },
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#F3F4F4'
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
        },
        series: [{
            name: '订单总笔数',
            type: 'line',
            smooth: true,
            data: [13,1,4,44,45,322,76]
        }
        ]
    };
    myChart.setOption(option);
    function  showTrender(bookid,name){
        var Xname=[];
        Xname.push(name);
        $.ajax({
            url  : "BackServlet",
            type : "post",
            data:{
                action:"getbackRevenutrendByID",
                id:bookid
            },
            dataType: "json",
            success(data){
                var xdate=[];
                var ydate=[];
                var i=0;
                for(;i<data.length;i++){
                    xdate.push(data[i].dat);
                    ydate.push(parseFloat( data[i].money));
                }
                myChart.setOption({
                    legend: {
                        data: Xname
                    },
                    xAxis: {
                        data:xdate
                    },
                    series: [{
                        name: name,
                        data: ydate
                    }]
                })
            }
        })
    }
    //page设置分页的初始位置
    //size设置分页每页的数据量
    //maxpage表示总共有多少页
    var page = 1;
    var maxpage = 10;
    var pagesize=10;

    //输入页码跳转
    function getsumpage(){
        $.ajax({
            type: "post",
            url: "BackServlet",
            data: {
                action: "getManazinesnull",
                active: "getsum",
                start: page,
            },
            dataType:"json",
            success(data) {
                page=data.neww;
                maxpage=data.sumpages;
                $("#newpages").text(page);
                $("#allpages").text(maxpage);
                console.log(data);
            }
        })
    }

    function PrePage() {
        if (page > 1) {
            $(".modlle").remove();
            page = page - 1;
            getpages();
            $("#newpages").text(page);
        } else {
            $("#prepage").css("disabled", "true");
        }
    }

    function NextPage() {
        if (page < maxpage) {
            $(".modlle").remove();
            page = page + 1;
            getpages();
            $("#newpages").text(page);
        } else {
            $("#nextpage").css("disabled", "true");
        }
    }

    function getchanges(){
        var ttt=  $(".for");
        var temp=page;
        page= parseInt(ttt.val());
        if(page>0&&page<=maxpage){
            $(".modlle").remove();
            getpages();
            $("#newpages").text(page);
            ttt.val(" ");
        }
        else{
            page=temp;
        }
    }

    function getpages() {
        $.ajax({
            type: "post",
            url: "BackServlet",
            data: {
                action: "getManazinesnull",
                active: "getpages",
                start: page,
            },
            success(data) {
                var sta = $("#table_main");
                var parse = JSON.parse(data);
                var t =page*pagesize;
                for (var i =parse.length - 1; i >= 0; i--) {
                    var modle = "<tr class='modlle'> " + "      <td>" + t + "</td>\n" +
                        "                    <td>" + parse[i].m_Name + "</td>\n" +
                        "                    <td>" + parse[i].m_Price + "</td>\n" +
                        "                    <td>" + parse[i].m_Type + "</td>\n" +
                        "                    <td>" + parse[i].m_Cycle + "</td>\n" +
                        "                    <td>" + parse[i].m_Introduce + "</td>\n" +
                        "                    <td><button class='btn-primary' onclick=showTrender(\'" + parse[i].m_ID+"\',\'"+parse[i].m_Name+ "\')>销售趋势</button></td>\n" +
                        "                </tr>";
                    sta.after(modle);
                    t--;
                }
            }
        })
    }

     getpages();
     getsumpage();
</script>
</body>
</html>
