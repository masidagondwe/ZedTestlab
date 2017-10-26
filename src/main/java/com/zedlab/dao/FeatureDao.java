
package com.zedlab.dao;

import java.util.List;

import com.zedlab.model.Feature;


public interface FeatureDao {
	 Feature getByFeature_ID(int Feature_ID);
	 
	 List<Feature> getAllFeatures();
	 
	 List<Feature> findByProjectId(int id);
	 
	 int addFeature(Feature feature);
	 
	 void update(Feature feature);
	 
	 void view(Feature feature);
	 
	 void delete(int Feature_ID);
}
