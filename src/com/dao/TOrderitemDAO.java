package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TOrderitem;

/**
 * Data access object (DAO) for domain model class TOrderitem.
 * 
 * @see com.model.TOrderitem
 * @author MyEclipse Persistence Tools
 */

public class TOrderitemDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TOrderitemDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TOrderitem transientInstance)
	{
		log.debug("saving TOrderitem instance");
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

	public void delete(TOrderitem persistentInstance)
	{
		log.debug("deleting TOrderitem instance");
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

	public TOrderitem findById(java.lang.String id)
	{
		log.debug("getting TOrderitem instance with id: " + id);
		try
		{
			TOrderitem instance = (TOrderitem) getHibernateTemplate().get(
					"com.model.TOrderitem", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TOrderitem instance)
	{
		log.debug("finding TOrderitem instance by example");
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
		log.debug("finding TOrderitem instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TOrderitem as model where model."
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
		log.debug("finding all TOrderitem instances");
		try
		{
			String queryString = "from TOrderitem";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TOrderitem merge(TOrderitem detachedInstance)
	{
		log.debug("merging TOrderitem instance");
		try
		{
			TOrderitem result = (TOrderitem) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TOrderitem instance)
	{
		log.debug("attaching dirty TOrderitem instance");
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

	public void attachClean(TOrderitem instance)
	{
		log.debug("attaching clean TOrderitem instance");
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

	public static TOrderitemDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TOrderitemDAO) ctx.getBean("TOrderitemDAO");
	}
}