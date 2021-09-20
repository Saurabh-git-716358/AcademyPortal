package com.academy.Models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Module")
public class Modules {

	@Id
	private int mid;
	private String mname;
	private String skillFamily;
	private int proficiency;
	private String executionType;
	private String certificateName;
	private String certificateType;
	
	private int fid;
	
	private int facApproval;
   
	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getSkillFamily() {
		return skillFamily;
	}

	public void setSkillFamily(String skillFamily) {
		this.skillFamily = skillFamily;
	}

	public int getProficiency() {
		return proficiency;
	}

	public void setProficiency(int proficiency) {
		this.proficiency = proficiency;
	}

	public String getExecutionType() {
		return executionType;
	}

	public void setExecutionType(String executionType) {
		this.executionType = executionType;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public String getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}
	

	@Override
	public String toString() {
		return "Modules [mid=" + mid + ", mname=" + mname + ", skillFamily=" + skillFamily + ", proficiency="
				+ proficiency + ", executionType=" + executionType + ", certificateName=" + certificateName
				+ ", certificateType=" + certificateType + ", fid=" + fid + ", facApproval=" + facApproval + "]";
	}

	public int getFacApproval() {
		return facApproval;
	}

	public void setFacApproval(int facApproval) {
		this.facApproval = facApproval;
	}

	
}
