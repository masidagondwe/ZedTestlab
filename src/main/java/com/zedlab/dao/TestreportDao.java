/**
 * 
 */
package com.zedlab.dao;

import java.util.List;


import com.zedlab.model.Testreport;

/**
 * @author Temwani
 *
 */
public interface TestreportDao {

	Testreport findById(int id);
    
	Testreport findByName(String name);
     
    List<Testreport> findByTestcaseId(int id);
    
    void addTestreport(Testreport project);
     
    void deleteByName(String name);
     
    List<Testreport> findAllTestreports();
}
