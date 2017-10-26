/**
 * 
 */
package com.zedlab.service;

import java.util.List;

import com.zedlab.model.Project;

/**
 * @author Temwani
 *
 */
public interface ProjectService {
    Project findById(int id);
    
    Project findByName(String name);
     
    void addProject(Project project);
    
    void editProject(Project project);
    
    void deleteProject(Project project);
     
    void deleteByName(String name);
     
    List<Project> findAllProjects();
}
