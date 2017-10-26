/**
 * 
 */
package com.zedlab.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Temwani
 *
 */
@Entity  
@Table(name="feature")
public class Feature {

	 @Id  
	 @Column(name="feature_id")  
	 @GeneratedValue(strategy=GenerationType.IDENTITY)  
	 int id;  
	   
	 @Column(name="name")  
	 String name;   
	     
	 @Column(name="function")  
	 String function;
	 
	 @Column(name="type")  
	 String type;
	 
	 @ManyToOne
     @JoinColumn(name="project_id")
	 Project project;
	 
	 @OneToMany
	 private Set<Testcase> testcases;
	 
	public Feature() {
		
	}
	
	public Feature(int id, String name,String function,String type, Project project) {
		this.id = id;
		this.name = name;
		this.function = function;
		this.type = type;
		this.project = project;		
	}

	 //feature id
	 public int getId() {  
	  return id;  
	 }  	 
	 public void setId(int id) {  
	  this.id = id;  
	 }  
	 
	 //feature name
	 public String getName() {  
	  return name;  
	 } 	 
	 public void setName(String name) {  
	  this.name = name;  
	 }

	 //feature function
	 public String getFunction() {  
	  return function;  
	 } 	 
	 public void setFunction(String function) {  
	  this.function = function;  
	 }
	 
	 //feature type
	 public String getType() {  
	  return type;  
	 } 	 
	 public void setType(String type) {  
	  this.type = type;  
	 }	 
 
	 //feature project
	 @ManyToOne
	 @JoinColumn(name = "project_id")
	 public Project getProject() {  
	  return project;  
	 } 	 
	 public void setProject(Project project) {  
	  this.project = project;  
	 }
	 
	 //feature test cases
	 @OneToMany(mappedBy = "feature", cascade = CascadeType.ALL)
     public Set<Testcase> getTestcases() {
		return testcases;
 	 }
	 public void setTestcases(Set<Testcase> testcases) {
		this.testcases = testcases;
	 }	
}
