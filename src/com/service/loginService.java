package com.service;//c

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TAdminDAO;
import com.dao.TUserDAO;
import com.model.TAdmin;
import com.model.TUser;
import com.util.Cart;

public class loginService
{
	private TAdminDAO adminDAO;
	private TUserDAO userDAO;
	
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}
	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	
	
	public String login(String userName,String userPw,int userType,String rand)
	{
		String result="no";
		
		if(userType==0)//系统管理员登陆
		{
			WebContext ctx = WebContextFactory.get(); 
			HttpSession session=ctx.getSession(); 
			
			String xitongyanzhengma=(String)session.getAttribute("rand");
			if(xitongyanzhengma.equals(rand.trim())==false)
			{
				result="yanzhenmacuowu";
			}
			
			else
			{
				String sql="from TAdmin where userName=? and userPw=?";
				Object[] con={userName,userPw};
				List adminList=adminDAO.getHibernateTemplate().find(sql,con);
				if(adminList.size()==0)
				{
					 result="no";
				}
				else
				{
					 TAdmin admin=(TAdmin)adminList.get(0);
					 session.setAttribute("userType", 0);
		             session.setAttribute("admin", admin);
		             result="yes";
				}
			}
			
		}
		if(userType==1)
		{
			WebContext ctx = WebContextFactory.get(); 
			HttpSession session=ctx.getSession(); 
			
			
			if("a".equals("b")==true)
			{
				result="yanzhenmacuowu";
			}
			else
			{
				String sql="from TUser where userName=? and userPw=? and userDel='no'";
				Object[] con={userName,userPw};
				List userList=userDAO.getHibernateTemplate().find(sql,con);
				
				if(userList.size()==0)
				{
					 result="no";
				}
				else
				{
					 TUser user=(TUser)userList.get(0);
					 
					 session.setAttribute("userType", 1);
		             session.setAttribute("user", user);
		             
		             Cart cart=new Cart();
					 session.setAttribute("cart", cart);	             
		             result="yes";
				}
			}
			
			
		}
		if(userType==2)
		{
			
		}
		return result;
	}
	
	
	public String userLogout()//用户退出
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession(); 
		 
		 session.setAttribute("userType", null);
	     session.setAttribute("user", null);
	     
	     return "yes";
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		admin.setUserPw(userPwNew);
		
		adminDAO.getHibernateTemplate().update(admin);
		session.setAttribute("admin", admin);
		
		return "yes";
    }
}
