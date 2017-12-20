<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>药师详情</title>
		<link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
		<link rel="stylesheet" href="/wx/css/drugtouch/doctordetail.css" />
		<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
	</head>
	<body>
		<header>
			<a href="javascript:history.go(-1);" class="back"></a>
			<h3>药师-${doctor.name!''}</h3>
			<#--<a href="" class="record">审方记录</a>-->
		</header>
		<div class="doctordetail">
			<div class="doctor_info">
				<div class="doctor_img">
					<img src="images/doctor_logo.png"/>
				</div>						
				<div class="doctor_infos">
					<div class="name">
						${doctor.name!''}
					</div>	
					<div class="Professor">
						<span>执业药师</span>
					</div>
				</div>
			</div>
			<div class="synopsis">
				${doctor.school!''}
			</div>
			<div class="certificate">
				<div class="title">证件:</div>
				${doctor.cer!''}
			</div>
		</div>
	</body>
	<script>
		var num = $(window).width() / 6.4 / 16 * 100;
		if(num < 640) {
			$("html").css("font-size", num + "%");
		}
		$("body").show();
		this.bodyHeight = $("body").height();
		this.documentHeight = $(document).height();
	</script>
</html>
