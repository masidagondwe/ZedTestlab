package com.zedlab.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;  
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;  
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;  

@Entity  
@Table(name="qauser")
public class QAUser {
	 @Id  
	 @Column(name="user_id")  
	 @GeneratedValue(strategy=GenerationType.IDENTITY)  
	 int id;  
	   
	 @Column(name="fullname")  
	 String fullname;   
	     
	 @Column(name="jobTitle")  
	 String jobtitle;
	 
	 @Column(name="email")  
	 String email;
	 
	 @Column(name="username")  
	 String username;
	 
	 @Column(name="password")  
	 String password;
	 
	 @OneToMany
	 private Set<Testcase> testcases;
	 
	 public QAUser() {  
  
	 }  
	 
	 public QAUser(int id, String fullname, String jobtitle, String email, String username, String password) {  
	  this.id = id;  
	  this.fullname = fullname;  
	  this.jobtitle = jobtitle;  
	  this.email = email; 
	  this.username = username; 
	  this.password = password; 
	 }  
	 
	 //qa user id
	 public int getId() {  
	  return id;  
	 }  	 
	 public void setId(int id) {  
	  this.id = id;  
	 }  
	 
	 //qa user full name
	 public String getFullname() {  
	  return fullname;  
	 } 	 
	 public void setFullname(String fullname) {  
	  this.fullname = fullname;  
	 }  

	 //qa user job title
	 public String getJobtitle() {  
		  return jobtitle;  
	 } 	 
	 public void setJobtitle(String jobtitle) {  
		  this.jobtitle = jobtitle;  
	 } 	
	 
	 //qa user email (getter setter)
	 public String getEmail() {  
		  return email;  
	 } 	 
	 public void setEmail(String email) {  
		  this.email = email;  
	 } 	
	 
	//qa user user name (getter setter)
	 public String getUsername() {  
		  return username;  
	 } 	 
	 public void setUsername(String username) {  
		  this.username = username;  
	 } 
	 
	//qa user password (getter setter)
	 public String getPassword() {  
		  return password;  
	 } 		 
	 public void setPassword(String password) {  
		  this.password = password;  
	 } 		 
	 
	 @OneToMany(mappedBy = "qauser", cascade = CascadeType.ALL)
     public Set<Testcase> getTestcases() {
		return testcases;
 	 }
	 public void setTestcases(Set<Testcase> testcases) {
		this.testcases = testcases;
	 }
}
