package com.poly.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.entity.VIDEO;



public class VideoDAO extends AbstractDAO<VIDEO> {
//	public List<VIDEO> findAll(int pageNumber, int pageSize) {
//	    String jsql = "FROM VIDEO";
//	    TypedQuery<VIDEO> query = entitymanager.createQuery(jsql, VIDEO.class);
//
//	    // Calculate the first result index for the given page number and page size
//	    int firstResult = (pageNumber - 1) * pageSize;
//	    query.setFirstResult(firstResult);
//
//	    // Set the maximum number of results (i.e., page size)
//	    query.setMaxResults(pageSize);
//
//	    List<VIDEO> list = query.getResultList();
//	    return list;
//	}
//	public List<VIDEO> findAll(int pageNumber, int pageSize) {
//		return super.findAll(VIDEO.class, pageNumber, pageSize);
//	}
	@SuppressWarnings("unchecked")
	public List<VIDEO> findVideoTop5(){
		Query query = entitymanager.createNamedQuery("Report.random4");
		List<VIDEO > list = query.getResultList();
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<VIDEO> findVideoTop(){
		Query query = entitymanager.createNamedQuery("Report.random42");
		List<VIDEO > list = query.getResultList();
		return list;
	}
	
	public List<VIDEO> findVideoLike(String id){
		entitymanager.getTransaction().begin();
		String jpql = "SELECT o.video FROM FAVORITE o WHERE o.users.id=:user";
		TypedQuery<VIDEO> query = entitymanager.createQuery(jpql, VIDEO.class);
		query.setParameter("user", id);
		List<VIDEO> list = query.getResultList();
		entitymanager.getTransaction().commit();
		return list;
	}
	
	public List<VIDEO> findVideoShare(String id){
		entitymanager.getTransaction().begin();
		String jpql = "SELECT DISTINCT o.video FROM SHARES o WHERE o.users.id=:user";
		TypedQuery<VIDEO> query = entitymanager.createQuery(jpql, VIDEO.class);
		query.setParameter("user", id);
		List<VIDEO> list = query.getResultList();
		entitymanager.getTransaction().commit();
		return list;
	}
	

}
