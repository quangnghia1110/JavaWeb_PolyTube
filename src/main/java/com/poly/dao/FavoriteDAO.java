package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.entity.FAVORITE;
import com.poly.entity.USERS;
import com.poly.entity.VIDEO;
import com.poly.util.JpaUtils;

public class FavoriteDAO extends AbstractDAO<FAVORITE> {
	public List<String> findAllLike() {
		String jsql = "SELECT o.video.title FROM FAVORITE o GROUP BY o.video.title";
		TypedQuery<String> query = entitymanager.createQuery(jsql, String.class);
		List<String> list = query.getResultList();
		return list;
	}

	public List<VIDEO> findLikeVideo(String id) {
		entitymanager.getTransaction().begin();
		String jpql = "SELECT o.video FROM FAVORITE o WHERE o.users.id=:user";
		TypedQuery<VIDEO> query = entitymanager.createQuery(jpql, VIDEO.class);
		query.setParameter("user", id);
		List<VIDEO> list = query.getResultList();
		entitymanager.getTransaction().commit();
		return list;
	}
	public List<FAVORITE> findLike(String id,String userId) {
		String jpql = "SELECT o FROM FAVORITE o WHERE o.video.id=:vid and o.users.id=:user";
		TypedQuery<FAVORITE> query = entitymanager.createQuery(jpql, FAVORITE.class);
		query.setParameter("vid", id);
		query.setParameter("user", userId);
		
		List<FAVORITE> list = query.getResultList();
		return list;
	}
	public List<VIDEO> findByVideo(String id) {
		entitymanager.getTransaction().begin();
		String jpql = "SELECT o.video FROM FAVORITE o WHERE o.video.id=:vid";
		TypedQuery<VIDEO> query = entitymanager.createQuery(jpql, VIDEO.class);
		query.setParameter("vid", id);
		List<VIDEO> list = query.getResultList();
		entitymanager.getTransaction().commit();
		return list;
	}
	public List<Long> getLike(String id) {
		String jpql = "SELECT count(o.video) FROM FAVORITE o WHERE o.video.id=:vid";
		TypedQuery<Long> query = entitymanager.createQuery(jpql,Long.class);
		query.setParameter("vid",id);
		List<Long> list = query.getResultList();
		return list;
	}
}
