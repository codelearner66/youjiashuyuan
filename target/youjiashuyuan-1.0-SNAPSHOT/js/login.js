function checkForm1(){
    const passwd1 = $("#pwd2").val();
    const randNumber = $("#yanzhengma").val();
        if(passwd1.length<6||passwd1.length>20){
            alert("密码格式不正确！请检查!");
            return false;
        }
        else {
            if(!isNaN(randNumber)){
                //ajax操作
                return  true;
            }
            else{
                alert("验证码出错！");
                return false;
            }
        }

}
$("#change_main").click(function(){
    var text=$(".h_text").text();
    if(text=="会员登陆"){
        $(".h_text").text("用户注册");
        $("#form_1").css("display","none");
        $("#form_2").css("display","block");
    }
    else{
        $(".h_text").text("会员登陆");
        $("#form_1").css("display","block");
        $("#form_2").css("display","none");
    }
});
$("#button").click(function () {
    var time=60;
    var send=true;
    var random=0;
    sendYanzhengma(send,time,random);
});
function sendYanzhengma(send,time,random){
    if(send) {
        $.ajax({
            type: "post",
            url: "LoginServlet",
            data: {"action": "yanzhengma"},
            success: function (data) {
                random=data;
                $("#button").attr("value","验证码："+data+"失效时间："+time).attr("disabled",true);
                getRandomCode(send,time,random);
            }
        });
    }
}
//倒计时
function getRandomCode(send,time,random) {
    if (time === 0) {
        send = true;
        $("#button").attr("value","获取验证码").removeAttr("disabled");
        return;
    } else {
        time--;
        $("#button").attr("value","验证码："+random+"失效时间："+time);
    }
    setTimeout(function () {
        getRandomCode(send,time,random);
    }, 1000);
}