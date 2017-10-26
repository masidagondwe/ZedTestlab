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
@Table(name="testreport")
public class Testreport {

	 @Id  
	 @Column(name="report_id")
	 @GeneratedValue(strategy=GenerationType.IDENTITY)  
	 int id;  
	   
	 @Column(name="name")  
	 String name; 
	 
	 @Column(name="repot_date") 
	 @DateTimeFormat(pattern = "yyyy-mm-dd")
	 Date reportdate;
	 
	 @Column(name="report")  
	 String report; 
	 
	 Testcase testcase;
	 
		public Testreport() {

		}

		public Testreport(int id,String name,Date reportdate,String report,Testcase testcase) {
			this.id = id;
			this.name = name;
			this.reportdate = reportdate;
			this.report = report;
			this.testcase = testcase;
		}
		
		 //
		 public int getId() {  
		  return id;  
		 }  	 
		 public void setId(int id) {  
		  this.id = id;  
		 }  
		 
		 //
		 public String getName() {  
		  return name;  
		 } 	 
		 public void setName(String name) {  
		  this.name = name;  
		 }
		 
		 //
		 public Date getReportdate() {  
		  return reportdate;  
		 } 	 
		 public void setReportdate(Date reportdate) {  
		  this.reportdate = reportdate;  
		 }

		 //
		 public String getReport() {  
		  return report;  
		 } 	 
		 public void setReport(String report) {  
		  this.report = report;  
		 }	
		 
		 //feature project
		 @ManyToOne
		 @JoinColumn(name = "caseID")
		 public Testcase getTestcase() {  
		  return testcase;  
		 } 	 
		 public void setTestcase(Testcase testcase) {  
		  this.testcase = testcase;  
		 }
}
