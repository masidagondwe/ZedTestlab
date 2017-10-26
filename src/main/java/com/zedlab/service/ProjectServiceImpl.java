/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.dao.ProjectDao;
import com.zedlab.model.Project;

/**
 * @author Temwani
 *
 */
@Service("projectService")
@Transactional
public class ProjectServiceImpl implements ProjectService{
 
    @Autowired
    private ProjectDao dao;
 
    public Project findById(int id) {
        return dao.findById(id);
    }
 
    public Project findByName(String name) {
    	Project project = dao.findByName(name);
        return project;
    }
 
    public void addProject(Project project) {
        dao.addProject(project);
    }
    
    public void editProject(Project project) {
        dao.editProject(project);
    }
    
    public void deleteProject(Project project) {
        dao.deleteProject(project);
    }    
 
    /*
     * Since the method is running with Transaction, No need to call hibernate update explicitly.
     * Just fetch the entity from db and update it with proper values within transaction.
     * It will be updated in db once transaction ends. 
     */
    public void updateProject(Project project) {
    	Project entity = dao.findById(project.getId());
        if(entity!=null){
            entity.setId(project.getId());
            entity.setName(project.getName());
            entity.setDatelaunched(project.getDatelaunched());
        }
    }
 
     
    public void deleteByName(String name) {
        dao.deleteByName(name);
    }
 
    public List<Project> findAllProjects() {
        return dao.findAllProjects();
    }
  
}
