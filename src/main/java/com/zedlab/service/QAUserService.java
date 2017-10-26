package com.zedlab.service;

import java.sql.SQLException;
import java.util.List;

import com.zedlab.model.QAUser;

public interface QAUserService
{

	  List<QAUser> getAllUsers();

	  QAUser getUser(int id);

	  QAUser getUserByEmail(String email);
	 
	  void registerUser(QAUser user);
	 
	  boolean isValidUser(String username, String password) throws SQLException;
	  
	  void deleteUser(int id);
}
