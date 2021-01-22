<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %> 
<%
    String path = request.getContextPath();
%>
<!-- 显示航班信息 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<style type="text/css">
           .style12 {color: #FF6633;font-size: 14px;}
		    td {FONT-SIZE:9pt; LINE-HEIGHT:150%; COLOR: #353535} 
		    body {background-image: url(<%=path %>/img/background.gif);FONT-SIZE:9pt;LINE-HEIGHT:150%;margin: 0px;} 
			a:link {color: #333333; text-decoration: none}
			a:visited {color: #333333; text-decoration: none}
			a:active {color: #333333; text-decoration: none}
			a:hover {color: #ff0000; text-decoration: underline}
			A:unknown LINK {TEXT-DECORATION: none}
			.list_link {FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #8d1c1c; TEXT-DECORATION: none}
			.wenbenkuang {BORDER-RIGHT: #999999 1px solid; BORDER-TOP: #999999 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #999999 1px solid; COLOR: #333333; BORDER-BOTTOM: #999999 1px solid; FONT-FAMILY: "宋体"}
			.go-wenbenkuang {BORDER-RIGHT: #666666 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #ffffff 1px solid; PADDING-LEFT: 1px; FONT-SIZE: 9pt; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffffff 1px solid; CURSOR: hand; COLOR: #333333; PADDING-TOP: 1px; BORDER-BOTTOM: #666666 1px solid; FONT-FAMILY: "宋体"; HEIGHT: 19px; BACKGROUND-COLOR: #eeeeee}
			.table-zuoyou {BORDER-RIGHT: #A9A9A9 1px solid; BORDER-LEFT: #A9A9A9 1px solid}
			.table-shangxia {BORDER-TOP: #A9A9A9 1px solid; BORDER-BOTTOM: #A9A9A9 1px solid}
			.table-sxzy {BORDER-TOP: #A9A9A9 1px solid; BORDER-BOTTOM: #A9A9A9 1px solid;#A9A9A9 1px solid; BORDER-LEFT: #A9A9A9 1px solid;BORDER-RIGHT: #A9A9A9 1px solid}
			.table-you {BORDER-RIGHT: #A9A9A9 1px solid}
			.table-zuo {BORDER-LEFT: #A9A9A9 1px solid}
			.table-shang {BORDER-TOP: #A9A9A9 1px solid}
			.table-xia {BORDER-BOTTOM: #A9A9A9 1px solid}
			.table-xu {BORDER-BOTTOM: #A9A9A9 1px dotted}
			.matrix {FONT-SIZE: 12px}
			.matrix A {COLOR: #93393a}
			.matrix_sub {BORDER-RIGHT: #c9c9c9 1px solid; PADDING-RIGHT: 4px; BORDER-TOP: 0px; PADDING-LEFT: 4px; BACKGROUND-IMAGE: url(<%=path %>/img/botton2.gif); PADDING-BOTTOM: 4px; BORDER-LEFT: #c9c9c9 1px solid; COLOR: #000000; PADDING-TOP: 1px; BORDER-BOTTOM: #c9c9c9 1px solid; BACKGROUND-COLOR: #f7f7f7}
			.matrix_header {BORDER-RIGHT: #c9c9c9 1px solid; BORDER-TOP: #c9c9c9 1px solid; PADDING-LEFT: 5px; BACKGROUND-IMAGE: url(<%=path %>/img/botton2.gif); PADDING-BOTTOM: 6px; BORDER-LEFT: #c9c9c9 1px solid; COLOR: #00469e; PADDING-TOP: 6px; BORDER-BOTTOM: #838383 1px solid; BACKGROUND-COLOR: #ffffff}
			.matrix_info {BORDER-RIGHT: #c9c9c9 1px solid; PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #c9c9c9 1px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #eae9e9 1px solid; BACKGROUND-COLOR: #f7f7f7}
			.matrix_info_header {BORDER-RIGHT: #c9c9c9 1px solid; PADDING-RIGHT: 4px; BORDER-TOP: #c9c9c9 1px solid; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #c9c9c9 1px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #eae9e9 1px solid; BACKGROUND-COLOR: #ebeaea}
			.matrix_content {COLOR: #353535; BACKGROUND-COLOR: #ffffff}
			.matrix_left {BORDER-LEFT: #c9c9c9 1px solid}
			.error {BORDER-RIGHT: #ff0000 2px solid; BORDER-TOP: #ff0000 2px solid; BORDER-LEFT: #ff0000 2px solid; WIDTH: 95%; BORDER-BOTTOM: #ff0000 2px solid; BACKGROUND-COLOR: #ffdede}
			.error TD {FONT-SIZE: 12px; COLOR: #ff0000}
			.error .title {BACKGROUND-COLOR: #ff9393}
			.error .title TD {FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #ffffff}
			.select {BORDER-TOP: #c4c4c4 1px solid; BORDER-LEFT: #c4c4c4 1px solid}
			.tableBorder {WIDTH: 98%;BACKGROUND-COLOR: #ffffff;border: 1px solid #0066FF;}
			.edfour {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BACKGROUND-COLOR: #ffffff}
			.color {FONT-SIZE: 12px; COLOR: #d7fd62; TEXT-DECORATION: none}
			.line {FONT-SIZE: 12px; LINE-HEIGHT: 25px; TEXT-DECORATION: none}
			.unnamed1 {FONT-SIZE: 12px; COLOR: #000000; TEXT-DECORATION: none}
			.unnamed2 {FONT-SIZE: 12px; LINE-HEIGHT: 25px; TEXT-DECORATION: none}
			.da {font-size: 14px;color: #FFFFFF;letter-spacing: 1px;}
      </style>
      
      <script type="text/javascript">
           function hangbanDetailQian(id)
           {
               var url="<%=path %>/hangbanDetailQian.action?id="+id;
               window.location.href=url;
           }
      </script>
  </head>
  
  <BODY leftMargin=0 topMargin=0 bgColor=#ffffff>
        <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
  
		<TABLE border=0 cellSpacing=0 cellPadding=0 width=772 bgColor=#ffffff align=center>
		  <TR>
		    <TD class=b vAlign=top width=178>
		       <jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
		    </TD>
		    
		    
		    <td width="3" bgcolor="#A9A9A9"></td>
		    <td width="3" bgcolor="white"></td>
		    <!-- 右部分-->
		    <TD class=b vAlign=top width=591 align=left>
		      <TABLE border=0 cellSpacing=0 cellPadding=0 width=590 align=center bgcolor="#CCCCCC" style="margin-top: 2px;">
		        <TR>
		          <TD height="25">
		               &nbsp;&nbsp;&nbsp;
                  </TD>
		        </TR>
		      </TABLE>
		      <TABLE border=0 cellSpacing=0 cellPadding=2 width=590 align=left height=133>
		        <TR>
		          <TD height=129 vAlign=top align=left>
		          <!--  -->
		              <c:if test="${fn:length(requestScope.hangbanList)==0}"> <!-- fn:length()函数返回字符串长度或集合中元素的数量。 -->
		                                                       没有航班信息
		              </c:if>
		              <c:if test="${fn:length(requestScope.hangbanList)>0}"> <!-- 在hangbanList这个集合的范围之内如果有元素则显示以下内容 -->
		              <table width="98%" border="0" cellpadding="4" cellspacing="4" style="margin-top:5px;margin-left: 5px;">
							<tr align="center" bgcolor="#FAFAF1" height="22">
								<td width="5%">序号</td>
					
								<td width="9%">航班日期</td>
								<td width="9%">航班编号</td>
								<td width="9%">始发地点</td>
								<td width="9%">到达地点</td>
								
								<td width="9%">起飞时间</td>
								<td width="9%">详细信息</td>
					        </tr>	
							<c:forEach items="${requestScope.hangbanList}" var="hangban" varStatus="ss">
							<!-- 遍历hangbanList这个集合，var：名称，varStatus有一个getIndex（）方法获取正在被遍历的元素的下标 -->
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
								<td bgcolor="#FFFFFF" align="center">
									 ${ss.index+1} <!-- 获取本次航班的id值 -->
								</td>
								
								<td bgcolor="#FFFFFF" align="center">
									 ${hangban.riqi}
								</td>
								<td bgcolor="#FFFFFF" align="center">
									 ${hangban.bianhao}
								</td>
								<td bgcolor="#FFFFFF" align="center">
									 ${hangban.shifadi}
								</td>
								<td bgcolor="#FFFFFF" align="center">
									 ${hangban.daodadi}
								</td>
								
								<td bgcolor="#FFFFFF" align="center">
									 ${hangban.qifeishi}
								</td>
								<td bgcolor="#FFFFFF" align="center">
									<input type="button" value="详细信息" onclick="hangbanDetailQian(${hangban.id})"/>
								</td>
							</tr>
							</c:forEach>
					  </table>
					  </c:if>
		          </TD>
		        </TR>
		      </TABLE>
		   </TD>
		  </TR>
		</TABLE>


		<TABLE border=0 cellSpacing=0 cellPadding=0 width=772 bgColor=#a9a9a9 align=center>
		  <TR><TD rowSpan=5 width=1></TD></TR>
		</TABLE>
    
    
        <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
  </BODY>
</html>
