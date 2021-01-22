package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.THangbanDAO;
import com.dao.TOrderDAO;
import com.dao.TOrderitemDAO;
import com.dao.TUserDAO;
import com.model.THangban;
import com.model.TOrder;
import com.model.TOrderitem;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class buyAction extends ActionSupport
{
	private String message;
	private String path;
	
	private THangbanDAO hangbanDAO;
	private TOrderDAO orderDAO;
	private TOrderitemDAO orderitemDAO;
	private TUserDAO userDAO;
	
	public String addToCart() //加入购物车
	{
		HttpServletRequest request=ServletActionContext.getRequest();//获得当前请求的对象
		HttpSession session=request.getSession();//从客户端获得一个session的对象
		Cart cart =(Cart)session.getAttribute("cart");//得到了session域中的cart对象
		//获得客户端发来的请求参数即获得名为times的请求值
		String id=String.valueOf(new Date().getTime());
		String orderId="";
		
		int hangbanId=Integer.parseInt(request.getParameter("hangbanId"));//getParameter获取参数
		String piaoleixing=request.getParameter("piaoleixing");
		int danjia=0;
		if(piaoleixing.equals("成人票")){danjia=hangbanDAO.findById(hangbanId).getChengrenpiaojia();}if(piaoleixing.equals("儿童票")){danjia=hangbanDAO.findById(hangbanId).getErtongpiaojia();}
		
		int shuliang=Integer.parseInt(request.getParameter("shuliang"));
		THangban hangban=hangbanDAO.findById(hangbanId);
		
		TOrderitem orderItem=new TOrderitem();
		
		orderItem.setId(id);
		orderItem.setOrderId(orderId);
		orderItem.setHangbanId(hangbanId);
		orderItem.setPiaoleixing(piaoleixing);

		orderItem.setDanjia(danjia);
		orderItem.setShuliang(shuliang);
		orderItem.setHangban(hangban);
		
		cart.addHangban(id, orderItem);
		
		session.setAttribute("cart", cart);//保存数据
		
		request.setAttribute("msg", "成功加入购物车"); //后台向前台传值，可得到jsp页面表单中输入框内的value
		return "msg";
	}
	



	public String delFromCart()//用户自己删除购物车订单
	{
		HttpServletRequest request=ServletActionContext.getRequest();//获取session对象
		HttpSession session=request.getSession();//在session中获取user对象
		Cart cart =(Cart)session.getAttribute("cart");
		
		cart.delHangban(request.getParameter("id"));
		
        session.setAttribute("cart", cart);//保存数据
		
		request.setAttribute("msg", "删除完毕");
		return "msg";
	}
	

	
	public String orderAdd()//从购物车生成订单
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		Cart cart =(Cart)session.getAttribute("cart");//得到了session域中的cart对象
		TUser user=(TUser)session.getAttribute("user");
		
		String id=String.valueOf(new Date().getTime());
		/*订单信息封装到订单（order）实体中，获得用户session中的id,赋值给order实体中*/
		TOrder order=new TOrder();
		
		order.setId(id);
		order.setUserId(user.getUserId());
		order.setXiadanshi(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		order.setShouhourenming(request.getParameter("shouhourenming"));
		
		order.setShouhourenhua(request.getParameter("shouhourenhua"));
		order.setShouhourenzhi(request.getParameter("shouhourenzhi"));
		order.setZongjiage(cart.getTotalPrice());
		order.setZhuangtai("未受理");
		
		orderDAO.save(order);//调用orderDAO 里的 save方法保存
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		{
			TOrderitem orderItem = (TOrderitem) it.next();
			orderItem.setOrderId(id);
			orderitemDAO.save(orderItem);
			
			jianqu_piaoshu(orderItem.getHangbanId(),orderItem.getShuliang());
		}
		
		cart.getItems().clear();
		session.setAttribute("cart", cart);//把cart保存在session里
		
		this.setMessage("下单成功");
		this.setPath("hangbanAll.action");
		return "succeed";
		
	}
	
	
	public String orderMana()//管理员查看订单
	{
		String sql="from TOrder order by zhuangtai";
		List orderList=orderDAO.getHibernateTemplate().find(sql);//找到数据库中所有订单
		
		for(int i=0;i<orderList.size();i++)
		{
			TOrder order=(TOrder)orderList.get(i);
			order.setUser(userDAO.findById(order.getUserId()));
		}
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("orderList", orderList);
		return ActionSupport.SUCCESS;
	}
	

	public String orderShouli() //管理员受理订单
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String id=request.getParameter("id");
		
		TOrder order=orderDAO.findById(id);//根据主键获得订单
		order.setZhuangtai("已受理");//已经受理订单
		orderDAO.attachDirty(order);//关联对象，保存结果
		
		request.setAttribute("msg", "订单受理完毕");
		return "msg";
	}
	
	
	public String orderDelAd()//管理员删除订单
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String id=request.getParameter("id");
		
		TOrder order=orderDAO.findById(id);//获得订单对象
		String sql="delete from TOrderitem where orderId="+order.getId();//拼一个删除订单的SQL
		orderitemDAO.getHibernateTemplate().bulkUpdate(sql);//执行该SQL
		
		orderDAO.delete(order);//删除该订单
		
		request.setAttribute("msg", "订单删除完毕");
		return "msg";
	}
	
	
	public String orderDetail() //订单信息明细
	{
		HttpServletRequest request=ServletActionContext.getRequest();//来获得当前请求的对象
		String orderId=request.getParameter("orderId");//它的作用是接受表单提交来的数据
		
		String sql="from TOrderitem where orderId=?";//定义一个sql查询语句
		Object[] c={orderId};
		List orderitemList=orderitemDAO.getHibernateTemplate().find(sql,c);//读取数据库数据并且转化为List。
		for(int i=0;i<orderitemList.size();i++)
		{
			TOrderitem orderitem=(TOrderitem)orderitemList.get(i);
			orderitem.setHangban(hangbanDAO.findById(orderitem.getHangbanId()));//用findById方法找到orderitem信息
		}
		request.setAttribute("orderitemList", orderitemList);//将orderitemList这个对象保存在request作用域中，然后在转发进入的页面就可以获取到你的值，
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderMine() //订单信息查看
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		String sql="from TOrder where userId="+user.getUserId();
		List orderList=orderDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("orderList", orderList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String orderQuxiao()//取消订单
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String id=request.getParameter("id");
		
		TOrder order=orderDAO.findById(id);
		if(order.getZhuangtai().equals("已受理"))
		{
			request.setAttribute("msg", "抱歉，您的订单已经受理，不能取消订单");
		}
		else
		{
			String sql="delete from TOrderitem where orderId="+order.getId();
			orderitemDAO.getHibernateTemplate().bulkUpdate(sql);
			
			orderDAO.delete(order);
			request.setAttribute("msg", "成功取消订单，欢迎您下次购买");
		}
		
		return "msg";
	}
	
	public void jianqu_piaoshu(int hangbanId,int shuliang)
	{
		THangban hangban=hangbanDAO.findById(hangbanId);
		hangban.setShengpiao(hangban.getShengpiao()-shuliang);
		hangbanDAO.attachDirty(hangban);
	}

	public THangbanDAO getHangbanDAO()
	{
		return hangbanDAO;
	}

	public void setHangbanDAO(THangbanDAO hangbanDAO)
	{
		this.hangbanDAO = hangbanDAO;
	}


	public String getMessage()
	{
		return message;
	}


	public void setMessage(String message)
	{
		this.message = message;
	}


	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public TOrderDAO getOrderDAO()
	{
		return orderDAO;
	}


	public void setOrderDAO(TOrderDAO orderDAO)
	{
		this.orderDAO = orderDAO;
	}


	public TOrderitemDAO getOrderitemDAO()
	{
		return orderitemDAO;
	}


	public void setOrderitemDAO(TOrderitemDAO orderitemDAO)
	{
		this.orderitemDAO = orderitemDAO;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}
	
}
