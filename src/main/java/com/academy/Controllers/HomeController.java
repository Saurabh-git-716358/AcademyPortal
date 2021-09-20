package com.academy.Controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.academy.Models.Admin;
import com.academy.Models.Employee;
import com.academy.Models.Faculty;
import com.academy.Models.Login;
import com.academy.Models.Modules;
import com.academy.Models.SkillList;

import javassist.bytecode.stackmap.BasicBlock.Catch;

@Controller
public class HomeController {

	@Autowired
	HibernateTemplate hibernateTemplate;


	// Shows Employee Register Page
	@RequestMapping("/showregisterEmployee")
	public String showEmployeeRegisterPage() {
		return "ERegistrationPage";
	}

	// Shows Faculty Register Page
	@RequestMapping("/showregisterFaculty")
	public String showFacultyRegisterPage() {
		return "FRegistrationPage";
	}

	// Shows Login Page for all (Admin/Faculty/Employee)
	@RequestMapping("/login")
	public String showLoginPage() {
		return "LoginPage";
	}

	
	//AJAX CALL TO CHECK EMPLOYEE ID EXSISTS IN DB OR NOT
	@RequestMapping("/validateUserIdforEmployee")
	public @ResponseBody String validateUserId(@RequestParam("userid") int userid) {
		Employee employee = hibernateTemplate.get(Employee.class, userid);
		String msg = "";
		
		if(employee != null)
		{
			msg = userid+ " Alredy exsists, Try another";
		}
		return msg;
	}
	
	
	
	// Registers Employees (UI TO CONTROLLER)
	@RequestMapping("/Empregister")
	@Transactional
	public String registerEmployee(@ModelAttribute("employee") Employee employee, Model model) {
		System.out.println(employee);
		employee.setStatus(0); // 0 FOR INDICATING NOT APPROVED(just registered)
		// not confirmed by admin(change 0 to 1)
		model.addAttribute("message", employee.getFname() + " Registered Successfully ");
		hibernateTemplate.save(employee); // Saves Employees Record
		return "ERegistrationPage";
	 }
  
	
	//AJAX CALL TO CHECK FACULTY ID EXSISTS IN DB OR NOT
		@RequestMapping("/validateUserIdforFaculty")
		public @ResponseBody String validateUserIdFaculty(@RequestParam("userid") int userid) {
			Faculty f = hibernateTemplate.get(Faculty.class, userid);
			String msg = "";
			
			if(f != null)
			{
				msg = userid+ " Alredy exsists, Try another";
			}
			return msg;
		}
	
	
	// Registers Faculty (UI TO CONTROLLER)
	@RequestMapping("/Facultyregister")
	@Transactional
	public String registerFaculty(@ModelAttribute("faculty") Faculty faculty, Model model) {
		System.out.println(faculty);

		for (String a : faculty.getSkills()) {
			int i = 0;
			SkillList temp = new SkillList();
			temp.setSkillname(a);
			temp.setFaculty(faculty);
			faculty.getTskills().add(i, temp);
			i++;

			hibernateTemplate.save(temp); // saves skill to SkillTable
		}

		model.addAttribute("message", faculty.getFname() + " Registered Successfully");
		model.addAttribute("message2", " Wait for Admins Approval");
		hibernateTemplate.save(faculty); // Saves Faculty Record

		return "FRegistrationPage";
	}

	// Login for (EMPLOYEE , FACULTY AND ADMIN)
	@RequestMapping("/loginEntity")
	public String loginEntity(@ModelAttribute("login") Login login, Model model, HttpServletRequest request,
			HttpSession session) {
		
		session = request.getSession();  //Initialize session to given request
		
		
		
		if (login.getCategory().equals("Employee")) {

			Query q = hibernateTemplate.getSessionFactory().openSession()
					.createQuery("from Employee where userid=:uid and password=:pass");
			q.setParameter("uid", login.getUserid());
			q.setParameter("pass", login.getPassword());

			Employee e = (Employee) q.uniqueResult();
			if (e != null) {
				if (e.getStatus() == 1) {
					
					//Add EMPLOYEE to session
					addUserInSession(login, session, request);
					
					model.addAttribute("message", e.getFname() + " Login Successfully");
					return "EmployeeDashboard";
				} else if (e.getStatus() == -1)
					model.addAttribute("message", e.getFname() + " " + "Registration Rejected , Register Again");
				else if (e.getStatus() == 0)
					model.addAttribute("message",
							e.getFname() + " Waiting for Admins Approval , Login Again after sometimes ");
			} else if (e == null) {
				model.addAttribute("message", "Data Not Present Register Again");
			}

			return "NotRegister";

		} else if (login.getCategory().equals("Faculty")) {


			Query q = hibernateTemplate.getSessionFactory().openSession()
					.createQuery("from 	Faculty where userid=:uid and password=:pass");
			q.setParameter("uid", login.getUserid());
			q.setParameter("pass", login.getPassword());

			Faculty e = (Faculty) q.uniqueResult();
			if (e != null) {
				if (e.getStatus() == 1) {

					//Add FACULTY to session
					addUserInSession(login, session, request);
					
					// While fac approval load all new modules assigned to him
					model.addAttribute("message", e.getFname() + " Login Successfully");
					Query q1 = hibernateTemplate.getSessionFactory().openSession()
							.createQuery("from Modules where fid=:uid and facApproval=:fap");
					q1.setParameter("uid", login.getUserid());
					q1.setParameter("fap", 0);

					//After login fac sees new batch assigned to him
					Query q2 = hibernateTemplate.getSessionFactory().openSession()
							.createQuery("from Batch where userid=:uid");
					q2.setParameter("uid", login.getUserid());
					
					
					int mstatus = 0;
					List<Modules> NotApprovedModulelist = q1.list();
					if (NotApprovedModulelist.size() >= 1) {
						mstatus = 999;
					}

					int bstatus = 0;
					List<Modules> Batchlist = q1.list();
					if (Batchlist.size() >= 1) {
						bstatus = 999;
					}
					
					
					model.addAttribute("Loginfid", e.getUserid());
					model.addAttribute("newModules", mstatus);
					model.addAttribute("newBatches", bstatus);
					return "FacultyDashboard";
				} else if (e.getStatus() == -1)
					model.addAttribute("message", e.getFname() + " Registration Rejected , Register Again");
				else if (e.getStatus() == 0)
					model.addAttribute("message",
							e.getFname() + " Waiting for Admins Approval , Login Again after sometimes ");

			} else if (e == null) {
				model.addAttribute("message", "Data Not Present Register Again");
			}

			return "NotRegister";

		} else {

			Query createSQLQuery = hibernateTemplate.getSessionFactory().openSession()
					.createSQLQuery("select * from admin");

			
			List<Object[]> list = createSQLQuery.list();

			if (list.size() == 1) {

				for (Object[] admin : list) {
					if (login.getPassword().equals(admin[2]) && login.getUserid()==999) {
						
						
						//ADD ADMIN TO SESSION
						addUserInSession(login, session, request);
						
						// Blink logic
						List<Faculty> newFaclist = hibernateTemplate.loadAll(Faculty.class);
						List<Employee> newEmplist = hibernateTemplate.loadAll(Employee.class);
						int status = 0;
						int estatus = 0;

						for (Faculty f : newFaclist) {
							if (f.getStatus() == 0) {
								status = 999; // To identify if new Faculty have added or not
								break;
							}
						}

						for (Employee e : newEmplist) {
							if (e.getStatus() == 0) {
								estatus = 999; // To identify new employee has added
								break;
							}
						}

						model.addAttribute("message", "Admin Login Successfully");
						model.addAttribute("newFacStatus", status);
						model.addAttribute("newEmpStatus", estatus);
						return "AdminDashboard";
					} else {
						model.addAttribute("message", "Admin Not Registered");
					}
				}

			}

			return "NotRegister";
		}
	}

	private void addUserInSession(Login login, HttpSession session, HttpServletRequest request) {
		session.setAttribute("category", login.getCategory());
		session.setAttribute("password", login.getPassword());
		session.setAttribute("userid", login.getUserid());
	    System.out.println("SESSION DATA ADDED");
	}
	
	
	@RequestMapping("/logout")
	public String LogoutEmployee(Model model ,HttpSession session, HttpServletRequest request) {
       System.out.println(request.getSession().getAttribute("userId"));
		

		session.invalidate();
		request.getSession().invalidate();
		
		model.addAttribute("LogoutstatusMsg", "You have now logged out.");
		System.out.println("SESSION DATA REMOVED");
		System.out.println(request.getSession().getAttribute("category")+" Logged Out Successfully");
		return "LoginPage";
	}
	

}
