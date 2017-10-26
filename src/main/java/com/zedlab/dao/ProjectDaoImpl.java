/**
 * 
 */
package com.zedlab.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

//import com.zedlab.model.Feature;
import com.zedlab.model.Project;

/**
 * @author Temwani
 *
 */

@Repository("projectDao")
public class ProjectDaoImpl extends AbstractDao<Integer, Project> implements ProjectDao {
 
    public Project findById(int id) {
    	Project project = getByKey(id);
    /*	List<Feature> features;
        if(project!=null){
         features =   Hibernate.initialize(project.getFeatures());
        }*/
        return project;
    }
 
    public Project findByName(String name) {
        System.out.println("Name : "+name);
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", name));
        Project project = (Project)crit.uniqueResult();
        if(project!=null){
            Hibernate.initialize(project.getFeatures());
        }
        return project;
    }
 
    @SuppressWarnings("unchecked")
    public List<Project> findAllProjects() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Project> projects = (List<Project>) criteria.list();
      
        return projects;
    }
 
    public void addProject(Project project) {
        persist(project);
    }
    
    public void editProject(Project project) {
        edit(project);
    }    
    
    public void deleteProject(Project project) {
        delete(project);
    }    
 
    public void deleteByName(String name) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", name));
        Project project = (Project)crit.uniqueResult();
        delete(project);
    }
 
}
