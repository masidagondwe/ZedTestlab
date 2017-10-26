/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import com.zedlab.model.Projectversion;

/**
 * @author Temwani
 *
 */
public interface ProjectversionService {

	Projectversion findById(int id);
    
	Projectversion findByName(String name);
     
    List<Projectversion> findByTestcaseId(int id);
    
    void addProjectversion(Projectversion projectversion);
     
    void deleteByName(String name);
     
    List<Projectversion> findAllProjectversions();
}
