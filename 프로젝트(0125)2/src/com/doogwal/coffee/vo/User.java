package com.doogwal.coffee.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
	private int no;
	private char gender,emailCheck,smsCheck;
	private String name,password,phoneNum,address,email,emailAuth;//jms
	private Date birthDate;
	private Timestamp regdate;
	
	public static final String LOGIN = "loginUser";
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(int no, char gender, char emailCheck, char smsCheck, String name, String password, String phoneNum,
			String address, String email, String emailAuth, Date birthDate) {
		this.no = no;
		this.gender = gender;
		this.emailCheck = emailCheck;
		this.smsCheck = smsCheck;
		this.name = name;
		this.password = password;
		this.phoneNum = phoneNum;
		this.address = address;
		this.email = email;
		this.emailAuth = emailAuth;
		this.birthDate = birthDate;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public char getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(char emailCheck) {
		this.emailCheck = emailCheck;
	}
	public char getSmsCheck() {
		return smsCheck;
	}
	public void setSmsCheck(char smsCheck) {
		this.smsCheck = smsCheck;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailAuth() {
		return emailAuth;
	}
	public void setEmailAuth(String emailAuth) {
		this.emailAuth = emailAuth;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	
}
