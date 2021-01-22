<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <script type="text/javascript">
         function userReg()
         {
                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
                var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
         }
         
         function mycart()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/qiantai/cart/mycart.jsp";
                window.open(url,"_self");
            </c:if>
         } 
         
         function orderMine()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/orderMine.action";
                window.open(url,"_self");
            </c:if>
         } 
      </script>
  </head>
  
  <body>
       <TABLE border=0 cellSpacing=0 cellPadding=0 width=772 bgColor=#ffffff align=center style="background-image: url('<%=path %>/img/logo.jpg'); background-repeat : repeat-xy">
		  <TR>
		    <TD height=121 width=772 align=center>
			     &nbsp;
		    </TD>
		  </TR>
		</TABLE>
       <TABLE  border=0 cellSpacing=0 cellPadding=0 width=772 align=center style="background-image: url('<%=path %>/img/banner.jpg'); background-repeat : repeat-xy">
		  <TR>
		    <TD style="height: 30px;font-weight: 900;">
		         &nbsp;&nbsp;&nbsp;&nbsp;
		         <a href="<%=path %>/hangbanAll.action" style="font-family: 微软雅黑;font-size: 15px;">航班列表</A>
		         
		         &nbsp;&nbsp;&nbsp;&nbsp;
		         <a href="<%=path %>/qiantai/hangban/hangbanSea.jsp" style="font-family: 微软雅黑;font-size: 15px;">信息查询</A>
		         
		         &nbsp;&nbsp;&nbsp;&nbsp;
		         <a href="#" onclick="userReg()" style="font-family: 微软雅黑;font-size: 15px;" style="font-family: 微软雅黑;font-size: 15px;">会员注册</A>
		         
		         &nbsp;&nbsp;&nbsp;&nbsp;
		         <a href="#" onclick="mycart()" style="font-family: 微软雅黑;font-size: 15px;" style="font-family: 微软雅黑;font-size: 15px;">我的购物车</A> 
		         
		         &nbsp;&nbsp;&nbsp;&nbsp;
		         <a href="#" onclick="orderMine()" style="font-family: 微软雅黑;font-size: 15px;">我的订单</A> 
		         
		         &nbsp;&nbsp;&nbsp;&nbsp;
		         <A href="<%= path%>/liuyanAll.action" style="font-family: 微软雅黑;font-size: 15px;">系统留言板</A>
		    </TD>
		  </TR>
	   </TABLE>
  </body>
</html>
