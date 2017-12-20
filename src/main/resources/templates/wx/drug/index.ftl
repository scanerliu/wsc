<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>处方单查询</title>
		<link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
		<link rel="stylesheet" href="/wx/css/drugtouch/index.css" />
		<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
	</head>
	<body>
		<header>
			<a href="javascript:history.go(-1);" class="back"></a>
			<h3>处方单查询</h3>
		</header>
		<div class="apothecary">
			<div class="title">
				<img src="/wx/images/drugtouch/icon1.png"/>
				<span>药师审方</span>
				<a href="">审方记录</a>
			</div>
			<div class="apothecarylist">
				<ul>
					<li><a href="/wx/drug/list?keywords=中药"><img src="/wx/images/drugtouch/apothecary1.png"/></a></li>
					<li><a href="/wx/drug/list?keywords=西药"><img src="/wx/images/drugtouch//apothecary2.png"/></a></li>
				</ul>
			</div>
		</div>
		<div class="apothecary doctor">
			<div class="title">
				<img src="/wx/images/drugtouch//icon2.png"/>
				<span>医生处方</span>
			</div>
			<div class="apothecarylist">
				<ul>
					<li><a href=""><img src="/wx/images/drugtouch/doctor1.png"/></a></li>
					<li><a href=""><img src="/wx/images/drugtouch/doctor2.png"/></a></li>
				</ul>
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
