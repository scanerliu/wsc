<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>编辑类别</title>
<link href="/management/css/ui-dialog.css" rel="stylesheet" type="text/css">
<link href="/management/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" charset="utf-8" src="/management/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/webuploader.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/kindeditor-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/uploader.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="/management/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
        //初始化上传控件
        $(".upload-img").InitUploader({ sendurl: "/management/tools/upload", swf: "../../scripts/webuploader/uploader.swf" });
        //初始化编辑器
        var editorMini = KindEditor.create('#txtContent', {
            width: '100%',
            height: '250px',
            filterMode: false, //默认不过滤HTML
            resizeType: 1,
            uploadJson: '/management/tools/upload?action=EditorFile',
            items: [
				'source', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'image', 'link', 'fullscreen']
        });
    });
</script>
<link href="/management/js/themes/default/default.css" rel="stylesheet"></head>

<body class="mainbody">
<form method="post" action="/management/article/category/save" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="id" value="<#if category??>${category.id?c}</#if>">
</div>
<!--导航栏-->
<div class="location">
  <a href="/management/article/category/list" class="back"><i></i><span>返回列表页</span></a>
  <a href="/management/center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <a href="/management/article/category/list"><span>内容类别</span></a>
  <i class="arrow"></i>
  <span>编辑分类</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <div class="tab-title"><span>基本信息</span><i></i></div><ul>
        <li><a class="selected" href="javascript:;">基本信息</a></li>
        <li><a href="javascript:;">扩展选项</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
  <dl>
    <dt>所属父类别</dt>
    <dd>
      <div class="rule-single-select">
        <select name="parentId" style="display: none;">
        	<option value="">无父级分类</option>
          <#if category_list??>
            <#list category_list as item>
              <option value="${item.id?c}" <#if parentCat?? && parentCat.id==item.id || category?? && category.parentId?? && category.parentId==item.id>selected="selected"</#if>><#if item.layerId!=1><#list 2..item.layerId as idx>　</#list>├ </#if>${item.title!''}</option>
            </#list>
        	</#if>
        </select>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>排序数字</dt>
    <dd>
      <input name="sortId" type="text" value="<#if category??>${category.sortId!''}<#else>99</#if>" class="input small" datatype="n" sucmsg=" ">
      <span class="Validform_checktip">*数字，越小越向前</span>
    </dd>
  </dl>
  <dl>
    <dt>类别名称</dt>
    <dd><input name="title" type="text" value="<#if category??>${category.title!''}</#if>" class="input normal" datatype="*1-100" sucmsg=" "> <span class="Validform_checktip">*类别中文名称，100字符内</span></dd>
  </dl>
  <dl>
    <dt>SEO标题</dt>
    <dd>
      <input name="seoTitle" type="text" maxlength="255" value="<#if category??>${category.seoTitle!''}</#if>" class="input normal" datatype="s0-100" sucmsg=" ">
      <span class="Validform_checktip">255个字符以内</span>
    </dd>
  </dl>
  <dl>
    <dt>SEO关健字</dt>
    <dd>
      <textarea name="seoKeywords" rows="2" cols="20" class="input"><#if category??>${category.seoKeywords!''}</#if></textarea>
      <span class="Validform_checktip">以“,”逗号区分开，255个字符以内</span>
    </dd>
  </dl>
  <dl>
    <dt>SEO描述</dt>
    <dd>
      <textarea name="seoDescription" rows="2" cols="20" class="input"><#if category??>${category.seoDescription!''}</#if></textarea>
      <span class="Validform_checktip">255个字符以内</span>
    </dd>
  </dl>
</div>

<div class="tab-content" style="display:none">
  <dl>
    <dt>URL链接</dt>
    <dd>
      <input name="linkUri" type="text" maxlength="255" value="<#if category??>${category.linkUri!''}</#if>" class="input normal">
      <span class="Validform_checktip">填写后直接跳转到该网址</span>
    </dd>
  </dl>
  <dl>
    <dt>显示图片</dt>
    <dd>
      <input name="imgUri" type="text" id="txtImgUrl" value="<#if category??>${category.imgUri!''}</#if>" class="input normal upload-path">
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>类别介绍</dt>
    <dd>
      <textarea name="content" id="txtContent" class="editor"><#if category??>${category.content!''}</#if></textarea>
    </dd>
  </dl>
</div>
<!--/内容-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-wrap" style="position: static;">
    <input type="submit" name="btnSubmit" value="提交保存" id="btnSubmit" class="btn">
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
  </div>
</div>
<!--/工具栏-->
</form>
</body>
</html>