package com.academy.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Batch")
public class Batch {

	private String mname;
	@Id
	private int mid;
	@Column(name = "Fid")
	private int userid;
	private int batchCapacity;
	private int studentRegistered;
	private String skillFamily;
	private String classRoomName;
	private String startDate;
	private String endDate;


	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getSkillFamily() {
		return skillFamily;
	}

	public void setSkillFamily(String skillFamily) {
		this.skillFamily = skillFamily;
	}

	public String getClassRoomName() {
		return classRoomName;
	}

	public void setClassRoomName(String classRoomName) {
		this.classRoomName = classRoomName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getBatchCapacity() {
		return batchCapacity;
	}

	public void setBatchCapacity(int batchCapacity) {
		this.batchCapacity = batchCapacity;
	}

	public int getStudentRegistered() {
		return studentRegistered;
	}

	public void setStudentRegistered(int studentRegistered) {
		this.studentRegistered = studentRegistered;
	}

	@Override
	public String toString() {
		return "Batch [mname=" + mname + ", mid=" + mid + ", userid=" + userid + ", batchCapacity=" + batchCapacity
				+ ", studentRegistered=" + studentRegistered + ", skillFamily=" + skillFamily + ", classRoomName="
				+ classRoomName + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

	

	
	
   
	
	
	
}
