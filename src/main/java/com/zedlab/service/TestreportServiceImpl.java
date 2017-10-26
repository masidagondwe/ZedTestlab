/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.dao.TestreportDao;
import com.zedlab.model.Testreport;

/**
 * @author Temwani
 *
 */
@Service("reportService")
@Transactional
public class TestreportServiceImpl implements TestreportService{
 
	    @Autowired
	    private TestreportDao dao;
	 
	    public Testreport findById(int id) {
	        return dao.findById(id);
	    }
	 
	    public Testreport findByName(String name) {
	    	Testreport testreport = dao.findByName(name);
	        return testreport;
	    }
	 
	    public List<Testreport> findByTestcaseId(int id) {
	        return dao.findByTestcaseId(id);
	    }    
	    
	    public void addTestreport(Testreport testreport) {
	        dao.addTestreport(testreport);
	    }
	 
	    public void updateTestreport(Testreport testreport) {
	    	Testreport entity = dao.findById(testreport.getId());
	        if(entity!=null){
	            entity.setId(testreport.getId());
	            entity.setName(testreport.getName());
	            entity.setReportdate(testreport.getReportdate());
	            entity.setReport(testreport.getReport());
	        }
	    }
	 
	     
	    public void deleteByName(String name) {
	        dao.deleteByName(name);
	    }
	 
	    public List<Testreport> findAllTestreports() {
	        return dao.findAllTestreports();
	    }
}
