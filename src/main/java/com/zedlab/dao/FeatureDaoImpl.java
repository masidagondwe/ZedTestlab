package com.zedlab.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.model.Feature;


@Repository
@Transactional
public class FeatureDaoImpl extends AbstractDao<Integer, Feature>  implements FeatureDao {

		 @Autowired
		 private SessionFactory sessionFactory;
		
		 
		 @Override
		 public Feature getByFeature_ID(int Feature_ID) 
		 {
			 return (Feature) sessionFactory.getCurrentSession().get(Feature.class, Feature_ID);
		 }
		
		
		 @SuppressWarnings("unchecked")
		 @Override
		 public List<Feature> getAllFeatures() 
		 {
			 Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Feature.class);
			 return criteria.list();
		 }
		
		 
		
		 public List<Feature> findByProjectId(int id) 
		 {
		     Criteria criteria = createEntityCriteria();
		     criteria.add(Restrictions.eq("project.id", id));
		     @SuppressWarnings("unchecked")
			 List<Feature> listFeatures = (List<Feature>) criteria.list();
		     return listFeatures;
		 }
		 
		 @Override
		 public int addFeature(Feature feature) 
		 {
			 return (Integer) sessionFactory.getCurrentSession().save(feature);
		 }
		
		
		 @Override
		 public void update(Feature feature) 
		 {
			 sessionFactory.getCurrentSession().merge(feature);
		 }
		
		
		 @Override
		 public void view(Feature feature) 
		 {
			 sessionFactory.getCurrentSession().merge(feature);
		 }
		
		
		 @Override
		 public void delete(int Feature_ID)
		 {
			 Feature s = getByFeature_ID(Feature_ID);
			 sessionFactory.getCurrentSession().delete(s);
		 }
}
