/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.dao.FeatureDao;
import com.zedlab.model.Feature;


/**
 * @author Temwani
 *
 */
@Service("featureService")
@Transactional
public class FeatureServiceImpl implements FeatureService {

	    @Autowired
	    private FeatureDao dao;
	    
		
		public Feature getByFeature_ID(int id) 
		{
			return dao.getByFeature_ID(id);
		}
	
	
		public List<Feature> getAllFeatures() 
		{
	        return dao.getAllFeatures();
		}
	
		public List<Feature> findByProjectId(int id) 
		{
	        return dao.findByProjectId(id);
		}
		
		@Override
		public void addFeature(Feature feature) 
		{
			dao.addFeature(feature);
		}
	
		
		public void update(Feature feature) 
		{
			Feature entity = dao.getByFeature_ID(feature.getId());
	        if(entity!=null){
	            entity.setId(feature.getId());
	            entity.setName(feature.getName());
	            entity.setFunction(feature.getFunction());
	            entity.setType(feature.getType());
	        }
		}
	
		@Override
		public void view(Feature feature) 
		{
			dao.view(feature);		
		}
	
		@Override
		public void delete(int Feature_ID) 
		{
			dao.delete(Feature_ID);
			
		}

}
