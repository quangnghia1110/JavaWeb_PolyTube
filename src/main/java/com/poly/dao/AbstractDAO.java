package com.poly.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entity.VIDEO;
import com.poly.util.JpaUtils;

public abstract class AbstractDAO<T> {
	protected EntityManager entitymanager = JpaUtils.getEntityManager();
	protected Class<T> entityClass;

	@SuppressWarnings("unchecked")
	public AbstractDAO() {
		ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
		this.entityClass = (Class<T>) genericSuperclass.getActualTypeArguments()[0];
	}

	@Override
	protected void finalize() throws Throwable {
		entitymanager.close();
		super.finalize();
	}

	public T create(T entity) {
		try {
			entitymanager.getTransaction().begin();
			entitymanager.persist(entity);
			entitymanager.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			entitymanager.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public T update(T entity) {
		try {
			entitymanager.getTransaction().begin();
			entitymanager.merge(entity);
			entitymanager.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			entitymanager.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public T remove(String id) {
		T entity = this.findById(id);
		try {
			entitymanager.getTransaction().begin();
			entitymanager.remove(entity);
			entitymanager.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			entitymanager.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public T findById(String id) {
		T entity = entitymanager.find(entityClass, id);
		return entity;
	}

	public List<T> findAll() {
		String jsql = "FROM " + entityClass.getSimpleName();
		TypedQuery<T> query = entitymanager.createQuery(jsql, entityClass);
		List<T> list = query.getResultList();
		return list;
	}
//	public List<T> findAll(int pageNumber, int pageSize) {
//	    int firstResult = (pageNumber - 1) * pageSize;
//
//	    String jsql = "FROM " + entityClass.getSimpleName();
//	    TypedQuery<T> query = entitymanager.createQuery(jsql, entityClass);
//	    query.setFirstResult(firstResult);
//	    query.setMaxResults(pageSize);
//
//	    List<T> list = query.getResultList();
//	    return list;
//	}
//	public List<T> findAll(Class<T> clazz, int pageNumber, int pageSize){
//		String entityName = clazz.getSimpleName();
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT o FROM ").append(entityName).append(" o");
//		TypedQuery<T> query = entitymanager.createQuery(sql.toString(), clazz);
//		//phân trang
//		query.setFirstResult((pageNumber-1)*pageSize);
//		query.setMaxResults(pageSize);
//		return query.getResultList();
//	}


}
