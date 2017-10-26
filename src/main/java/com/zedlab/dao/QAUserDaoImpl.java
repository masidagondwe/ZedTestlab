package com.zedlab.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.zedlab.model.QAUser;

@Repository("userDao")
public class QAUserDaoImpl extends AbstractDao<Integer, QAUser> implements QAUserDao {
 
    @Override    
    public boolean isValidUser(String username, String password)
    {
		boolean userFound = false;
		Criteria criteria = createEntityCriteria();    
        criteria.add(Restrictions.eq("username", username));
        criteria.add(Restrictions.eq("password", password));
        QAUser user = (QAUser) criteria.uniqueResult();
        if(user != null)
        	userFound = true;
		
        return userFound;   	
    }
   
    public void registerUser(QAUser user) 
    {
   	 	persist(user);
    }  
    
    public QAUser findById(int id) {
    	QAUser user = getByKey(id);
    	return user;
    }
 
    public QAUser findByEmail(String email) {
    	  Criteria criteria = createEntityCriteria();
          criteria.add(Restrictions.eq("email", email));
          return (QAUser) criteria.uniqueResult();
    }
 
    @SuppressWarnings("unchecked")
    public List<QAUser> getAllUsers() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("fullname"));       
        List<QAUser> users = (List<QAUser>) criteria.list();
    	   	
    	return users;
    }

	public void deleteUser(int id) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("id", id));
        QAUser user = (QAUser)crit.uniqueResult();
        delete(user);  
	}
}

