package com.zedlab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zedlab.model.Feature;
import com.zedlab.model.Project;
import com.zedlab.model.Projectversion;
import com.zedlab.model.QAUser;
import com.zedlab.model.Testcase;
import com.zedlab.model.Testreport;
import com.zedlab.service.FeatureService;
import com.zedlab.service.ProjectService;
import com.zedlab.service.ProjectversionService;
import com.zedlab.service.QAUserService;
import com.zedlab.service.TestcaseService;
import com.zedlab.service.TestreportService;  
  
@org.springframework.stereotype.Controller 
public class Controller {
	    @Autowired  
	    QAUserService userService; 
	   
	    @Autowired  
	    ProjectService projectService; 
	    
	    @Autowired  
	    FeatureService featureService; 
	    
	    @Autowired  
		TestcaseService testcaseService;  
		   
		@Autowired  
		ProjectversionService versionService; 
		    
		@Autowired  
		TestreportService reportService; 

		
		//-----------------------------------------Contact page ------------------------------------------------------------------------------//
	    @RequestMapping(value =  "/contact" , method = RequestMethod.GET)
	    public String showContactPage(HttpServletRequest request,ModelMap model) {
	        
	        return "contact"; 
	    }  
		    
	    //-----------------------------------------QA User ------------------------------------------------------------------------------//       

	    @RequestMapping(value ={ "/login" },method = RequestMethod.GET)  
	    public ModelAndView showLogin() 
	    {
	        ModelAndView mav = new ModelAndView("userLogin");
	        mav.addObject("user", new QAUser());
	        return mav;
	    }

	    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	    public String excuteLogin(HttpServletRequest request, HttpServletResponse response,
	    								@ModelAttribute("user") QAUser user, ModelMap model) 
	    {      
	       String result = "";
	    	try
	          {
	              boolean isValidUser = userService.isValidUser(user.getUsername(), user.getPassword());
	              if(isValidUser)
	              {
	                  request.setAttribute("loggedInUser", user.getUsername());
	                  request.setAttribute("userEmail", user.getEmail());
	                  result = "redirect:/profile";
	                 // model = new ModelAndView("userProfile");
	              }
	              else
	              {
	            	 // model = new ModelAndView("userLogin");
	                  model.addAttribute("user", user);
	            	  request.setAttribute("message", "Invalid credentials!!");	 
	            	  result = "redirect:/login";
	                                  
	              }
	          }
	          catch(Exception e)
	          {
	              e.printStackTrace();
	          }

		      return result;		    
	    }	
	     	    
	    @RequestMapping(value = { "/register" }, method = RequestMethod.GET)  
	    public ModelAndView registerUser(@ModelAttribute("user") QAUser user,BindingResult result) {    
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("user", new QAUser());	
	    	
	        return new ModelAndView("userRegistration", model); 
	    }  
	    
	    @RequestMapping(value = { "/registered" }, method = RequestMethod.POST)  
	    public String executeRegister(@ModelAttribute("user") QAUser user,BindingResult result)
	    {    
	    	userService.registerUser(user);
	          
	        return "redirect:/login";  
	    }
	    
	    @RequestMapping(value = "/profile", method = RequestMethod.GET)  
	    public String viewProfile(ModelMap model) {  
	        List<Testcase> listOfTestcases = testcaseService.findAllTestcases();  
	        model.addAttribute("testcase", new Testcase());  
	        model.addAttribute("listOfTestcases", listOfTestcases);
	        
	        return "userProfile";  
	    }
	    
	    //log out of website
	    @RequestMapping(value = "/logout", method = RequestMethod.GET)  
	    public ModelAndView showLogout() {  
	        	
	    	ModelAndView mav = new ModelAndView("index");
	    	
	        return mav;  
	    }
	    
	    @RequestMapping(value = { "/updateUser/{id}" }, method = RequestMethod.GET)
	    public String editUser(@PathVariable("id") int id, ModelMap model) {
	        QAUser user = userService.getUser(id);
	        model.addAttribute("user", user);
	        //model.addAttribute("edit", true);
	        model.addAttribute("listOfUsers", this.userService.getAllUsers());
	        return "redirect:/profile";
	    }
	    	  
	    @RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET, headers = "Accept=application/json")  
	    public String deleteUser(@PathVariable("id") int id) {  
	        userService.deleteUser(id);  
	         return "redirect:/";  
	  
	    }

	    //---------------------------------------- Projects -----------------------------------------------------------------------------//	    

	    @RequestMapping(value =  "/projects" , method = RequestMethod.GET)
	    public String listProjects(HttpServletRequest request,ModelMap model) {
	 
	        List<Project> listOfProjects = projectService.findAllProjects(); 
	        List<Testcase> listOfTestcases = testcaseService.findAllTestcases(); 
	        model.addAttribute("project", new Project());  
	        model.addAttribute("listOfProjects", listOfProjects); 
	        model.addAttribute("Testcases", listOfTestcases);
	        
	        return "projectList"; 
	    }    

	    
		@RequestMapping(value =  "/line" , method = RequestMethod.GET)
	    public String projectsLineChart(HttpServletRequest request,ModelMap model) {
	 
	        List<Project> Projects = projectService.findAllProjects(); 
	       // model.addAttribute("Projects", Projects); 
	   	     			
	        int failed = 0;
	        int passed = 0;
	        int noCases = 0;
	        JsonArrayBuilder myData = Json.createArrayBuilder();
	        
	        for(Project project:Projects)
	        {
	        	JsonObjectBuilder objDataBuilder = Json.createObjectBuilder();
	        	List<Testcase> listOfTestcases = testcaseService.findByProjectId(project.getId());
	        	if(listOfTestcases.size() != 0)
	        	{	
	        		for(int i = 0; i < listOfTestcases.size(); i++)
			        {
			        	String temp = listOfTestcases.get(i).getState();
		        		if(temp.equals("failed"))
		        		{
		        			failed += 1;	
		        		}
		        		if(temp.equals("passed"))
		        		{
		        			passed += 1;	
		        		}
			        }
	        	}else
	        	{
	        		noCases += 1;
	        	}
	        	
	        	JsonObject objDataJson = objDataBuilder.add("date",project.getDatelaunched().toString())
	        	.add("Passed test cases",Integer.toString(passed))
	        	.add("Failed test cases",Integer.toString(failed))
	        	.add("No test cases",Integer.toString(noCases))
	        	.build();
	        	
	        	myData.add(objDataJson);
	        	
	        	
	        }
				
			System.out.print(myData.build());
	        
	        request.setAttribute("myData", myData.build());
	        
	        return "json"; 
	    }    

	    @SuppressWarnings("unchecked")
		@RequestMapping(value =  "/pie" , method = RequestMethod.GET)
	    public String projectsPieChart(HttpServletRequest request,ModelMap model) {
	 
	        List<Project> listOfProjects = projectService.findAllProjects(); 
	        List<Testcase> testcases = testcaseService.findAllTestcases();
	        model.addAttribute("project", new Project());  
	        model.addAttribute("listOfProjects", listOfProjects); 
	        model.addAttribute("Testcases", testcases); 
	        
	        int failed = 0;
	        int passed = 0;
	        int noCases = 0;
	        for(Project project:listOfProjects)
	        {
	        	List<Testcase> listOfTestcases = testcaseService.findByProjectId(project.getId());
	        	if(listOfTestcases.size() != 0)
	        	{	
	        		for(int i = 0; i < listOfTestcases.size(); i++)
			        {
			        	String temp = listOfTestcases.get(i).getState();
		        		if(temp.equals("failed"))
		        		{
		        			failed += 1;	
		        		}
		        		if(temp.equals("passed"))
		        		{
		        			passed += 1;	
		        		}
			        }
	        	}else
	        	{
	        		noCases += 1;
	        	}
	        }
	         int sum = passed + failed + noCases;
	         double _passed = (passed*100)/sum;
	         double _failed = (failed*100)/sum;
	         double _noCases = (noCases*100)/sum;
	        	        
	        JSONObject objP = new JSONObject();
	        objP.put("label", "Projects with passed test cases(n=336)");
	        objP.put("value",_passed);
	        
	        JSONObject objF = new JSONObject();
	        objF.put("label", "Projects with failed test cases(n=56)");
	        objF.put("value",_failed);
	        
	        JSONObject objN = new JSONObject();
	        objN.put("label", "Projects with no test cases(n=34)");
	        objN.put("value",_noCases);

	        System.out.println(objP);
	        System.out.println(objF);
	        System.out.println(objN);
	        
	        request.setAttribute("passed", objP);
	        request.setAttribute("failed", objF);
	        request.setAttribute("noCases", objN);
	        
	        return "projectsPie"; 
	    }    

		@RequestMapping(value = { "/", "/graph" }, method = RequestMethod.GET, headers = "Accept=application/json")
		public ModelAndView projectsGraphChart(HttpServletRequest request, HttpServletResponse response) 
	    {
	    	ModelAndView model= null;

	    	//list of project to be in the json project array
			List<Project> projects = projectService.findAllProjects(); 
	    	
	    	// start building a JSON tree.
			JsonObjectBuilder rootBuilder = Json.createObjectBuilder();
			
			//json array to keep projects in
			JsonArrayBuilder projectsArrayBuilder = Json.createArrayBuilder();
			//json array to keep features of the project in
			JsonArrayBuilder feauresArrayBuilder = Json.createArrayBuilder();
			//json array to keep test cases of each feature in
			JsonArrayBuilder testcasesArrayBuilder = Json.createArrayBuilder();
			//json array to keep reports of each test case in
			JsonArrayBuilder reportsArrayBuilder = Json.createArrayBuilder();
			//json array to keep project versions of each test case in
			JsonArrayBuilder versionsArrayBuilder = Json.createArrayBuilder();
			
			for (Project project : projects) 
			{				
				// create a JSON object for each project.  The projects will have the same names, but different values.
				JsonObjectBuilder projectBuilder = Json.createObjectBuilder();
				
				//getting a list of features for each project
				/*
				 * project
				 *    |
				 *    |
				 *    feature
				 */
				List<Feature> features = featureService.findByProjectId(project.getId());
				for (Feature feature : features)
				{
					// create a JSON object for each feature.  The features will have the same names, but different values.
					JsonObjectBuilder featureBuilder = Json.createObjectBuilder();					
					
					//getting a list of test cases for each feature
					/*
					 * feature 
					 *    |
					 *    |
					 *    test case
					 */
					List<Testcase> testcases = testcaseService.findByFeatureId(feature.getId());
					for (Testcase testcase : testcases)
					{
						// create a JSON object for each testcase.  The testcases will have the same names, but different values.
						JsonObjectBuilder testcaseBuilder = Json.createObjectBuilder();
						
						//getting a list of test reporta and project versions for each test case
						/*
						 * test case 
						 *    |
						 *    |----test report
						 *    |----project version
						 */
						List<Testreport> reports = reportService.findByTestcaseId(testcase.getId());
						List<Projectversion> versions = versionService.findByTestcaseId(testcase.getId());
						
						for (Testreport report : reports)
						{
							// create a JSON object for each report.  The reports will have the same names, but different values.
							JsonObjectBuilder reportBuilder = Json.createObjectBuilder();							
							JsonObject reportJson = reportBuilder.add("name", report.getName() != null ? report.getName() : "")
									.add("report", report.getReport()!= null ? report.getReport() : "")
									.build();							
							reportsArrayBuilder.add(reportJson);
						}
						
						for (Projectversion version : versions)
						{
							// create a JSON object for each version.  The versions will have the same names, but different values.
							JsonObjectBuilder versionBuilder = Json.createObjectBuilder();							
							JsonObject versionJson = versionBuilder.add("name", version.getName() != null ? version.getName() : "")
									.build();							
							versionsArrayBuilder.add(versionJson);
						}
						
						String rvName = "Test reports and project versions";
						//add reports and versions to Test cases hierachy
						JsonObject testcaseJson = testcaseBuilder.add("name",rvName)
								.add("name", testcase.getName() != null ? testcase.getName() : "")
								.add("objective", testcase.getObjective() != null ? testcase.getObjective()  : "")
								.add("priority level", testcase.getPrioritylevel() != null ? testcase.getPrioritylevel() : "")
								.add("expected result", testcase.getExpectedresult() != null ? testcase.getExpectedresult(): "")
								.add("obtained result", testcase.getObtainedresult() != null ? testcase.getObtainedresult() : "")
								.add("children", reportsArrayBuilder)
								.add("children", versionsArrayBuilder)
								.build();
						
						testcasesArrayBuilder.add(testcaseJson);
					}
					
					String tName = "Test cases";
					//add to features hierachy
					JsonObject featureJson = featureBuilder.add("name",tName)
							.add("name", feature.getName() != null ? feature.getName() : "")
							.add("function", feature.getFunction() != null ? feature.getFunction()  : "")
							.add("type", feature.getType() != null ? feature.getType() : "")
							.add("children", testcasesArrayBuilder)
							.build();
					
					feauresArrayBuilder.add(featureJson);
				 }
				String fName = "Features";
				JsonObject projectJson = projectBuilder.add("name",fName)
						.add("name", project.getName() != null ? project.getName() : "")
				//.add("Date created", (JsonValue) (project.getDatelaunched() != null ? project.getDatelaunched() : ""))
				.add("children", feauresArrayBuilder)
				.build();
				
				// add the project to our array of projects.
				projectsArrayBuilder.add(projectJson);
			}
			
			// add the array of plants to a root JSON object.
			String myName = "Projects";
			//JsonObjectBuilder mrootBuilder = Json.createObjectBuilder();
			JsonObject root = rootBuilder.add("name",myName)
					//.add(arg0, arg1)
					.add("children", projectsArrayBuilder)
					.build();
			
			System.out.print(root);
			
			/*
			 * INFO list			
			 */
			List<Project> listOfProjects = projectService.findAllProjects(); 
			request.setAttribute("noProjects", listOfProjects.size());
			
			List<Feature> listOfFeatures = featureService.getAllFeatures();
			request.setAttribute("noFeatures", listOfFeatures.size());
			
			List<Testcase> listOfTestcases = testcaseService.findAllTestcases();
			request.setAttribute("noTestcases", listOfTestcases.size());
			
			int failed = 0;
	        for(Project project:listOfProjects)
	        {
	        	List<Testcase> Testcases = testcaseService.findByProjectId(project.getId());
	        	if(Testcases.size() != 0)
	        	{	
	        		for(int i = 0; i < Testcases.size(); i++)
			        {
			        	String temp = Testcases.get(i).getState();
		        		if(temp.equals("failed"))
		        			failed += 1;	
			        }
	        	}
	        }
			request.setAttribute("noFailed", failed);
			
			int noSuccess = listOfTestcases.size() - failed;
			
			request.setAttribute("noSuccess", noSuccess);
			request.setAttribute("jsonFile", root);
			
			model = new ModelAndView("projectsGraph");
	        return model;
	    }
    	    
	    @RequestMapping(value = "/viewProject/{id}", method = RequestMethod.GET)  
		public String viewProject(@ModelAttribute("project") Project formProject,ModelMap model) {  	
	      
	    	//projects for the drop down list
			List<Project> listOfProjects = projectService.findAllProjects(); 
	        model.addAttribute("project", new Project());  
	        model.addAttribute("listOfProjects", listOfProjects);
	    	
	    	//features in the table display	        
			List<Feature> listOfFeatures = featureService.findByProjectId(formProject.getId());  
	        model.addAttribute("feature", new Feature());  
	        model.addAttribute("listOfFeatures", listOfFeatures);	        
	        
	        //test cases belonging to a feature with id = feat_id
	        List<Testcase> listOfTestcases = testcaseService.findByProjectId(formProject.getId());
	        model.addAttribute("testcase", new Testcase());  
	        model.addAttribute("listOfTestcases", listOfTestcases);
	        
	        return "projectDetails"; 
	    }	
	
	    @RequestMapping(value = "/viewTable/{id}", method = RequestMethod.POST)  
		public String viewSelectedProject(@ModelAttribute("myProject") Project formProject,ModelMap model) {  	
	      
	    	//projects for the drop down list
			List<Project> listOfProjects = projectService.findAllProjects(); 
	        model.addAttribute("project", new Project());  
	        model.addAttribute("listOfProjects", listOfProjects);
	    	
	    	//features in the table display	        
			List<Feature> listOfFeatures = featureService.findByProjectId(formProject.getId());  
	        model.addAttribute("feature", new Feature());  
	        model.addAttribute("listOfFeatures", listOfFeatures);	        
	        
	        //test cases belonging to a feature with id = feat_id
	        List<Testcase> listOfTestcases = testcaseService.findByProjectId(formProject.getId());
	        model.addAttribute("testcase", new Testcase());  
	        model.addAttribute("listOfTestcases", listOfTestcases);
	        
	        return "projectDetails"; 
	    }    
	  
	    @RequestMapping(value = "/Project", method = RequestMethod.GET)  
	    public ModelAndView addProject(@ModelAttribute("project") Project project,BindingResult result) {    
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("project", new Project());	    	
	    	//model.put("projectList", projectService.findAllProjects());
	    	
	        return new ModelAndView("newProject", model);
	    }

	    @RequestMapping(value = "/addProject", method = RequestMethod.POST)  
	    public String executeAddProject(@ModelAttribute("project") Project project,BindingResult result) {    
	    	projectService.addProject(project);
	    	  	          
	        return "redirect:/projects";  
	    } 
	    
	    @RequestMapping(value = { "/editProject/{id}" }, method = RequestMethod.GET)
	    public ModelAndView editProject(@PathVariable("id") int id,@ModelAttribute("project") Project project,BindingResult result) {
	    	Project p = projectService.findById(id);
	    	
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("project", p);
	    	
	        return new ModelAndView("editProject", model);
	    }	    
		    
	    @RequestMapping(value = "/editProject/save", method = RequestMethod.POST)  
	    public String executeEditProject(@ModelAttribute("project") Project project,BindingResult result) {    
	    	projectService.editProject(project);
	    	  	          
	        return "redirect:/projects";  
	    } 
	    
	    @RequestMapping(value = "/deleteProject/{id}", method = RequestMethod.GET)  
	    public String deleteProject(@PathVariable("id") int id) { 
	    	Project project = projectService.findById(id);
	    	projectService.deleteProject(project);
	    	
	        return "redirect:/projects";  
	  
	    }
	    
	    //---------------------------------------- Features --------------------------------------------------------------
	  
	    @RequestMapping(value = { "/Feature" }, method = RequestMethod.GET)  
	    public ModelAndView addFeature(@ModelAttribute("feature") Feature feature,BindingResult result) {  
	    	
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("feature", new Feature());	    	
	    	model.put("projectList", projectService.findAllProjects());
	    	
	        return new ModelAndView("newFeature", model);
	    }
	    
	    @RequestMapping(value = "/addFeature", method = RequestMethod.POST)  
	    public String executeAddFeature(@ModelAttribute("feature") Feature feature,BindingResult result) {    
	    	featureService.addFeature(feature);
	    	  	          
	        return "redirect:/projects";  
	    }  
	  	    
	    @RequestMapping(value = { "/updateFeature/{id}" }, method = RequestMethod.GET)
	    public String editFeature(@PathVariable("id") int id, ModelMap model) {
	        Feature feature = featureService.getByFeature_ID(id);
	        model.addAttribute("feature", feature);
	        //model.addAttribute("edit", true);
	        model.addAttribute("listOfFeatures", this.featureService.getAllFeatures());
	        return "features";
	    }
	    	  
	    @RequestMapping(value = "/delFeature/{id}", method = RequestMethod.GET, headers = "Accept=application/json")  
	    public String deleteFeature(@PathVariable("id") int id) {  
	    	featureService.delete(id); 
	         return "redirect:/featuresl";  
	  
	    }

	   
	   //---------------------------------------- Test cases ---------------------------------------------------------------------//
	    @RequestMapping(value = { "/testcases" }, method = RequestMethod.GET)
	    public String listTestcases(@ModelAttribute("myTestcase") Testcase testcase,ModelMap model) {
	 
	        List<Testcase> listOfTestcases = testcaseService.findAllTestcases();  
	        model.addAttribute("testcase", new Testcase());  
	        model.addAttribute("listOfTestcases", listOfTestcases); 
	        
	        List<QAUser> listOfUsers = userService.getAllUsers();  
	        model.addAttribute("qauser", new QAUser());  
	        model.addAttribute("listOfUsers", listOfUsers);
	        
	        return "testcaseList"; 
	    } 
	    
	    @ModelAttribute("stateList")
	    public Map<String, String> getStateList()
	    {
		    Map<String, String> stateList = new HashMap<String, String>();
	        stateList.put("passed", "passed");
	        stateList.put("failed", "failed");
	       
	       return stateList;
	    }
	    
	    @RequestMapping(value = "/Testcase", method = RequestMethod.GET)  
	    public ModelAndView addTestcase(@ModelAttribute("testcase") Testcase testcase,BindingResult result) {    
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("testcase", new Testcase());	    	
	    	model.put("userList", userService.getAllUsers());
	    	model.put("projectList", projectService.findAllProjects());
	    	model.put("featureList", featureService.getAllFeatures());
	    	
	        return new ModelAndView("newTestcase", model);
	    }
	
	    @RequestMapping(value = "/addTestcase", method = RequestMethod.POST)  
	    public String executeAddTestcase(@ModelAttribute("testcase") Testcase testcase,BindingResult result) {    
	    	testcaseService.addTestcase(testcase);
	    	  	          
	        return "redirect:/projects";  
	    } 
	    
	    @RequestMapping(value ={"viewTestcase", "/viewTestcase/{id}"}, method = RequestMethod.GET)  
		public String viewTestcase(@ModelAttribute("myTestcase") Testcase formTestcase,ModelMap model) {  	
	             	        
	        //test cases belonging to a feature with id = feat_id
	        List<Testcase> listOfTestcases = testcaseService.findAllTestcases();
	        model.addAttribute("testcase", new Testcase());  
	        model.addAttribute("listOfTestcases", listOfTestcases);
         
	        //reports and project versions belonging to test case with id - test_id 
			List<Testreport> listOfReports = reportService.findByTestcaseId(formTestcase.getId()); 
	        model.addAttribute("report", new Testreport());  
	        model.addAttribute("listOfReports", listOfReports); 
	        
			List<Projectversion> listOfVersions = versionService.findByTestcaseId(formTestcase.getId());  
	        model.addAttribute("version", new Projectversion());  
	        model.addAttribute("listOfVersions", listOfVersions); 
	        
	        return "testcaseDetails"; 
	    }
	    
	    @RequestMapping(value = { "/editTestcase/{id}" }, method = RequestMethod.GET)
	    public ModelAndView editTestcase(@PathVariable("id") int id, @ModelAttribute("testcase") Testcase testcase,BindingResult result) {
	    	Testcase p = testcaseService.findById(id);
	    	
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	model.put("userList", userService.getAllUsers());
	    	model.put("projectList", projectService.findAllProjects());
	    	model.put("featureList", featureService.getAllFeatures());
	    	model.put("testcase", p);
	    	
	        return new ModelAndView("editTestcase", model);
	    }

	    @RequestMapping(value = "/editTestcase/save", method = RequestMethod.POST)  
	    public String executeEditTestcase(@ModelAttribute("testcase") Testcase testcase,BindingResult result) {    
	    	testcaseService.editTestcase(testcase);
	    	  	          
	        return "redirect:/testcases";  
	    } 
	    
	    @RequestMapping(value = "/deleteTestcase/{id}", method = RequestMethod.GET)  
	    public String deleteTestcase(@PathVariable("id") int id) { 
	    	Testcase testcase = testcaseService.findById(id);
	    	testcaseService.deleteTestcase(testcase);
	    	
	        return "redirect:/testcases";  
	  
	    }
	    
	    //---------------------------------------------- Test report ---------------------------------------------------------	    
	    @RequestMapping(value = {"/Report"}, method = RequestMethod.GET)  
	    public ModelAndView addTestreport(@ModelAttribute("testreport") Testreport testreport,BindingResult result) {  

	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("testreport", new Testreport());	    	
	    	model.put("testcaseList", testcaseService.findAllTestcases());
	    	
	        return new ModelAndView("newReport", model); 
	    }	    	    
	
	    @RequestMapping(value = { "/", "/testreportsl" }, method = RequestMethod.GET)
	    public String listTestreports(ModelMap model) {
	 
	        List<Testreport> listOfTestreports = reportService.findAllTestreports();  
	        model.addAttribute("testreport", new Testreport());  
	        model.addAttribute("listOfTestreports", listOfTestreports);  
	        return "testreports"; 
	    }    

	    @RequestMapping(value = "/addReport", method = RequestMethod.POST)  
	    public String executeAddTestreport(@ModelAttribute("testreport") Testreport testreport,BindingResult result) {    
	        if(testreport.getId()==0)  
	        {  
	        	reportService.addTestreport(testreport); 
	        }  	          
	        return "redirect:/projects";  
	    }
	    	
	    //---------------------------------------------- Project version ---------------------------------------------------------	    
	    @RequestMapping(value = { "/", "/versionsl" }, method = RequestMethod.GET)
	    public String listProjectversions(ModelMap model) {
	 
	        List<Projectversion> listOfVersions = versionService.findAllProjectversions();  
	        model.addAttribute("version", new Projectversion());  
	        model.addAttribute("listOfVersions", listOfVersions);  
	        return "versions"; 
	    }    

	    @RequestMapping(value = {"/Version"}, method = RequestMethod.GET)  
	    public ModelAndView addVersion(@ModelAttribute("version") Projectversion version,BindingResult result) {  
	    	Map<String, Object> model = new HashMap<String, Object>();
	    	
	    	model.put("version", new Projectversion());	    	
	    	model.put("testcaseList", testcaseService.findAllTestcases());
	    	
	        return new ModelAndView("newVersion", model);  
	    }
	    
	    @RequestMapping(value = "/addVersion", method = RequestMethod.POST)  
	    public String executeAddVersion(@ModelAttribute("version") Projectversion version,BindingResult result) {    
	        if(version.getId()==0)  
	        {  
	        	versionService.addProjectversion(version); 
	        }  	          
	        return "redirect:/projects";  
	    }
}
