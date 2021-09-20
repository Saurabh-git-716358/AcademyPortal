package com.academy.Models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.transaction.Transactional;

@Entity
@Table(name="Employee")
public class Employee {
   
	@Id
	private int userid;
	private String fname;
	private String lname;
	private String dob;
	private String gender;
	private int contactno;
	private String email;
	private String password;
	@Transient
	private String cpassword;
	private int status;
	private int batchJoined;
	
	@Transient
	@OneToMany
	private List<EmployeeBatch> batchRegistered = new ArrayList<EmployeeBatch>();
	
	

	@Override
	public String toString() {
		return "Employee [userid=" + userid + ", fname=" + fname + ", lname=" + lname + ", dob=" + dob + ", gender="
				+ gender + ", contactno=" + contactno + ", email=" + email + ", password=" + password + ", cpassword="
				+ cpassword + ", status=" + status + ", batchJoined=" + batchJoined + "]";
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getContactno() {
		return contactno;
	}

	public void setContactno(int contactno) {
		this.contactno = contactno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getBatchJoined() {
		return batchJoined;
	}

	public void setBatchJoined(int batchJoined) {
		this.batchJoined = batchJoined;
	}

	public List<EmployeeBatch> getBatchRegistered() {
		return batchRegistered;
	}

	public void setBatchRegistered(List<EmployeeBatch> batchRegistered) {
		this.batchRegistered = batchRegistered;
	}

	

}
