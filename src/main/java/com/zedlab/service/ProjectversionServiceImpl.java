/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.dao.ProjectversionDao;
import com.zedlab.model.Projectversion;

/**
 * @author Temwani
 *
 */
@Service("versionService")
@Transactional
public class ProjectversionServiceImpl implements ProjectversionService{
 
	    @Autowired
	    private ProjectversionDao dao;
	 
	    public Projectversion findById(int id) {
	        return dao.findById(id);
	    }
	 
	    public Projectversion findByName(String name) {
	    	return dao.findByName(name);
	    }
	 
	    public List<Projectversion> findByTestcaseId(int id) {
	        return dao.findByTestcaseId(id);
	    }
	    
	    public void addProjectversion(Projectversion projectversion) {
	        dao.addProjectversion(projectversion);
	    }
	 
	    public void updateProjectversion(Projectversion projectversion) {
	    	Projectversion entity = dao.findById(projectversion.getId());
	        if(entity!=null){
	            entity.setId(projectversion.getId());
	            entity.setName(projectversion.getName());
	            entity.setDatelaunched(projectversion.getDatelaunched());
	            
	        }
	    }
	 
	     
	    public void deleteByName(String name) {
	        dao.deleteByName(name);
	    }
	 
	    public List<Projectversion> findAllProjectversions() {
	        return dao.findAllProjectversions();
	    }
}
