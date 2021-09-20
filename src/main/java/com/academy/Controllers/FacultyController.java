package com.academy.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.academy.Models.Batch;
import com.academy.Models.Login;
import com.academy.Models.Modules;

@Controller
public class FacultyController {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	
	//Checks if entity is Faculty type not
	public static String checkSessionEntity(HttpServletRequest request) 
	{
		
		String cat = request.getSession().getAttribute("category").toString();
        System.out.println("Faculty Method called");
	  if (!cat.equalsIgnoreCase("Faculty"))
      {		
			request.getSession().invalidate();
			return "NotOk";	 
	  }
	  return "Ok";	
     
	} 
	
	
	
	//To send ModuleList
    @GetMapping("/showModules")
	public String ShowModules(Model model, HttpServletRequest request)
	{
    
		String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Employee cannot access Faculty dashboard! You have been logged out.");
			return "LoginPage";
		}
		
    	//fid assigned based on session value
        int fid = (int) request.getSession().getAttribute("userid");
        		
  
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from Modules where fid=:fid");
		q.setParameter("fid", fid);
		
	    List<Modules> mlist = q.list();
		model.addAttribute("ModuleList", mlist);
		return "FacultyDashboard";
	}
   
    
    //To send Batches Assigned
    @GetMapping("/showBatch")
   	public String ShowBatch(Model model, HttpServletRequest request)
   	{
    	
    	String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Employee cannot access Faculty dashboard! You have been logged out.");
			return "LoginPage";
		}
		
    	
		//fid assigned based on session value
        int fid = (int) request.getSession().getAttribute("userid");
        
   		Query q = hibernateTemplate.getSessionFactory().openSession()
   				.createQuery("from Batch where userid=:fid");
   		q.setParameter("fid", fid);
   		
   	    List<Batch> blist = q.list();
   	    for(Batch b:blist)
   	    	System.out.println(b);
   	    
   		model.addAttribute("BatchList", blist);
   		return "FacultyDashboard";
   	}
    
    
    
    //Modules Approval
    @Transactional
    @RequestMapping("/Mapprove/{mid}")
    public String Mapprove(@PathVariable("mid") int mid,RedirectAttributes ra,Model model, HttpServletRequest request) {
 	   
    	String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Employee cannot access Faculty dashboard! You have been logged out.");
			return "LoginPage";
		}
    	
       System.out.println(mid);
 	   Modules module = hibernateTemplate.get(Modules.class, mid); //GET Module
 	   System.out.println(module);
 	   module.setFacApproval(1);
 	   hibernateTemplate.update(module);  //UPDATE M  (Approved)
 	   System.out.println(module);
 	   
 	   ra.addFlashAttribute("statusMsg", "Module Approved");
 	   ra.addFlashAttribute("id", module.getMid());
 	   ra.addFlashAttribute("Mname", module.getMname()+" Approved Successfull");
 	   
 	   return "redirect:/showModules";
    }

    
  //Modules Rejection
    @Transactional
    @RequestMapping("/Mreject/{mid}")
    public String Mreject(@PathVariable("mid") int mid,RedirectAttributes ra,Model model, HttpServletRequest request) {
 	   
    	String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Employee cannot access Faculty dashboard! You have been logged out.");
			return "LoginPage";
		}
    	
       
       System.out.println(mid);
 	   Modules module = hibernateTemplate.get(Modules.class, mid); //GET Module
 	   System.out.println(module);
 	   module.setFacApproval(-1);
 	   hibernateTemplate.update(module);  //UPDATE M  (Approved)
 	   System.out.println(module);
 	   
 	   ra.addFlashAttribute("StatusMsg", "Module Rejected");
 	   ra.addFlashAttribute("Eid", module.getMid());
 	   ra.addFlashAttribute("RMname", module.getMname()+" Rejected Successfull");
 	   
 	   return "redirect:/showModules";
    }


}
