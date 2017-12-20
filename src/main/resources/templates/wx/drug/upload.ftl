<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>上传处方单</title>
    <link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
	<link rel="stylesheet" href="/wx/css/drugtouch/wait_examine.css" />
	<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
</head>
<body>
<header>
    <a href="javascript:history.go(-1);" class="back"></a>
    <h3>处方单 - 上传</h3>
</header>
<div class="query">

    <div class="query_mask" style="display: none">
        <span>处理中...</span>
    </div>

    <div class="query_oper">
        <div class="camera">
            <img id="pai" src="/wx/images/drugtouch/camera.png" alt="">
            <form method="post" id="imgId" action="/wx/drug/upload" enctype="multipart/form-data">
            <input id="camera" name="imgFile" type="file" accept="image/*"<#-- capture="camera" -->style="display: none">
            <input type="hidden" name="phaId" value="${doctor.id?c}">
            <input type="hidden" name="phaName" value="${doctor.name!''}">
            </form>
        </div>
        <div class="query_info">
            <div class="query_ts">
                <img src="/wx/images/drugtouch/ts.png" alt="">
                <span class="wait_examine_name">温馨提示</span>
            </div>
            <p class="query_txt">1、请把处方单或检查单放到抓拍仪中间</p>
            <p class="query_txt">2、点击【拍照】按钮抓拍图像</p>
            <p class="query_txt">3、点击【上传】按钮，药师就可以看到</p>
            <p class="query_txt">4、如有疑问请咨询营业员</p>
        </div>

        <div class="query_user">
            <p>本次药方审核由<span class="wait_examine_name">${doctor.name!''}</span>执业药师为您提供服务！</p>
        </div>
    </div>

    <div class="camera_img" style="display: none">
        <img id="show_img" src="" alt="">
        <button class="camera_btn">重拍</button>
    </div>
</div>
<footer>
    <span class="upload" id="upload">上传</span>
</footer>
</body>
<script>
    (function (doc, win) {
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if (clientWidth >= 640) {
                    docEl.style.fontSize = '100px';
                } else {
                    docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
                }
            };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

    $('#pai').on('click', function () {
        $('#camera').click()
    });

    $("#camera").change(function (e) {
        $('.query_mask').show();
        var file = e.target.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (theFile) {
            $('#show_img').attr('src', theFile.target.result);
            $('.query_oper').hide();
            $('.camera_img').show();
            $('.query_mask').hide();
        };
    });

    $('.camera_btn').on('click', function () {
        $('.query_oper').show();
        $('.camera_img').hide();
        $('#camera').val('');
    });

    $('#upload').on('click', function () {
        var img = $('#show_img').attr('src');
        if (img) {
            //console.log(img);
            var formData =new FormData(document.forms[0]);
            var req = new XMLHttpRequest();
			req.open("POST", "/wx/drug/upload");//使用POST发送请求
			req.onload = function(event){
				if(this.status === 200){
					console.log(this.response);//请求成功后打印返回的结果
					var  res= this.response;
					var jsonS = $.parseJSON(res);
					if(jsonS.error == 0)
					{
						alert('上传成功');
						location.href="/wx/drug/precheck";
					}
					else
					   alert(jsonS.message);
				}
			}
			req.send(formData);
			req = null;
        }else{
            alert('未找到图片')
        }
    })
</script>
</html>
