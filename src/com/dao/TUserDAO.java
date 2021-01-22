package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TUser;

/**
 * Data access object (DAO) for domain model class TUser.
 * 
 * @see com.model.TUser
 * @author MyEclipse Persistence Tools
 */
/*用户模块持久层代码*/
public class TUserDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TUserDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TUser transientInstance) //万一对象未保留（Transient事态），调用save措施保留
	{
		log.debug("saving TUser instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TUser persistentInstance) //管理员删除用户
	{
		log.debug("deleting TUser instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TUser findById(java.lang.Integer id)  //查找用户名判断是否可使用
	{
		log.debug("getting TUser instance with id: " + id);
		try
		{
			TUser instance = (TUser) getHibernateTemplate().get(
					"com.model.TUser", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TUser instance)
	{
		log.debug("finding TUser instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TUser instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TUser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TUser instances");
		try
		{
			String queryString = "from TUser where userDel='no'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	

	public TUser merge(TUser detachedInstance)//将传入的detached状态（已经保存）的对象的属性复制到持久化对象中，并返回该持久化对象，如果该session中没有关联的持久化对象，加载一个，如果传入对象未保存，保存一个副本并作为持久对象返回，传入对象依然保持detached状态。
	{
		log.debug("merging TUser instance");
		try
		{
			TUser result = (TUser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TUser instance) // 将传入的对象持久化并保存。如果对象未保存（Transient状态），调用save方法保存。如果对象已保存（Detached状态），调用update方法将对象与Session重新关联。
	{
		log.debug("attaching dirty TUser instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TUser instance)//将传入的对象状态设置为Transient状态  （非保存状态）
	{
		log.debug("attaching clean TUser instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TUserDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TUserDAO) ctx.getBean("TUserDAO");
	}
}