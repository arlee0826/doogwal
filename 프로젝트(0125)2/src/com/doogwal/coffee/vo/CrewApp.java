package com.doogwal.coffee.vo;

import java.sql.Timestamp;

public class CrewApp {
	
	private int no,crewNo,userNo;
	private char acceptance;
	private Timestamp regdate;
	
	public CrewApp() {
		// TODO Auto-generated constructor stub
	}

	public CrewApp(int no, int crewNo, int userNo, char acceptance) {
		this.no = no;
		this.crewNo = crewNo;
		this.userNo = userNo;
		this.acceptance = acceptance;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCrewNo() {
		return crewNo;
	}

	public void setCrewNo(int crewNo) {
		this.crewNo = crewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public char getAcceptance() {
		return acceptance;
	}

	public void setAcceptance(char acceptance) {
		this.acceptance = acceptance;
	}
	
}
