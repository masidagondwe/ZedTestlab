/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import com.zedlab.model.Feature;

/**
 * @author Temwani
 *
 */
public interface FeatureService {
	 Feature getByFeature_ID(int Feature_ID);
	 
	 List<Feature> getAllFeatures();
	 
	 List<Feature> findByProjectId(int id);
	 
	 void addFeature(Feature feature);
	 
	 void update(Feature feature);
	 
	 void view(Feature feature);
	 
	 void delete(int Feature_ID);
}
