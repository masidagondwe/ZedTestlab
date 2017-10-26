/**
 * 
 */
package com.zedlab.dao;

import java.util.List;

import com.zedlab.model.Testcase;

/**
 * @author Temwani
 *
 */
public interface TestcaseDao {

	Testcase findById(int id);
    
	Testcase findByName(String name);
	
	List<Testcase> findByFeatureId(int id);

	List<Testcase> findByProjectId(int id);
	
	List<Testcase> findByQAUserId(int id);	
	
    void addTestcase(Testcase testcase);
    
    void editTestcase(Testcase testcase);
    
    void deleteTestcase(Testcase testcase);
     
    void deleteByName(String name);
     
    List<Testcase> findAllTestcases();
}
