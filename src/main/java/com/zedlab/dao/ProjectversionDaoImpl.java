/**
 * 
 */
package com.zedlab.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.zedlab.model.Projectversion;

/**
 * @author Temwani
 *
 */
@Repository("versionDao")
public class ProjectversionDaoImpl  extends AbstractDao<Integer, Projectversion> implements ProjectversionDao {
 
    public Projectversion findById(int id) 
    {
    	Projectversion projectversion = getByKey(id);

        return projectversion;
    }
 
    public Projectversion findByName(String name) 
    {
        System.out.println("Name : "+name);
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", name));
        Projectversion projectversion = (Projectversion)crit.uniqueResult();

        return projectversion;
    }

	public List<Projectversion> findByTestcaseId(int id) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("testcase.id", id));
        @SuppressWarnings("unchecked")
		List<Projectversion> projectversions = (List<Projectversion>) criteria.list();
        return projectversions;
	}
	
    @SuppressWarnings("unchecked")
    public List<Projectversion> findAllProjectversions() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Projectversion> projectversion = (List<Projectversion>) criteria.list();
         
        return projectversion;
    }
 
    public void addProjectversion(Projectversion projectversion) {
        persist(projectversion);
    }
 
    public void deleteByName(String name) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", name));
        Projectversion projectversion = (Projectversion)crit.uniqueResult();
        delete(projectversion);
    }
}
