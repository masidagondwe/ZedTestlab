/**
 * 
 */
package com.zedlab.model;

import java.util.Date;
/**
 * @author Temwani
 *
 */
import javax.persistence.Column;  
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;  
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;  

@Entity  
@Table(name="projectversion")
public class Projectversion {
	

	 @Id  
	 @Column(name="project_id")
	 @GeneratedValue(strategy=GenerationType.IDENTITY)  
	 int id;  
	   
	 @Column(name="name")  
	 String name; 
	 
	 @Column(name="date_launched") 
	 @DateTimeFormat(pattern = "yyyy-mm-dd")
	 Date datelaunched;

	 Testcase testcase;
	
	public Projectversion() {

	}

	public Projectversion(int id,String name,Date datelaunched,Testcase testcase) {
		this.id = id;
		this.name = name;
		this.datelaunched = datelaunched;
		this.testcase = testcase;
	}
	
	 //project id
	 public int getId() {  
	  return id;  
	 }  	 
	 public void setId(int id) {  
	  this.id = id;  
	 }  
	 
	 //project name
	 public String getName() {  
	  return name;  
	 } 	 
	 public void setName(String name) {  
	  this.name = name;  
	 }
	 
	 //project date launched
	 public Date getDatelaunched() {  
	  return datelaunched;  
	 } 	 
	 public void setDatelaunched(Date datelaunched) {  
	  this.datelaunched = datelaunched;  
	 }
	 
	 //feature project
	 @ManyToOne
	 @JoinColumn(name = "testcaseID")
	 public Testcase getTestcase() {  
	  return testcase;  
	 } 	 
	 public void setTestcase(Testcase testcase) {  
	  this.testcase = testcase;  
	 }

}
