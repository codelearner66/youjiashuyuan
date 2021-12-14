$(".upload").click(function (){
    //var formData = new FormData($("#upload-form")[0]);
   // formData.append("action","uploadimg");//添加信息头 让后台servlet识别为文件上传
    //console.log(formData);
    $.ajax({
        type:"POST",
        url:"BackServlet",
        data: {
            formData:new FormData($("#upload-form")[0]),
            action:"uploadimg"
        },
        cache:false,
        processData:false,
        contentType:false,
        success:function (data,status){
            var s = String(data);
            if(s=="1"){
                alert("图片格式错误！请检查...");
            }
            if(s=="2"){
                alert("图片大小超出限制！请检查...");
            }
            console.log("data:"+data);
            // var img= $("#header-img");
            // img.attr("src",data);
            // img.css({width:"150px",height:"130px"});
        }
    });

});//文件上传