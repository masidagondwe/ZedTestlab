package com.zedlab.dao;

import java.sql.SQLException;
//import java.sql.SQLException;
import java.util.List;

//import com.zedlab.model.Login;
import com.zedlab.model.QAUser;  
 

public interface QAUserDao {
	 
    QAUser findById(int id);
     
    QAUser findByEmail(String email);
     
    void registerUser(QAUser user);

    public boolean isValidUser(String username, String password)throws SQLException;    
    
    void deleteUser(int id);
     
    List<QAUser> getAllUsers();
 
}