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
	
	public String hangbanAdd()//�������
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
		request.put("msg", "��Ϣ������");
		return "msg";
	}
	
	
	public String hangbanMana()//�������
	{
		String sql="from THangban where del='no' order by riqi";
		List hangbanList=hangbanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");//�����ݷ�����action��request��
		request.put("hangbanList", hangbanList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String hangbanDel()//����ɾ��
	{
		THangban hangban=hangbanDAO.findById(id);
		hangban.setDel("yes");
		hangbanDAO.attachDirty(hangban);
		
		Map request=(Map)ServletActionContext.getContext().get("request");//�����ݷ�����action��request��
		request.put("msg", "��Ϣɾ�����");
		return "msg";
	}
	
	public String hangbanAll()
	{
		//
		String sql="from THangban where del='no' and riqi>? order by riqi ";//�ж������Ƿ����
		Object[] c={new SimpleDateFormat("yyyy-MM-dd").format(new Date())};//��ʽ����ǰ����
		List hangbanList=hangbanDAO.getHibernateTemplate().find(sql,c);//����������ص���һ��List����
		
		Map request=(Map)ServletActionContext.getContext().get("request");//��Action�����ȡrequest����
		request.put("hangbanList", hangbanList);
		return ActionSupport.SUCCESS;
	}

	
	public String hangbanDetailQian()//������ϸ��Ϣ
	{
		THangban hangban=hangbanDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("hangban", hangban);
		return ActionSupport.SUCCESS;
	}

	
	
	public String hangbanRes()//�������
	{
		String sql="from THangban where del='no' and riqi='"+riqi+"'"+" and shifadi like '%"+shifadi.trim()+"%'";
		List hangbanList=hangbanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("hangbanList", hangbanList);//�������󷵻�����
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
