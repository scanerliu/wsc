<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>会员管理</title>
<link href="/management/css/ui-dialog.css" rel="stylesheet" type="text/css">
<link href="/management/css/style.css" rel="stylesheet" type="text/css">
<link href="/management/css/pagination.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/management/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/management/js/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/common.js"></script>
<script type="text/javascript">
//发送短信
function PostSMS(mobile) {
    var mobiles = "";
    if (arguments.length == 1) { //如果有传入值
        mobiles = mobile;
    } else {
        lenNum = $(".checkall input:checked").length;
        $(".checkall input:checked").each(function (i) {
            if ($(this).parent().siblings('input[name="hidMobile"]').val() != "") {
                mobiles += $(this).parent().siblings('input[name="hidMobile"]').val();
                if (i < lenNum - 1) {
                    mobiles += ',';
                }
            }
        });
    }
    if (mobiles == "") {
        top.dialog({
            title: '提示',
            content: '对不起，手机号码不能为空！',
            okValue: '确定',
            ok: function () { }
        }).showModal();
        return false;
    }
    var smsdialog = parent.dialog({
        title: '发送手机短信',
        content: '<textarea id="txtSmsContent" name="txtSmsContent" rows="2" cols="20" class="input"></textarea>',
        okValue: '确定',
        ok: function () {
            var remark = $("#txtSmsContent", parent.document).val();
            if (remark == "") {
                top.dialog({
                    title: '提示',
                    content: '对不起，请输入手机短信内容！',
                    okValue: '确定',
                    ok: function () { }
                }).showModal(smsdialog);
                return false;
            }
            var postData = { "mobiles": mobiles, "content": remark };
            //发送AJAX请求
            $.ajax({
                type: "post",
                url: "../../tools/admin_ajax.ashx?action=sms_message_post",
                data: postData,
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    top.dialog({
                        title: '提示',
                        content: '尝试发送失败，错误信息：' + errorThrown,
                        okValue: '确定',
                        ok: function () { }
                    }).showModal(smsdialog);
                },
                success: function (data, textStatus) {
                    if (data.status == 1) {
                        smsdialog.close().remove();
                        var d = top.dialog({ content: data.msg }).show();
                        setTimeout(function () {
                            d.close().remove();
                            location.reload();
                        }, 2000);
                    } else {
                        top.dialog({
                            title: '提示',
                            content: '错误提示：' + data.msg,
                            okValue: '确定',
                            ok: function () { }
                        }).showModal(smsdialog);
                    }
                }
            });
            return false;
        },
        cancelValue: '取消',
        cancel: function () { }
    }).showModal();
}
</script>
</head>

<body class="mainbody">
<form method="post" action="/management/user/distribution" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="EVENTTARGET" id="__EVENTTARGET" value="">
<input type="hidden" name="EVENTARGUMENT" id="__EVENTARGUMENT" value="">
<input type="hidden" name="LASTFOCUS" id="__LASTFOCUS" value="">
<input type="hidden" name="VIEWSTATE" id="__VIEWSTATE" value="" >
<input type="hidden" id="userId" name="uid" value="<#if !action?? || action!="Copy">${uid?c}</#if>">
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>
<!--导航栏-->
<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="/management/center" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>会员管理</span>
  <i class="arrow"></i>
  <span>分销查看</span>
</div>
<!--/导航栏-->

<!--工具栏-->
<!--/工具栏-->

<!--列表-->
<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <div class="tab-title"><span>基本资料</span><i></i></div><ul>
        <li><a class="selected" href="javascript:;">分销查看</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="table-container">

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
  <tbody><tr class="odd_bg">
    <th width="8%">选择</th>
    <th align="left" colspan="2">用户名</th>
    <th align="left" width="12%">会员组</th>
    <th align="left" width="12%">归属超市</th>
    <th align="left" width="12%">上次登录时间</th>
    <th width="8%">状态</th>
    <th width="8%">操作</th>
  </tr>

  <#if user_page??>
    <#list user_page.content as item>
      <tr>
        <td align="center">
          <span class="checkall" style="vertical-align:middle;">
            <input id="listChkId" type="checkbox" name="listChkIdx" value="${item_index}" >
          </span>
          <input type="hidden" name="listId" id="listId" value="${item.id?c}">
        </td>
        <td width="64">
          <a href="/management/user/edit?id=${item.id?c}">
            <#if item.headImage?? && ""!=item.headImage>
              <img style="display: block; width: 64px; height: 64px;backgroud: none;" src="${item.headImage!''}"/>
            <#else>
              <b class="user-avatar"></b>
            </#if>
          </a>
        </td>
        <td>
          <div class="user-box">
            <h4><b>${item.mobile!''}</b> (昵称：${item.nickname!''})</h4>
            <i>注册时间：${item.initDate!''}</i>
            <span>
              <#--
              <a class="amount" href="http://demo.dtcms.net/admin/users/amount_log.aspx?keywords=huta123" title="消费记录">余额</a>
              <a class="card" href="http://demo.dtcms.net/admin/users/recharge_list.aspx?keywords=huta123" title="充值记录">充值</a>
              <a class="point" href="http://demo.dtcms.net/admin/users/point_log.aspx?keywords=huta123" title="积分记录">积分</a>
              <a class="msg" href="http://demo.dtcms.net/admin/users/message_list.aspx?keywords=huta123" title="消息记录">短消息</a>
              -->
            </span>
          </div>
        </td>
        <td>${item.userLevelTitle!}</td>
        <td>${item.shopTitle!}</td>
        <td>${item.lastLoginTime!'未登录过'}</td>
        <td align="center"><#if item.status?? && item.status==1>正常<#elseif item.status?? && item.status==2>待审核<#elseif item.status?? && item.status==3>禁用</#if></td>
        <td align="center"><a href="/management/user/edit?id=${item.id?c}">修改</a></td>
      </tr>
    </#list>
  </#if>
  
</tbody></table>

</div>
<!--/列表-->

<!--内容底部-->
<#assign PAGE_DATA=user_page />
<#include "/management/page_footer.ftl" />
<!--/内容底部-->
</form>

</body></html>