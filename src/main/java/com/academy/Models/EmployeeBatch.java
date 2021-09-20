package com.academy.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class EmployeeBatch {

	@Transient
	private long id;

	private String classRoomName;

	private int EmpId;
	
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getClassRoomName() {
		return classRoomName;
	}

	public void setClassRoomName(String classRoomName) {
		this.classRoomName = classRoomName;
	}

	public int getEmpId() {
		return EmpId;
	}

	public void setEmpId(int empId) {
		EmpId = empId;
	}

	@Override
	public String toString() {
		return "EmployeeBatch [id=" + id + ", classRoomName=" + classRoomName + ", EmpId=" + EmpId + "]";
	}

	

	
}
