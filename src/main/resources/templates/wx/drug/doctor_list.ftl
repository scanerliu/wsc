<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>药师列表</title>
		<link rel="stylesheet" href="/wx/css/drugtouch/style.css" />
		<link rel="stylesheet" href="/wx/css/drugtouch/doctorlist.css" />
		<script type="text/javascript" src="/wx/js/jquery-2.1.0.min.js"></script>
	</head>
	<body>
		<header>
			<a href="javascript:history.go(-1);" class="back"></a>
			<h3>药师审方</h3>
			<#--<a href="" class="record">审方记录</a>-->
		</header>
		<div class="doctorlist">
			<ul>
				<#if doctor_list??>
				<#list doctor_list.content as doc>
				<li>
					<div class="doctor_info">
						<a href="/wx/drug/${doc.id?c}">
							<div class="doctor_img">
								<img src="${doc.headImgUrl!''}"/>
								<span class="doctor_state <#if doc.isOnline>state2<#else>state1</#if>"><i></i></span>
							</div>						
							<div class="doctor_infos">
								<div class="name">
									${doc.name!''}<span>执业药师</span>
								</div>
								<div class="synopsis">
									简介：${doc.school!''}
								</div>
							</div>
						</a>
					</div>
					<p>已审核${doc.servedNo!'0'}次<a href="/wx/drug/upload/${doc.id?c}">审方</a></p>
				</li>
				</#list>
				</#if>
			</ul>
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
