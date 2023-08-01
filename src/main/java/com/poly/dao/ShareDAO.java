package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entity.SHARES;
import com.poly.entity.VIDEO;
import com.poly.util.JpaUtils;

public class ShareDAO extends AbstractDAO<SHARES>{
	public List<VIDEO> findShareUser(String id){
		entitymanager.getTransaction().begin();
		String jpql = "SELECT o.video FROM SHARES o WHERE o.users.id=:user";
		TypedQuery<VIDEO> query = entitymanager.createQuery(jpql, VIDEO.class);
		query.setParameter("user", id);
		List<VIDEO> list = query.getResultList();
		entitymanager.getTransaction().commit();
		return list;
	}
	public List<VIDEO> findShareVideo(String id){
		entitymanager.getTransaction().begin();
		String jpql = "SELECT o.video FROM SHARES o WHERE o.video.id=:vd";
		TypedQuery<VIDEO> query = entitymanager.createQuery(jpql, VIDEO.class);
		query.setParameter("vd", id);
		List<VIDEO> list = query.getResultList();
		entitymanager.getTransaction().commit();
		return list;
	}
}
