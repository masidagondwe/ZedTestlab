/**
 * 
 */
package com.zedlab.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.dao.TestcaseDao;
import com.zedlab.model.Testcase;

/**
 * @author Temwani
 *
 */
@Service("testcaseService")
@Transactional
public class TestcaseServiceImpl implements TestcaseService{
 
	    @Autowired
	    private TestcaseDao dao;
	 
	    public Testcase findById(int id) {
	        return dao.findById(id);
	    }
	 
	    public Testcase findByName(String name) {
	    	return dao.findByName(name);
	    }
	
		public List<Testcase> findByFeatureId(int id) {	
			return dao.findByFeatureId(id);	
		} 
	
	    public List<Testcase> findByProjectId(int id) {
	        return dao.findByProjectId(id);
	    }
	
	    public List<Testcase> findByQAUserId(int id) {
	        return dao.findByQAUserId(id);
	    }    
	    
	    public List<Testcase> findAllTestcases() {
	        return dao.findAllTestcases();
	    }
	    
	    public void addTestcase(Testcase testcase) {
	        dao.addTestcase(testcase);
	    }
	 
	    public void editTestcase(Testcase testcase) {
	        dao.editTestcase(testcase);
	    }
	    
	    public void deleteTestcase(Testcase testcase) {
	        dao.deleteTestcase(testcase);
	    }
	    
	    public void updateTestcase(Testcase testcase) {
	    	Testcase entity = dao.findById(testcase.getId());
	        if(entity!=null){
	            entity.setId(testcase.getId());
	            entity.setName(testcase.getName());
	            entity.setObjective(testcase.getObjective());
	            entity.setPrioritylevel(testcase.getPrioritylevel());
	            entity.setExpectedresult(testcase.getExpectedresult());
	            entity.setObtainedresult(testcase.getObtainedresult());
	        }
	    }
	 
	     
	    public void deleteByName(String name) {
	        dao.deleteByName(name);
	    }
 
}
