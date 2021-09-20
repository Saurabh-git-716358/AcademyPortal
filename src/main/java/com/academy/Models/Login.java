package com.academy.Models;

public class Login {

	@Override
	public String toString() {
		return "Login [category=" + category + ", password=" + password + ", userid=" + userid + "]";
	}

	private String category;
	private String password;
	private int userid;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
}
