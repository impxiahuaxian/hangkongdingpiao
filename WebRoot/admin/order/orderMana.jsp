<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
            function orderDetail(orderId)
            {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:200px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
            }
           
           
           function orderShouli(id)
           {
               if(confirm('您确定受理订单吗？'))
               {
                   var url="<%=path %>/orderShouli.action?id="+id;
                   var ret = window.showModalDialog(url,"","dialogWidth:300px; dialogHeight:130px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
                   window.location.reload()
               }
           }
           
           function orderDelAd(id)
           {
               if(confirm('您确定删除订单吗？'))
               {
                   var url="<%=path %>/orderDelAd.action?id="+id;
                   var ret = window.showModalDialog(url,"","dialogWidth:300px; dialogHeight:130px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
                   window.location.reload()
               }
           }
           
           function userXinxi(userId)
           {
                 var url="<%=path %>/userXinxi.action?userId="+userId;
                 var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="44" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">会员信息</td>
					<td width="10%">下单时间</td>
					<td width="10%">收货人姓名</td>
					
					<td width="10%">收货人电话</td>
					<td width="10%">收货人地址</td>
					<td width="10%">总金额</td>
					<td width="10%">订单明细</td>
					
					<td width="10%">订单状态</td>
					<td width="10%">删除订单</td>
		        </tr>	
				<c:forEach items="${requestScope.orderList}" var="order" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" height="22">
					<td bgcolor="#FFFFFF" align="center">
					   ${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <a href="#" style="color: red" onclick="userXinxi(${order.userId})">会员信息</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.xiadanshi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.shouhourenming}
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					   ${order.shouhourenhua}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.shouhourenzhi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${order.zongjiage}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <a href="#" onclick="orderDetail(${order.id})" class="pn-loperator">订单明细</a>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					     <c:if test="${order.zhuangtai=='未受理'}">
					         <a href="#" style="color: red" onclick="orderShouli(${order.id})" class="pn-loperator">未受理</a>
					     </c:if>
					     <c:if test="${order.zhuangtai=='已受理'}">
					         已受理
					     </c:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <input type="button" value="删除订单" onclick="orderDelAd(${order.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
