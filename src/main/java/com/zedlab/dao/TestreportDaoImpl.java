package com.zedlab.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


import com.zedlab.model.Testreport;

@Repository("reportDao")
public class TestreportDaoImpl extends AbstractDao<Integer, Testreport> implements TestreportDao {
 
    public Testreport findById(int id) {
    	Testreport testreport = getByKey(id);

        return testreport;
    }
 
    public Testreport findByName(String name) {
        System.out.println("Name : "+name);
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", name));
        Testreport testreport = (Testreport)crit.uniqueResult();

        return testreport;
    }
 
    @SuppressWarnings("unchecked")
    public List<Testreport> findAllTestreports() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Testreport> testreport = (List<Testreport>) criteria.list();
         
        return testreport;
    }
 
	public List<Testreport> findByTestcaseId(int id) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("testcase.id", id));
        @SuppressWarnings("unchecked")
		List<Testreport> testreports = (List<Testreport>) criteria.list();
        return testreports;
	}
    
    public void addTestreport(Testreport testreport) {
        persist(testreport);
    }
 
    public void deleteByName(String name) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("name", name));
        Testreport testreport = (Testreport)crit.uniqueResult();
        delete(testreport);
    }
}
