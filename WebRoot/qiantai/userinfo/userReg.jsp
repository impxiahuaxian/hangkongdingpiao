<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<script language="javascript">
            
		    function check1()
		    {
		        if(document.form1.userName.value=="")
		        {
		            alert("请输入账号");
		            return false;
		        }
		        if(document.form1.userPw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        if(document.form1.userPw.value.length<6)
				{
				    alert("密码不能小于6位");
				    return false;
				}
		        
		        if(document.form1.userRealname.value=="")
		        {
		            alert("请输入姓名");
		            return false;
		        }
		        if(document.form1.userAddress.value=="")
		        {
		            alert("请输入住址");
		            return false;
		        }
		        if(document.form1.userTel.value=="")
		        {
		            alert("请输入电话");
		            return false;
		        }
				
		        document.form1.submit();
		    }
        </script>
	</head>
	<body>
			<form action="<%=path %>/userReg.action" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							账号：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userName" id="userName"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密码：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="userPw" style="width: 148px;" value=""/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							姓名：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userRealname"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							性别：
						</td>
						<td bgcolor="#FFFFFF" style="font-size: 11px;">
							&nbsp;
							<input type="radio" name="userSex" value="男" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="userSex" value="女"/>女
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							年龄：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userAge" value="" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							住址：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userAddress"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							电话：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userTel"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="button" value="确定" onclick="check1();"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
