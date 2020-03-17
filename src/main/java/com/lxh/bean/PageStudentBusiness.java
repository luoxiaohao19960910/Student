package com.lxh.bean;

public class PageStudentBusiness {
	private Integer studentId;
	private Integer startIndex;
	private Integer limit;
	
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public PageStudentBusiness() {
	}
	public PageStudentBusiness(Integer studentId, Integer startIndex, Integer limit) {
		super();
		this.studentId = studentId;
		this.startIndex = startIndex;
		this.limit = limit;
	}
}
