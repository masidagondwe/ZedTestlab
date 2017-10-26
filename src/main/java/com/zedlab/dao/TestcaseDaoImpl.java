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

import com.zedlab.model.Testcase;

@Repository("testcaseDao")
public class TestcaseDaoImpl extends AbstractDao<Integer, Testcase> implements TestcaseDao {
 
	    public Testcase findById(int id) {
	    	Testcase testcase = getByKey(id);
	        /*if(testcase!=null){
	            Hibernate.initialize(testcase.getReports());
	            Hibernate.initialize(testcase.getVersions());
	        }*/
	        return testcase;
	    }
	 
	    public Testcase findByName(String name) {
	        System.out.println("Name : "+name);
	        Criteria crit = createEntityCriteria();
	        crit.add(Restrictions.eq("name", name));
	        Testcase testcase = (Testcase)crit.uniqueResult();
	        if(testcase!=null){
	            Hibernate.initialize(testcase.getReports());
	            Hibernate.initialize(testcase.getVersions());
	        }
	        return testcase;
	    }
	    
		public List<Testcase> findByFeatureId(int id) {
	        Criteria criteria = createEntityCriteria();
	        criteria.add(Restrictions.eq("feature.id", id));
	        @SuppressWarnings("unchecked")
			List<Testcase> testcases = (List<Testcase>) criteria.list();
	        return testcases;
		} 
		
		public List<Testcase> findByProjectId(int id) {
	        Criteria criteria = createEntityCriteria();
	        criteria.add(Restrictions.eq("project.id", id));
	        @SuppressWarnings("unchecked")
			List<Testcase> testcases = (List<Testcase>) criteria.list();
	        return testcases;
		}

		public List<Testcase> findByQAUserId(int id) {
	        Criteria criteria = createEntityCriteria();
	        criteria.add(Restrictions.eq("user.id", id));
	        @SuppressWarnings("unchecked")
			List<Testcase> testcases = (List<Testcase>) criteria.list();
	        return testcases;
		}		
		
	    @SuppressWarnings("unchecked")
	    public List<Testcase> findAllTestcases() {
	        Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
	        //criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
	        List<Testcase> testcases = (List<Testcase>) criteria.list();
	         
	        return testcases;
	    }
	 
	    public void addTestcase(Testcase testcase) {
	        persist(testcase);
	    }
	 
	    public void editTestcase(Testcase testcase) {
	        edit(testcase);
	    }    
	    
	    public void deleteTestcase(Testcase testcase) {
	        delete(testcase);
	    }  
	    
	    public void deleteByName(String name) {
	        Criteria crit = createEntityCriteria();
	        crit.add(Restrictions.eq("name", name));
	        Testcase testcase = (Testcase)crit.uniqueResult();
	        delete(testcase);
	    }

}
