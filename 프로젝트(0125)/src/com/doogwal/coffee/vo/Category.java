package com.doogwal.coffee.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Category {

	private int no,priorNo;
	private String name,icon;
	private Timestamp regdate;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Category(int no, int priorNo, String name, String icon) {
		super();
		this.no = no;
		this.priorNo = priorNo;
		this.name = name;
		this.icon = icon;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPriorNo() {
		return priorNo;
	}

	public void setPriorNo(int priorNo) {
		this.priorNo = priorNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	
}
