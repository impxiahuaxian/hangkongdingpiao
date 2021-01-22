package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.THangban;

/**
 * Data access object (DAO) for domain model class THangban.
 * 
 * @see com.model.THangban
 * @author MyEclipse Persistence Tools
 */

public class THangbanDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(THangbanDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(THangban transientInstance)
	{
		log.debug("saving THangban instance");
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

	public void delete(THangban persistentInstance)
	{
		log.debug("deleting THangban instance");
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

	public THangban findById(java.lang.Integer id)
	{
		log.debug("getting THangban instance with id: " + id);
		try
		{
			THangban instance = (THangban) getHibernateTemplate().get(
					"com.model.THangban", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(THangban instance)
	{
		log.debug("finding THangban instance by example");
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
		log.debug("finding THangban instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from THangban as model where model."
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
		log.debug("finding all THangban instances");
		try
		{
			String queryString = "from THangban";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public THangban merge(THangban detachedInstance)
	{
		log.debug("merging THangban instance");
		try
		{
			THangban result = (THangban) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(THangban instance)
	{
		log.debug("attaching dirty THangban instance");
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

	public void attachClean(THangban instance)
	{
		log.debug("attaching clean THangban instance");
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

	public static THangbanDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (THangbanDAO) ctx.getBean("THangbanDAO");
	}
}