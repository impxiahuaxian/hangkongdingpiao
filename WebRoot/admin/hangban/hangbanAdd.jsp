<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/> 

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
        
        <link rel="stylesheet" href="<%=path %>/jquery/ui.datepicker.css" type="text/css" media="screen"  charset="utf-8" />
	
		<script src="<%=path %>/jquery/jquery-1.2.6.js" type="text/javascript" charset="utf-8"></script>	
		<script src="<%=path %>/jquery/ui.datepicker.js" type="text/javascript" charset="utf-8"></script>	
		<script src="<%=path %>/jquery/ui.datepicker-zh-CN.js" type="text/javascript" charset="utf-8"></script>
        
        <script language="javascript">
            function check()
		    {
		        if(document.formAdd.riqi.value=="")
		        {
		            alert("请输入航班日期");
		            return false;
		        }
		        
		        var jinri="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>";
		        var riqi=document.formAdd.riqi.value;
		        
		        if(Date.parse(jinri.replace("-","/")) >= Date.parse(riqi.replace("-","/")))
			    {
				    alert("请录入今天以后的日期");
				    return false;
			    }
			    
		        
		        if(document.formAdd.bianhao.value=="")
		        {
		            alert("请输入航班编号");
		            return false;
		        }
		        document.formAdd.submit();
		    } 
		    
		    
		    function DateDiff(sDate1, sDate2)
			{  
				    var aDate, oDate1, oDate2, iDays 
				    aDate = sDate1.split("-"); 
				    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为mm-dd-yyyy格式 
				    aDate = sDate2.split("-"); 
				    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); 
				    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24);  //把相差的毫秒数转换为天数 
				    //alert(iDays);
				    return iDays ; 
			} 
		    
		    jQuery(function($){
			$('#datepicker').datepicker({
					yearRange: '1900:2099', //取值范围.
					showOn: 'both', //输入框和图片按钮都可以使用日历控件。
					buttonImage: '<%=path %>/jquery/calendar.gif', //日历控件的按钮
					buttonImageOnly: true,
					showButtonPanel: true
				});	
				
			});
			
			function findObj(theObj, theDoc)
			{
				  var p, i, foundObj;
				  
				  if(!theDoc) theDoc = document;
				  if( (p = theObj.indexOf("?")) > 0 && parent.frames.length)
				  {
				    theDoc = parent.frames[theObj.substring(p+1)].document;
				    theObj = theObj.substring(0,p);
				  }
				  if(!(foundObj = theDoc[theObj]) && theDoc.all) foundObj = theDoc.all[theObj];
				  for (i=0; !foundObj && i < theDoc.forms.length; i++) 
				  foundObj = theDoc.forms[i][theObj];
				  for(i=0; !foundObj && theDoc.layers && i < theDoc.layers.length; i++) 
				  foundObj = findObj(theObj,theDoc.layers[i].document);
				  if(!foundObj && document.getElementById) foundObj = document.getElementById(theObj);
				  
				  return foundObj;
			}

			function openWin(url,width,height)
			{
			  var newwin=window.open(url,"_blank","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=50,left=120,width="+width+",height="+height);
			}

			var GetDate=""; 
			function SelectDate(ObjName,FormatDate)
			{
				var PostAtt = new Array;
				PostAtt[0]= FormatDate;
				PostAtt[1]= findObj(ObjName);
			
				GetDate = showModalDialog("util/calendar/calendar.htm", PostAtt ,"dialogWidth:286px;dialogHeight:195px;status:no;help:no;");
			}

			function SetDate()
			{ 
				findObj(ObjName).value = GetDate; 
			}

			function SelectDateTime(objName)
		    {
				var dt = showModalDialog("<%=path %>/util/calendar/time.htm", "" ,"dialogWidth:266px;dialogHeight:150px;status:no;help:no;");
				if (dt!=null)
				document.formAdd.qifeishi.value = dt;
			}
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/hangbanAdd.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>&nbsp;</span></td>
					    </tr>
					    <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         航班日期：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="riqi" id="datepicker" style="width: 300px;" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime()+1*24*60*60*1000)) %>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         航班编号：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="bianhao" style="width: 300px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         始发地点：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="shifadi" style="width: 300px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         到达地点：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="daodadi" style="width: 300px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         起飞时间：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input value="12:00:00" name="qifeishi" style="width: 300px;"/>
                                <img style="CURSOR: hand" onClick="SelectDateTime('time')" src="<%=path %>/images/form/clock.gif" align="absMiddle" width="20" height="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                剩余票数：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="200" name="shengpiao" style="width: 300px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                成人票价：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="100" name="chengrenpiaojia" style="width: 300px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                儿童票价：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="50" name="ertongpiaojia" style="width: 300px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">&nbsp;
						        
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
