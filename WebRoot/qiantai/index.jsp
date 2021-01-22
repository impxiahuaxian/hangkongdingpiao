<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!-- 获取项目的名字 -->
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- 清除浏览器中的缓存，它和其它几句合起来用，就可以使你再次进入曾经访问过的页面时，
  ie浏览器必须从服务端下载最新的内容，达到刷新的效果。 -->
<meta http-equiv="pragma" content="no-cache" />  <!-- cache模式  -->
<meta http-equiv="cache-control" content="no-cache" />   <!-- 清除缓存（再访问这个网站要重新下载！）  -->
<meta http-equiv="expires" content="0" />  <!-- 设定网页的到期时间  -->
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />  <!-- 关键字,给搜索引擎用的  -->
<meta http-equiv="description" content="This is my page" />  <!-- 页面描述  -->

<style type="text/css">
.style12 {
	color: #FF6633;
	font-size: 14px;
}

td {
	FONT-SIZE: 9pt;
	LINE-HEIGHT: 150%;
	COLOR: #353535
}

body {
	background-image: url(<%=path%>/img/background.gif);
	FONT-SIZE: 9pt;
	LINE-HEIGHT: 150%;
	margin: 0px;
}

a:link {
	color: #333333;
	text-decoration: none
}

a:visited {
	color: #333333;
	text-decoration: none
}

a:active {
	color: #333333;
	text-decoration: none
}

a:hover {
	color: #ff0000;
	text-decoration: underline
}

A:unknown LINK {
	TEXT-DECORATION: none
}

.list_link {
	FONT-WEIGHT: bold;
	FONT-SIZE: 12px;
	COLOR: #8d1c1c;
	TEXT-DECORATION: none
}

.wenbenkuang {
	BORDER-RIGHT: #999999 1px solid;
	BORDER-TOP: #999999 1px solid;
	FONT-SIZE: 9pt;
	BORDER-LEFT: #999999 1px solid;
	COLOR: #333333;
	BORDER-BOTTOM: #999999 1px solid;
	FONT-FAMILY: "宋体"
}

.go-wenbenkuang {
	BORDER-RIGHT: #666666 1px solid;
	PADDING-RIGHT: 1px;
	BORDER-TOP: #ffffff 1px solid;
	PADDING-LEFT: 1px;
	FONT-SIZE: 9pt;
	PADDING-BOTTOM: 1px;
	BORDER-LEFT: #ffffff 1px solid;
	CURSOR: hand;
	COLOR: #333333;
	PADDING-TOP: 1px;
	BORDER-BOTTOM: #666666 1px solid;
	FONT-FAMILY: "宋体";
	HEIGHT: 19px;
	BACKGROUND-COLOR: #eeeeee
}

.table-zuoyou {
	BORDER-RIGHT: #A9A9A9 1px solid;
	BORDER-LEFT: #A9A9A9 1px solid
}

.table-shangxia {
	BORDER-TOP: #A9A9A9 1px solid;
	BORDER-BOTTOM: #A9A9A9 1px solid
}

.table-sxzy {
	BORDER-TOP: #A9A9A9 1px solid;
	BORDER-BOTTOM: #A9A9A9 1px solid; # A9A9A9 1px solid;
	BORDER-LEFT: #A9A9A9 1px solid;
	BORDER-RIGHT: #A9A9A9 1px solid
}

.table-you {
	BORDER-RIGHT: #A9A9A9 1px solid
}

.table-zuo {
	BORDER-LEFT: #A9A9A9 1px solid
}

.table-shang {
	BORDER-TOP: #A9A9A9 1px solid
}

.table-xia {
	BORDER-BOTTOM: #A9A9A9 1px solid
}

.table-xu {
	BORDER-BOTTOM: #A9A9A9 1px dotted
}

.matrix {
	FONT-SIZE: 12px
}

.matrix A {
	COLOR: #93393a
}

.matrix_sub {
	BORDER-RIGHT: #c9c9c9 1px solid;
	PADDING-RIGHT: 4px;
	BORDER-TOP: 0px;
	PADDING-LEFT: 4px;
	BACKGROUND-IMAGE: url(<%=path%>/img/botton2.gif);
	PADDING-BOTTOM: 4px;
	BORDER-LEFT: #c9c9c9 1px solid;
	COLOR: #000000;
	PADDING-TOP: 1px;
	BORDER-BOTTOM: #c9c9c9 1px solid;
	BACKGROUND-COLOR: #f7f7f7
}

.matrix_header {
	BORDER-RIGHT: #c9c9c9 1px solid;
	BORDER-TOP: #c9c9c9 1px solid;
	PADDING-LEFT: 5px;
	BACKGROUND-IMAGE: url(<%=path%>/img/botton2.gif);
	PADDING-BOTTOM: 6px;
	BORDER-LEFT: #c9c9c9 1px solid;
	COLOR: #00469e;
	PADDING-TOP: 6px;
	BORDER-BOTTOM: #838383 1px solid;
	BACKGROUND-COLOR: #ffffff
}

.matrix_info {
	BORDER-RIGHT: #c9c9c9 1px solid;
	PADDING-RIGHT: 4px;
	PADDING-LEFT: 4px;
	PADDING-BOTTOM: 4px;
	BORDER-LEFT: #c9c9c9 1px solid;
	PADDING-TOP: 4px;
	BORDER-BOTTOM: #eae9e9 1px solid;
	BACKGROUND-COLOR: #f7f7f7
}

.matrix_info_header {
	BORDER-RIGHT: #c9c9c9 1px solid;
	PADDING-RIGHT: 4px;
	BORDER-TOP: #c9c9c9 1px solid;
	PADDING-LEFT: 4px;
	PADDING-BOTTOM: 4px;
	BORDER-LEFT: #c9c9c9 1px solid;
	PADDING-TOP: 4px;
	BORDER-BOTTOM: #eae9e9 1px solid;
	BACKGROUND-COLOR: #ebeaea
}

.matrix_content {
	COLOR: #353535;
	BACKGROUND-COLOR: #ffffff
}

.matrix_left {
	BORDER-LEFT: #c9c9c9 1px solid
}

.error {
	BORDER-RIGHT: #ff0000 2px solid;
	BORDER-TOP: #ff0000 2px solid;
	BORDER-LEFT: #ff0000 2px solid;
	WIDTH: 95%;
	BORDER-BOTTOM: #ff0000 2px solid;
	BACKGROUND-COLOR: #ffdede
}

.error TD {
	FONT-SIZE: 12px;
	COLOR: #ff0000
}

.error .title {
	BACKGROUND-COLOR: #ff9393
}

.error .title TD {
	FONT-WEIGHT: bold;
	FONT-SIZE: 12px;
	COLOR: #ffffff
}

.select {
	BORDER-TOP: #c4c4c4 1px solid;
	BORDER-LEFT: #c4c4c4 1px solid
}

.tableBorder {
	WIDTH: 98%;
	BACKGROUND-COLOR: #ffffff;
	border: 1px solid #0066FF;
}

.edfour {
	BORDER-RIGHT: #000000 1px solid;
	BORDER-TOP: #000000 1px solid;
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	BACKGROUND-COLOR: #ffffff
}

.color {
	FONT-SIZE: 12px;
	COLOR: #d7fd62;
	TEXT-DECORATION: none
}

.line {
	FONT-SIZE: 12px;
	LINE-HEIGHT: 25px;
	TEXT-DECORATION: none
}

.unnamed1 {
	FONT-SIZE: 12px;
	COLOR: #000000;
	TEXT-DECORATION: none
}

.unnamed2 {
	FONT-SIZE: 12px;
	LINE-HEIGHT: 25px;
	TEXT-DECORATION: none
}

.da {
	font-size: 14px;
	color: #FFFFFF;
	letter-spacing: 1px;
}
</style>

<!-- 显示航班信息 -->  //跳转到指定的Action
<script type="text/javascript">
           var url="<%=path %>/hangbanAll.action"//通常zhidao先写一个变量来存地址
	       window.location.href = url;//这个是传版到action的方式 ，当前页面打开url页面
</script>
</head>

<BODY leftMargin=0 topMargin=0 bgColor=#ffffff>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width=772 bgColor=#ffffff
		align=center
		style="background-image: url('<%=path%>/img/logo.jpg'); background-repeat : repeat-xy"><!-- 设置系统背景图片 -->
		<TR>
			<TD height=80 width=772 align=center>&nbsp;</TD>
		</TR>
	</TABLE>

	<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include> <!-- 导航 -->

	<TABLE border=0 cellSpacing=0 cellPadding=0 width=772 bgColor=#ffffff
		align=center>
		<TR>
			<TD class=b vAlign=top width=178><jsp:include flush="true"
					page="/qiantai/inc/incLeft.jsp"></jsp:include></TD> <!-- 前台的左侧 -->


			<td width="3" bgcolor="#A9A9A9"></td>
			<td width="3" bgcolor="white"></td>
			<!-- 右部分-->
			<TD class=b vAlign=top width=591 align=left>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width=590 align=center
					bgcolor="#CCCCCC" style="margin-top: 2px;">
					<TR>
						<TD height="25">&nbsp;&nbsp;&nbsp;</TD>
					</TR>
				</TABLE>
				<TABLE border=0 cellSpacing=0 cellPadding=2 width=590 align=left
					height=133>
					<TR>
						<TD height=129 vAlign=top align=left></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>


	<TABLE border=0 cellSpacing=0 cellPadding=0 width=772 bgColor=#a9a9a9
		align=center>
		<TR>
			<TD rowSpan=5 width=1></TD>
		</TR>
	</TABLE>


	<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> <!-- 前台的下方 -->
</BODY>
</html>
