var number=0;
var count=0;
var TipList=new Array();
var map1=new Map();
function clicktochange(name,url){//name触发函数的名字  url 是调用窗口的地址

    var flag=false;
    for(let value of map1.values()){
        if(value==url){
            flag=true;
        }
    }
    if(flag){
        countrView(url);//如果点击的窗口已存在就直接打开否则就重新创建一个
    }
    else{
        //按钮模板
        var Tipid="tip"+number;//添加带有编号的class
        var htm="<div class='col-md-1 bq  "+ Tipid +" ' "+"><a class='col-md-8 bqTitle '" +"onclick=\"countrView('"+url+"')\""+"'>";
        var htm1="</a><a class='col-md-3 bqSgin  ";
        var htm2="'onclick=\"closeIframe('";
        var clickcs=Tipid+"\')\">";//定义事件
        var htm3="<span class='col-md-12 bqX'>×</span></a></div>";

        //视图框架模板
        var view="<iframe class=\"col-md-12  "+Tipid+" ifram\" src=\""+url+"\"></iframe>";
        if(count<12){
            map1.set(Tipid,url);
            $("#bqList").append(htm+name+htm1+Tipid+htm2+clickcs+htm3);
            number++;
            count++;
            //更新视图
            $("iframe[src!=\""+url+"\"]").css("display","none");
            $("#iframeDiv").append(view);
        }
        else{
            alert("最多有十二个窗口！");
        }
    }
}
function closeIframe(Tipid){//同时将视图中的iframe失效
    $("."+Tipid).remove();
    $("iframe ."+Tipid).remove();
    count--;
    map1.delete(Tipid);
    if(map1.size==0){
        $("iframe[src='back_default.html']").css("display","");
    }
}
//关闭除了本url之外的iframe
function countrView(url){
    //根据Tipid在TipList中的下标找出相应的在iframeList中的url
    //然后根据 jquery代码：$("input[name='newsletter']")
    //属性指定 相应的 iframe 将其关闭
    $("iframe[src!=\""+url+"\"]").css("display","none");
    $("iframe[src=\""+url+"\"]").css("display","");
}
