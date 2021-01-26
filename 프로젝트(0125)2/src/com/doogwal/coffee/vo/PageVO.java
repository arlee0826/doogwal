package com.doogwal.coffee.vo;

public class PageVO {
	
	private int start, end, no;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end-numPage+1;
	}
	
	public PageVO(int pageNo, 
			int numPage,
			int no) {
		end = pageNo * numPage;
		start = end-numPage+1;
		this.no = no;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
