package com.academy.Models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Faculty")
public class Faculty {

	
	@Id
	private int userid;
	private String fname;
	private String lname;
	private String dob;
	private String gender;
	private int contactno;
	private String email;
	private String password;
	private String cpassword;
	private String skillFamily;
	@Transient
	private List<String> skills;

    
	
	private String thours;
	private String proficiency;
	private int status;
	
	@Transient
	@OneToMany(mappedBy = "faculty") 
	private List<SkillList> tskills = new ArrayList<SkillList>();
	
	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
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

	public String getSkillFamily() {
		return skillFamily;
	}

	public void setSkillFamily(String skillFamily) {
		this.skillFamily = skillFamily;
	}

	public String getThours() {
		return thours;
	}

	public void setThours(String thours) {
		this.thours = thours;
	}

	public String getProficiency() {
		return proficiency;
	}

	public void setProficiency(String proficiency) {
		this.proficiency = proficiency;
	}
  
	
	@Override
	public String toString() {
		return "Faculty [userid=" + userid + ", fname=" + fname + ", lname=" + lname + ", dob=" + dob + ", gender="
				+ gender + ", contactno=" + contactno + ", email=" + email + ", password=" + password + ", cpassword="
				+ cpassword + ", skillFamily=" + skillFamily + ", skills=" + skills + ", thours=" + thours
				+ ", proficiency=" + proficiency + ", status=" + status + "]";
	}

	public List<SkillList> getTskills() {
		return tskills;
	}

	public void setTskills(List<SkillList> tskills) {
		this.tskills = tskills;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
