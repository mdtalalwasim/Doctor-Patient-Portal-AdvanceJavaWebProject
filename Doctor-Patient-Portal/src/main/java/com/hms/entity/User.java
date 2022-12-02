package com.hms.entity;

public class User {
	private int id;
	private String fullName;
	private String email;
	private String password;
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(int id, String fullName, String email, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.password = password;
	}


	public User(String fullName, String email, String password) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.password = password;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", fullName=" + fullName + ", email=" + email + ", password=" + password + "]";
	}
	
	
	
	
	
	
	
	
}
