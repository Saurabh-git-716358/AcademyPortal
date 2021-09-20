package com.academy.Controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.academy.Models.Batch;
import com.academy.Models.Employee;
import com.academy.Models.Faculty;
import com.academy.Models.Modules;
import com.academy.Models.SkillList;

@Controller
public class AdminController {

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	//Checks if entity is Admin type not
	public static String checkSessionEntity(HttpServletRequest request) 
	{
		String cat = request.getSession().getAttribute("category").toString();
        System.out.println("Admin Method called");
	  if (!cat.equalsIgnoreCase("admin"))
      {		
			request.getSession().invalidate();
			return "NotOk";	 
	  }
	  return "Ok";	
     
	} 
	
	
   //Show Faculty Table	
   @GetMapping("/showFacultyRequests")	
   public String showFacultyRequests(Model model,HttpServletRequest request) {
	  
     	String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		} 

	   
	   List<Faculty> flist = new  ArrayList<Faculty>();
	   flist = hibernateTemplate.loadAll(Faculty.class);      //LoadAll Faculty
   	   model.addAttribute("Flist", flist);
	   return "AdminDashboard";
   }
   
   //Get SkillList for given Id
   @RequestMapping("/getSkills/{fid}")
   public String getSkillList(@PathVariable("fid") int fid,RedirectAttributes ra,Model model,HttpServletRequest request) {

	    String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	    
	   
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from SkillList where faculty_userid=:fid");
		q.setParameter("fid", fid);
	    List<SkillList> slist = q.list();
	    StringBuilder sb = new StringBuilder();
	    char charSeperator = '/';
	    sb.append(charSeperator);
	   for(SkillList s:slist)
		   sb.append(s.getSkillname()).append(charSeperator);
	   System.out.println(sb.toString());
	   ra.addFlashAttribute("skillStringList", sb.toString());
	   ra.addFlashAttribute("fid",fid);
	   return "redirect:/showFacultyRequests";
   }
   
   
 //Faculty Approval
   @Transactional
   @RequestMapping("/Fapprove/{fid}")
   public String Fapprove(@PathVariable("fid") int fid,RedirectAttributes ra,Model model,HttpServletRequest request) {
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   
	   System.out.println(fid);
	   Faculty faculty = hibernateTemplate.get(Faculty.class, fid); //GET H
	   System.out.println(faculty);
	   faculty.setStatus(1);
	   hibernateTemplate.update(faculty);  //UPDATE H  (Approved)
	   System.out.println(faculty);
	   
	   ra.addFlashAttribute("statusMsg", "Employee Data Approved");
	   ra.addFlashAttribute("facid", faculty.getUserid());
	   ra.addFlashAttribute("Fname", faculty.getFname()+" Approved Successfull");
	   
	   return "redirect:/showFacultyRequests";
   }
	
   
   //Faculty Rejection
   @Transactional
   @RequestMapping("/Freject/{fid}")
   public String Freject(@PathVariable("fid") int fid,RedirectAttributes ra,Model model,HttpServletRequest request) {
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   
	   System.out.println(fid);
	   Faculty faculty = hibernateTemplate.get(Faculty.class, fid); //GET H
	   System.out.println(faculty);
	   faculty.setStatus(-1);
	   hibernateTemplate.update(faculty);  //UPDATE H (Rejected)
	   System.out.println(faculty);
	   
	   ra.addFlashAttribute("StatusMsg", "Faculty Data Rejected");
	   ra.addFlashAttribute("Facid", faculty.getUserid());
	   ra.addFlashAttribute("fname", faculty.getFname()+" Rejected Successfull");
	   
	   return "redirect:/showFacultyRequests";
   }
   
   
   @RequestMapping("/ApprovedFaculty")
   public String ApprovedFaculty(Model model,HttpServletRequest request) {
	 
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from Faculty where status=:fstatus");
		q.setParameter("fstatus", 1);
		List<Faculty> flist = q.list();  //Approved Employee List
		model.addAttribute("approvedFList", flist);
	   return "AdminDashboard";
   }
   
   //******************************************************************************
   
   
   //Show Employee Table
   @RequestMapping("/showEmployeeRequests")	
   public String showEmployeeRequests(Model model,HttpServletRequest request) {
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   
	   List<Employee> list = new ArrayList<Employee>();
	   list = hibernateTemplate.loadAll(Employee.class);  //LoadAll Employee
	   model.addAttribute("Elist", list);
	   return "AdminDashboard";
   }
   
  
   //Employee Approval
   @Transactional
   @RequestMapping("/Eapprove/{eid}")
   public String Eapprove(@PathVariable("eid") int eid,RedirectAttributes ra,Model model,HttpServletRequest request) {
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   
	   System.out.println(eid);
	   Employee employee = hibernateTemplate.get(Employee.class, eid); //GET H
	   System.out.println(employee);
	   employee.setStatus(1);
	   hibernateTemplate.update(employee);  //UPDATE H  (Approved)
	   System.out.println(employee);
	   
	   ra.addFlashAttribute("statusMsg", "Employee Data Approved");
	   ra.addFlashAttribute("id", employee.getUserid());
	   ra.addFlashAttribute("Ename", employee.getFname()+" Approved Successfull");
	   
	   return "redirect:/showEmployeeRequests";
   }
	
   //status - 0(Default) While Registering
   //status - 1 (Admin Approved)
   //status - (-1) (Admin Rejected)
   
   
   //Employee Rejection
   @Transactional
   @RequestMapping("/Ereject/{eid}")
   public String Ereject(@PathVariable("eid") int eid,RedirectAttributes ra,Model model,HttpServletRequest request) {
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   
	   System.out.println(eid);
	   Employee employee = hibernateTemplate.get(Employee.class, eid); //GET H
	   System.out.println(employee);
	   employee.setStatus(-1);
	   hibernateTemplate.update(employee);  //UPDATE H (Rejected)
	   System.out.println(employee);
	   
	   ra.addFlashAttribute("StatusMsg", "Employee Data Rejected");
	   ra.addFlashAttribute("Eid", employee.getUserid());
	   ra.addFlashAttribute("ename", employee.getFname()+" Rejected Successfull");
	   
	   return "redirect:/showEmployeeRequests";
   }
	
   
   @RequestMapping("/ApprovedEmployee")
   public String ApprovedEmployee(Model model,HttpServletRequest request) {
	 
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from Employee where status=:estatus");
		q.setParameter("estatus", 1);
		List<Employee> alist = q.list();  //Approved Employee List
		model.addAttribute("approvedList", alist);
	   return "AdminDashboard";
   }

   //********************************************************************
   
   
   //Returns Module Registration Page
   @RequestMapping("/AddModule")
   public String AddModule(Model model){
	   
	   model.addAttribute("yes", 1);
	   return "ModuleRegistration";
   }
   
   
   //Returns Admin Home page from Module Registration Page
   @RequestMapping("/ReturnAdmin")
   public String ReturnAdmin() {
	   return "AdminDashboard";
   }
   
   
   //Registers (Saves) Module in Database
   @RequestMapping("/Moduleregister")
   @Transactional
   public String ModuleRegister(@ModelAttribute("module") Modules module ,Model model,HttpServletRequest request) {
      
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   module.setFid(0);
       hibernateTemplate.save(module); //Saves in database
 
       System.out.println(module);
	   model.addAttribute("message", module.getMname()+" Module Added Successfull");
	   return "ModuleRegistration";
   }
   
   //Load All Module and Display in UI
   @RequestMapping("/LinkModule")
   public String LinkModule(Model model,HttpServletRequest request) {
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   List<Modules> moduleList = hibernateTemplate.loadAll(Modules.class);
	   model.addAttribute("mlist", moduleList);
	   return "AdminDashboard";
   }
   
   
   
   //This Function takes Module (Skill Category) and findss all Faculty with same
   //skillFam then from multilple faculties the faculty with highest 
   //profieceny sum is selected for module
   
   @RequestMapping("/findFaculty/{mid}")
   public String findFaculty(@PathVariable("mid") int mid,RedirectAttributes ra,Model model,HttpServletRequest request) {
	
	   
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   
	   Modules modules = hibernateTemplate.get(Modules.class,mid);
	   String skillFamily = modules.getSkillFamily();
	 
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from Faculty where status=:fstatus and skillFamily=:fskill");
		q.setParameter("fstatus", 1);
		q.setParameter("fskill", skillFamily);
	   
		int res,max=0;
		Faculty ftemp = null;
		List<Faculty> list = q.list();
		if(list.size()==0)
		{
			ra.addFlashAttribute("FList", -1);
			return "redirect:/LinkModule";
		}
		System.out.println(list.size());
		for(Faculty f:list)
		{
			res=0;
			String proficiency = f.getProficiency();
			String[] split = proficiency.split(",");
			for(int i=0;i<split.length;i++)
			{
				res = res + Integer.parseInt(split[i]);
			}
			
			if(res>max)
				{
				max=res;
				ftemp = f;
				System.out.println(ftemp);
				}
			
		}
		System.out.println(ftemp.getFname());
		
		
		ra.addFlashAttribute("Ffid", ftemp.getUserid());
		ra.addFlashAttribute("name", ftemp.getFname());
		ra.addFlashAttribute("mid", mid);
		
		
	   return "redirect:/LinkModule";
   }
   
   
   
   
   //This Function Takes mid and fid and links each other
   @Transactional
   @RequestMapping("LinkFaculty/{fid}/{mid}")
   public String LinkFaculty(@PathVariable("fid") int fid,@PathVariable("mid") int mid,RedirectAttributes ra,Model model, HttpServletRequest request)
   {
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   Modules modules = hibernateTemplate.get(Modules.class,mid);
	   modules.setFid(fid);
	   hibernateTemplate.update(modules);  //UPDATE M to Faculty (Rejected)
	  
	   ra.addFlashAttribute("Mid","Modules MID = "+modules.getMid());
	   ra.addFlashAttribute("Fid", "Got Link to Faculty with FID = "+modules.getFid());
	   ra.addFlashAttribute("moduleMsg", "Waiting For Facultys Approval");
	   return "redirect:/LinkModule";
   }
   
   
   //This Function shows all Approved and Rejected Modules passed through Faculty
   @RequestMapping("/showFacModules")
   public String showModules(Model model,HttpServletRequest request)
   {
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   List<Modules> moduleList = hibernateTemplate.loadAll(Modules.class);
	   model.addAttribute("mList", moduleList);
	   return "AdminDashboard";
   }
   
   //This redirects to Batch Register Page
   @RequestMapping("/RegisterBatch/{mid}")
   public String showBatchRegisterPage(@PathVariable("mid") int mid,RedirectAttributes ra,Model model,HttpServletRequest request)
   {
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
	   Modules modules = hibernateTemplate.get(Modules.class, mid);   
	   Batch b = hibernateTemplate.get(Batch.class, mid); 
	   
	   if(b!=null)  //If batch is present with id or not
	   ra.addFlashAttribute("register",0);
	   else
		   ra.addFlashAttribute("register",1);	
	   
	   ra.addFlashAttribute("rmid",modules.getMid());
	   ra.addFlashAttribute("currentModule", modules);
	   return "redirect:/showFacModules";
   }
   
   //Registers (Saves) Batch in Database
   @RequestMapping("/addBatch")
   @Transactional
   public String SaveBatch(@ModelAttribute("batch") Batch batch ,Model model,HttpServletRequest request) {
      
	   String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Faculty/Employee cannot access Admin dashboard! You have been logged out.");
			return "LoginPage";
		}
	   
       hibernateTemplate.save(batch); //Saves in database
 
       System.out.println(batch);
	   model.addAttribute("BatchMessage", batch.getClassRoomName()+" Batch Generated Successfull");
	   return "BatchRegisteration";
   }
   
}
