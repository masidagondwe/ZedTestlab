/**
 * 
 */
package com.zedlab.dao;

import java.util.List;

import com.zedlab.model.Projectversion;

/**
 * @author Temwani
 *
 */
public interface ProjectversionDao {

	Projectversion findById(int id);
    
	Projectversion findByName(String name);
     
    List<Projectversion> findByTestcaseId(int id);
	
	void addProjectversion(Projectversion projectv);
     
    void deleteByName(String name);
     
    List<Projectversion> findAllProjectversions();
}
