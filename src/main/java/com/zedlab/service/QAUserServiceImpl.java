package com.zedlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zedlab.dao.QAUserDao;
import com.zedlab.model.QAUser;  
  
@Service("userService") 
public class QAUserServiceImpl implements QAUserService {
	 @Autowired  
	 QAUserDao userDao; 
	 
	 @Transactional  
	 public void registerUser(QAUser user) {  
	  userDao.registerUser(user);  
	 }  
	 
	 @Transactional
	 public boolean isValidUser(String username, String password) throws SQLException
     {
         return userDao.isValidUser(username, password);
     }	   
	 
	 @Transactional  
	 public List<QAUser> getAllUsers() {  
	  return userDao.getAllUsers();  
	 }  
	  
	 @Transactional  
	 public QAUser getUser(int id) {  
	  return userDao.findById(id);  
	 }  

	 @Transactional  
	 public QAUser getUserByEmail(String email) {  
	  return userDao.findByEmail(email);  
	 }
	 
/*	 @Transactional  
	 public void updateUser(QAUser user) {  
	  userDao.updateUser(user);  
	  
	 }  */
	  
	 @Transactional  
	 public void deleteUser(int id) {  
	  userDao.deleteUser(id);  
	 }

}
