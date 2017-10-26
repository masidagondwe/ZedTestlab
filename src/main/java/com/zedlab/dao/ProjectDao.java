/**
 * 
 */
package com.zedlab.dao;

import java.util.List;

import com.zedlab.model.Project;

/**
 * @author Temwani
 *
 */
public interface ProjectDao {

    Project findById(int id);
    
    Project findByName(String name);
     
    void addProject(Project project);
    
    void editProject(Project project);
     
    void deleteByName(String name);
    
    void deleteProject(Project project);
     
    List<Project> findAllProjects();
}
