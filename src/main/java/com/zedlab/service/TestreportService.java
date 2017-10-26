/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import com.zedlab.model.Testreport;

/**
 * @author Temwani
 *
 */
public interface TestreportService {

		Testreport findById(int id);
	    
		Testreport findByName(String name);
	
	    List<Testreport> findByTestcaseId(int id);	
		
	    void addTestreport(Testreport testreport);
	     
	    void deleteByName(String name);
	     
	    List<Testreport> findAllTestreports();
}
