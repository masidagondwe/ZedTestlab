package com.zedlab.service;

import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;

import com.zedlab.model.Project;
import com.zedlab.model.Testcase;

public class JsonHandler {
	
	public JsonObject  getJsonString(List<Project> projects, List<Testcase> testcases) 
    {
    	// start building a JSON tree.
		JsonObjectBuilder rootBuilder = Json.createObjectBuilder();
		

		//json array to keep projects in
		JsonArrayBuilder rootArrayBuilder = Json.createArrayBuilder();	
		//json array to keep projects in
		JsonArrayBuilder noTCArrayBuilder = Json.createArrayBuilder();
		//json array to keep projects in
		JsonArrayBuilder failedTCArrayBuilder = Json.createArrayBuilder();
		//json array to keep projects in
		JsonArrayBuilder passedTCArrayBuilder = Json.createArrayBuilder();		
		
		int noTestcases = 0;
		int failedTestcases = 0;
		int passedTestcases = 0;

		for (Project project : projects) 
		{	
			/*if(project.getTestcases().size() == 0)
				noTestcases += 1;*/
			
			for (Testcase testcase : testcases)
			{
				if(testcase.getProject().getId() == project.getId())
				{
					if(testcase.getState() == "failed")
						failedTestcases += 1;
					else
						passedTestcases += 1;
				}
						
			}
		}
		
		noTestcases = projects.size() - (failedTestcases+passedTestcases);
		
		// create a JSON object for projects without testcases.  The testcases will have the same names, but different values.
		JsonObjectBuilder noTestcaseBuilder = Json.createObjectBuilder();		
		//add reports and versions to Test cases hierachy
		JsonObject noTestcaseJson = noTestcaseBuilder.add("label","Projects with no test cases")
				.add("value",noTestcases)
				.build();
		
		noTCArrayBuilder.add(noTestcaseJson);
		
		// create a JSON object for projects without testcases.  The testcases will have the same names, but different values.
		JsonObjectBuilder fTestcaseBuilder = Json.createObjectBuilder();		
		//add reports and versions to Test cases hierachy
		JsonObject fTestcaseJson = fTestcaseBuilder.add("label","Projects with failed test cases")
				.add("value",failedTestcases)
				.build();
		
		failedTCArrayBuilder.add(fTestcaseJson);
		
		// create a JSON object for projects without testcases.  The testcases will have the same names, but different values.
		JsonObjectBuilder pTestcaseBuilder = Json.createObjectBuilder();		
		//add reports and versions to Test cases hierachy
		JsonObject pTestcaseJson = pTestcaseBuilder.add("label","Projects with passed test cases")
				.add("value",passedTestcases)
				.build();
		
		passedTCArrayBuilder.add(pTestcaseJson);
		
		rootArrayBuilder.add(noTCArrayBuilder).add(failedTCArrayBuilder).add(passedTCArrayBuilder).build();
		//JsonObjectBuilder mrootBuilder = Json.createObjectBuilder();
		JsonObject root = rootBuilder.add("", rootArrayBuilder)
				.build();
		
		System.out.print(root);
		
	   return root;
    }


}
