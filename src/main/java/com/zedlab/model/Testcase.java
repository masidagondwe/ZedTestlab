package com.zedlab.model;

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
  

@Entity  
@Table(name="testcase")
public class Testcase {
	 @Id  
	 @Column(name="testcase_id")
	 @GeneratedValue(strategy=GenerationType.IDENTITY)  
	 int id;  
	   
	 @Column(name="name")  
	 String name; 
	 
	 @Column(name="objective") 
	 String objective;

	 @Column(name="priorityLevel") 
	 String prioritylevel;
	 
	 @Column(name="expectedResult") 
	 String expectedresult;
	 
	 @Column(name="obtainedResult") 
	 String obtainedresult;
	 
	 @Column(name="state") 
	 String state;	 
	 
	 @OneToMany
	 private Set<Testreport> reports;
	 
	 @OneToMany
	 private Set<Projectversion> versions;
	 
	 Project project;
	 
	 QAUser qauser;

     Feature feature;
	 
		public Testcase() {

		}

		public Testcase(int id,String name,String objective,String prioritylevel,String expectedresult,String obtainedresult,Project project,QAUser user) {
			this.id = id;
			this.name = name;
			this.objective = objective;
			this.prioritylevel = prioritylevel;
			this.expectedresult = expectedresult;
			this.obtainedresult = obtainedresult;
			this.project = project;
			this.qauser = user;
		}
		
		 //testcase id
		 public int getId() {  
		  return id;  
		 }  	 
		 public void setId(int id) {  
		  this.id = id;  
		 }  
		 
		 //testcase name
		 public String getName() {  
		  return name;  
		 } 	 
		 public void setName(String name) {  
		  this.name = name;  
		 }
		 
		 //test case objective
		 public String getObjective() {  
		  return objective;  
		 } 	 
		 public void setObjective(String objective) {  
		  this.objective = objective;  
		 }

		 //test case priority level
		 public String getPrioritylevel() {  
		  return prioritylevel;  
		 } 	 
		 public void setPrioritylevel(String prioritylevel) {  
		  this.prioritylevel = prioritylevel;  
		 }
		 
		 //test case expected result
		 public String getExpectedresult() {  
		  return expectedresult;  
		 } 	 
		 public void setExpectedresult(String expectedresult) {  
		  this.expectedresult = expectedresult;  
		 }
		 
		 //test case obtained result
		 public String getObtainedresult() {  
		  return obtainedresult;  
		 } 	 
		 public void setObtainedresult(String obtainedresult) {  
		  this.obtainedresult = obtainedresult;  
		 }
		 
		 //test case state of testcase
		 public String getState() {  
		  return state;  
		 } 	 
		 public void setState(String state) {  
		  this.state = state;  
		 }
		 
		 //-----------------------------------------  -----------------------------------------------------------
		 @OneToMany(mappedBy = "testcase", cascade = CascadeType.ALL)
	     public Set<Testreport> getReports() {
			return reports;
	 	 }
		 public void setReports(Set<Testreport> reports) {
			this.reports = reports;
		 }
		 
		 @OneToMany(mappedBy = "testcase", cascade = CascadeType.ALL)
	     public Set<Projectversion> getVersions() {
			return versions;
	 	 }
		 public void setVersions(Set<Projectversion> versions) {
			this.versions = versions;
		 }

		 //------------------------------------------  ------------------------------------------------------------
		 //project that the test case belongs to
		 @ManyToOne
		 @JoinColumn(name = "projectID")
		 public Project getProject() {  
		  return project;  
		 } 	 
		 public void setProject(Project project) {  
		  this.project = project;  
		 }
		 
		 //qa user who created it the test case
		 @ManyToOne
		 @JoinColumn(name = "qauserID")
		 public QAUser getQauser() {  
		  return qauser;  
		 } 	 
		 public void setQauser(QAUser user) {  
		  this.qauser = user;  
		 }	
		 
		 //the feature being tested in the test case
		 @ManyToOne
		 @JoinColumn(name = "feature_id")
		 public Feature getFeature() {  
		  return feature;  
		 } 	 
		 public void setFeature(Feature feature) {  
		  this.feature = feature;  
		 }	
}
