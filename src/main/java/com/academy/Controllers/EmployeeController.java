package com.academy.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.academy.Models.Batch;
import com.academy.Models.Employee;
import com.academy.Models.EmployeeBatch;
import com.academy.Models.Login;
import com.academy.Models.Modules;
import com.academy.Models.SkillList;

@Controller
public class EmployeeController {

	@Autowired
	HibernateTemplate hibernateTemplate;

	// Gets Employee Id which is currently Login In from Login Class
	private static int a;
    

	//Checks if entity is employee type not
	public static String checkSessionEntity(HttpServletRequest request) 
	{
		//a assigned based on session value
        a = (int) request.getSession().getAttribute("userid");
        		
		String cat = request.getSession().getAttribute("category").toString();
        System.out.println("Employee Method called");
	  if (!cat.equalsIgnoreCase("employee"))
      {		
			request.getSession().invalidate();
			return "NotOk";	 
	  }
	  return "Ok";	
     
	} 

	// Search Module according to clicked page Number
	@RequestMapping("/searchModule/{pageid}")
	public String SearchModule(@PathVariable("pageid") int pageid, Model model, RedirectAttributes ra , HttpServletRequest request) {

		String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Faculty cannot access Employees dashboard! You have been logged out.");
			return "LoginPage";
		}
		
		
		if (pageid == 999) {
			return "redirect:/searchModule";
		}
		int pageSize = 3;
		String countQ = "Select count (m.mid) from Modules m where m.facApproval=1";
		Query countQuery = hibernateTemplate.getSessionFactory().openSession().createQuery(countQ);
		Long countResults = (Long) countQuery.uniqueResult();
		int lastPageNumber = (int) (Math.ceil(countResults / pageSize));
		System.out.println(countResults + " " + lastPageNumber);
		int j = 0;

		for (int i = 1; i <= lastPageNumber; i++) {
			Query q = hibernateTemplate.getSessionFactory().openSession()
					.createQuery("from Modules where facApproval=:fap");
			q.setParameter("fap", 1);
			System.out.println("Value of j before = " + j);
			q.setFirstResult(j);

			q.setMaxResults(pageSize);
			j = j + pageSize;
			System.out.println("Value of j = " + j);

			if (pageid == i) {
				List<Modules> list = q.list();
				model.addAttribute("ModuleListPage", list);
			} // end of if

		} // end of for

		model.addAttribute("lastPage", lastPageNumber);
		return "EmployeeDashboard";
	}

	// Gives first 3 records or first page is returned
	@RequestMapping("/searchModule")
	public String SearchModulePageOne(Model model , HttpServletRequest request) {

		String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Faculty cannot access Employees dashboard! You have been logged out.");
			return "LoginPage";
		}
		
		int pageSize = 3;
		String countQ = "Select count (m.mid) from Modules m where m.facApproval=1";
		Query countQuery = hibernateTemplate.getSessionFactory().openSession().createQuery(countQ);
		Long countResults = (Long) countQuery.uniqueResult();
		int lastPageNumber = (int) (Math.ceil(countResults / pageSize));

		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from Modules where facApproval=:fap");
		q.setParameter("fap", 1);

		q.setFirstResult(0);
		q.setMaxResults(pageSize);
		List<Modules> list = q.list();
		model.addAttribute("ModuleListPage", list);
		model.addAttribute("lastPage", lastPageNumber);
		return "EmployeeDashboard";
	}

	// shows all batches available
	@RequestMapping("/searchBatch")
	public String searchBatch(Model model, HttpServletRequest request) {
		
		String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Faculty cannot access Employees dashboard! You have been logged out.");
			return "LoginPage";
		}
		
		List<Batch> batchlist = hibernateTemplate.loadAll(Batch.class);
		model.addAttribute("batchlist", batchlist);
		return "EmployeeDashboard";
	}

	// Take batch information and stores or maps to a specific student .
	@RequestMapping("/EnrollBatch/{mid}")
	@Transactional
	public String EnrollBatch(@PathVariable("mid") int mid, RedirectAttributes ra , HttpServletRequest request , Model model) {

		String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Faculty cannot access Employees dashboard! You have been logged out.");
			return "LoginPage";
		}
		
		Batch batchchoosed = hibernateTemplate.get(Batch.class, mid);// Get Batch from path mid-PRIMARY KEY
		Employee employee = hibernateTemplate.get(Employee.class, a);// Get current employee from login Entity
		System.out.println(employee);

		// to cheeck if one employee has only one same batch or not
		// Does not allow to enroll if already enrolled
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from EmployeeBatch where classRoomName=:crn and EmpId=:eid");
		q.setParameter("crn", batchchoosed.getClassRoomName());
		q.setParameter("eid", employee.getUserid());

		List<EmployeeBatch> list = q.list();
		if (list.size() == 1) {
			ra.addFlashAttribute("batchRepeat", "yes");
			ra.addFlashAttribute("mid", mid);
			return "redirect:/searchBatch";
		}

		// Increment the count of batches for that employee
		employee.setBatchJoined(employee.getBatchJoined() + 1);
		hibernateTemplate.update(employee);

		// Decrement the size of Batch Capacity
		batchchoosed.setBatchCapacity(batchchoosed.getBatchCapacity() - 1);

		int batchCapacity = batchchoosed.getBatchCapacity();
		if (batchCapacity == 0) {
			ra.addFlashAttribute("batchCapacity", "full");
			ra.addFlashAttribute("mid", mid);
			return "redirect:/searchBatch";
		}

		// Increment the size of student registered for a batch
		batchchoosed.setStudentRegistered(batchchoosed.getStudentRegistered() + 1);
		hibernateTemplate.update(batchchoosed);

		// Add classRoomName to Employee by @OneToMany Mapping
		List<EmployeeBatch> batchRegister = employee.getBatchRegistered();
		EmployeeBatch e = new EmployeeBatch();
		e.setClassRoomName(batchchoosed.getClassRoomName());
		e.setEmpId(a);
		batchRegister.add(e);
		hibernateTemplate.save(e);

		ra.addFlashAttribute("mes", "Batch Enrolled");
		ra.addFlashAttribute("mid", mid);
		return "redirect:/searchBatch";
	}

	// Shows all Batches enrolled by employee

	@RequestMapping("/Learnings")
	public String MyLearnings(Model model , HttpServletRequest request) {

		String checkSessionEntity = checkSessionEntity(request);
		if(checkSessionEntity=="NotOk")
		{
	    model.addAttribute("ErrorSessionMsg",
		"Admin/Faculty cannot access Employees dashboard! You have been logged out.");
			return "LoginPage";
		}
		
		
		Query q = hibernateTemplate.getSessionFactory().openSession()
				.createQuery("from EmployeeBatch where EmpId=:eid");
		q.setParameter("eid", a);
		List<EmployeeBatch> batchlist = q.list();

		if (batchlist.size() == 0) {
			model.addAttribute("batchMsg", "No Batch Registered Yet !!! , Please register");
			return "EmployeeDashboard";
		} else {
			model.addAttribute("batchList", batchlist);
			return "EmployeeDashboard";
		}

	}
	
	
	

}
