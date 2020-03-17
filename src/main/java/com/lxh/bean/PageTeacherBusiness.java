package com.lxh.bean;

public class PageTeacherBusiness {
	private Integer teacherId;
	private Integer startIndex;
	private Integer limit;
	
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
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
	public PageTeacherBusiness() {
	}
	public PageTeacherBusiness(Integer teacherId, Integer startIndex, Integer limit) {
		super();
		this.teacherId = teacherId;
		this.startIndex = startIndex;
		this.limit = limit;
	}
}
