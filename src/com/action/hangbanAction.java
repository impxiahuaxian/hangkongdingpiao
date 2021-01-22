package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import org.apache.struts2.ServletActionContext;

import com.dao.THangbanDAO;
import com.model.THangban;
import com.opensymphony.xwork2.ActionSupport;

public class hangbanAction extends ActionSupport
{
    private Integer id;
	
	private String riqi;
	private String bianhao;
	private String shifadi;
	private String daodadi;
	
	private String qifeishi;
	private Integer shengpiao;
	private Integer chengrenpiaojia;
	
	private Integer ertongpiaojia;
	private String del;
	
	private THangbanDAO hangbanDAO;
	
	public String hangbanAdd()//航班添加
	{
			
		THangban hangban=new THangban();
		
		hangban.setRiqi(riqi);
		hangban.setBianhao(bianhao);
		hangban.setShifadi(shifadi);
		hangban.setDaodadi(daodadi);
		
		hangban.setQifeishi(qifeishi);
		hangban.setShengpiao(shengpiao);
		hangban.setChengrenpiaojia(chengrenpiaojia);
		
		hangban.setErtongpiaojia(ertongpiaojia);
		hangban.setDel("no");
		
		hangbanDAO.save(hangban);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息添加完毕");
		return "msg";
	}
	
	
	public String hangbanMana()//航班管理
	{
		String sql="from THangban where del='no' order by riqi";
		List hangbanList=hangbanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");//把数据放入了action的request里
		request.put("hangbanList", hangbanList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String hangbanDel()//航班删除
	{
		THangban hangban=hangbanDAO.findById(id);
		hangban.setDel("yes");
		hangbanDAO.attachDirty(hangban);
		
		Map request=(Map)ServletActionContext.getContext().get("request");//把数据放入了action的request里
		request.put("msg", "信息删除完毕");
		return "msg";
	}
	
	public String hangbanAll()
	{
		//
		String sql="from THangban where del='no' and riqi>? order by riqi ";//判断日期是否过期
		Object[] c={new SimpleDateFormat("yyyy-MM-dd").format(new Date())};//格式化当前日期
		List hangbanList=hangbanDAO.getHibernateTemplate().find(sql,c);//这个方法返回的是一个List集合
		
		Map request=(Map)ServletActionContext.getContext().get("request");//在Action里面获取request对象
		request.put("hangbanList", hangbanList);
		return ActionSupport.SUCCESS;
	}

	
	public String hangbanDetailQian()//航班详细信息
	{
		THangban hangban=hangbanDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("hangban", hangban);
		return ActionSupport.SUCCESS;
	}

	
	
	public String hangbanRes()//航班查找
	{
		String sql="from THangban where del='no' and riqi='"+riqi+"'"+" and shifadi like '%"+shifadi.trim()+"%'";
		List hangbanList=hangbanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("hangbanList", hangbanList);//设置请求返回数据
		return ActionSupport.SUCCESS;
	}
	public String getBianhao()
	{
		return bianhao;
	}


	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}



	public Integer getChengrenpiaojia()
	{
		return chengrenpiaojia;
	}


	public void setChengrenpiaojia(Integer chengrenpiaojia)
	{
		this.chengrenpiaojia = chengrenpiaojia;
	}


	public String getDaodadi()
	{
		return daodadi;
	}


	public void setDaodadi(String daodadi)
	{
		this.daodadi = daodadi;
	}


	public String getDel()
	{
		return del;
	}


	public void setDel(String del)
	{
		this.del = del;
	}


	public Integer getErtongpiaojia()
	{
		return ertongpiaojia;
	}


	public void setErtongpiaojia(Integer ertongpiaojia)
	{
		this.ertongpiaojia = ertongpiaojia;
	}


	public THangbanDAO getHangbanDAO()
	{
		return hangbanDAO;
	}


	public void setHangbanDAO(THangbanDAO hangbanDAO)
	{
		this.hangbanDAO = hangbanDAO;
	}


	public Integer getId()
	{
		return id;
	}


	public void setId(Integer id)
	{
		this.id = id;
	}


	public String getQifeishi()
	{
		return qifeishi;
	}


	public void setQifeishi(String qifeishi)
	{
		this.qifeishi = qifeishi;
	}


	public String getRiqi()
	{
		return riqi;
	}


	public void setRiqi(String riqi)
	{
		this.riqi = riqi;
	}


	public Integer getShengpiao()
	{
		return shengpiao;
	}


	public void setShengpiao(Integer shengpiao)
	{
		this.shengpiao = shengpiao;
	}


	public String getShifadi()
	{
		return shifadi;
	}


	public void setShifadi(String shifadi)
	{
		this.shifadi = shifadi;
	}
	
	
}
