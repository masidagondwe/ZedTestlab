/**
 * 
 */
package com.zedlab.model;

import java.util.Date;
//import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
/**
 * @author Temwani
 *
 */
import javax.persistence.Column;  
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;  
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;  

@Entity  
@Table(name="project")
public class Project {

	 @Id  
	 @Column(name="project_id")
	 @GeneratedValue(strategy=GenerationType.IDENTITY)  
	 int id;  
	   
	 @Column(name="name")  
	 String name; 
	 
	 @Column(name="date_launched") 
	 @DateTimeFormat(pattern = "yyyy-mm-dd")
	 Date datelaunched;
	 
	 @OneToMany
	 private Set<Feature> features;

	 @OneToMany
	 private Set<Testcase> testcases;
	 
	public Project() {

	}

	public Project(int id,String name,Date datelaunched) {
		this.id = id;
		this.name = name;
		this.datelaunched = datelaunched;
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
	 
	 @OneToMany(mappedBy = "project", cascade = CascadeType.ALL)
     public Set<Feature> getFeatures() {
		return features;
 	 }
	 public void setFeatures(Set<Feature> features) {
		this.features = features;
	 }
	 
	 @OneToMany(mappedBy = "project", cascade = CascadeType.ALL)
     public Set<Testcase> getTestcases() {
		return testcases;
 	 }
	 public void setTestcases(Set<Testcase> testcases) {
		this.testcases = testcases;
	 }	 
}
