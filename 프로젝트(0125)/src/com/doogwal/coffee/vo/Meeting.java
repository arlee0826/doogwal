package com.doogwal.coffee.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Meeting {
	
		// schedules table
		private int no,districtNo,crewNo, categoryNo;	
		private char type;
		private Date startDate,endDate;
		private String name,address,description;
		private double lat,lng;
		private Timestamp regdate;
		
		// meetings table
		private int meetingNo,point,themeNo;
		private char confirmation;
		private String img,place;
		
		public Meeting() {
			// TODO Auto-generated constructor stub
		}
	
		public Meeting(int districtNo, int crewNo, int categoryNo, char type, Date startDate, Date endDate, String name,
				String address, String description, double lat, double lng, Timestamp regdate, int meetingNo, int point,
				int themeNo, char confirmation, String img, String place) {
			super();
			this.districtNo = districtNo;
			this.crewNo = crewNo;
			this.categoryNo = categoryNo;
			this.type = type;
			this.startDate = startDate;
			this.endDate = endDate;
			this.name = name;
			this.address = address;
			this.description = description;
			this.lat = lat;
			this.lng = lng;
			this.regdate = regdate;
			this.meetingNo = meetingNo;
			this.point = point;
			this.themeNo = themeNo;
			this.confirmation = confirmation;
			this.img = img;
			this.place = place;
		}

		public String getStartDateDetail() {
			SimpleDateFormat format1 = new SimpleDateFormat("YYYY년 MM월 DD일 a hh:mm");
			return format1.format(this.startDate);
		}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public int getDistrictNo() {
			return districtNo;
		}

		public void setDistrictNo(int districtNo) {
			this.districtNo = districtNo;
		}

		public int getCrewNo() {
			return crewNo;
		}

		public void setCrewNo(int crewNo) {
			this.crewNo = crewNo;
		}

		public int getCategoryNo() {
			return categoryNo;
		}

		public void setCategoryNo(int categoryNo) {
			this.categoryNo = categoryNo;
		}

		public char getType() {
			return type;
		}

		public void setType(char type) {
			this.type = type;
		}

		public Date getStartDate() {
			return startDate;
		}

		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}

		public Date getEndDate() {
			return endDate;
		}

		public void setEndDate(Date endDate) {
			this.endDate = endDate;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public double getLat() {
			return lat;
		}

		public void setLat(double lat) {
			this.lat = lat;
		}

		public double getLng() {
			return lng;
		}

		public void setLng(double lng) {
			this.lng = lng;
		}

		public Timestamp getRegdate() {
			return regdate;
		}

		public void setRegdate(Timestamp regdate) {
			this.regdate = regdate;
		}

		public int getMeetingNo() {
			return meetingNo;
		}

		public void setMeetingNo(int meetingNo) {
			this.meetingNo = meetingNo;
		}

		public int getPoint() {
			return point;
		}

		public void setPoint(int point) {
			this.point = point;
		}

		public int getThemeNo() {
			return themeNo;
		}

		public void setThemeNo(int themeNo) {
			this.themeNo = themeNo;
		}

		public char getConfirmation() {
			return confirmation;
		}

		public void setConfirmation(char confirmation) {
			this.confirmation = confirmation;
		}

		public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}

		public String getPlace() {
			return place;
		}

		public void setPlace(String place) {
			this.place = place;
		}

}