package com.lxh.bean;

public class StudentBusiness extends Student {
	private Integer courseId;
	private Integer studentId;
	private Integer mark;
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getMark() {
		return mark;
	}
	public void setMark(Integer mark) {
		this.mark = mark;
	}
	public StudentBusiness() {
		super();
	}
	public StudentBusiness(Integer courseId, Integer studentId, Integer mark) {
		super();
		this.courseId = courseId;
		this.studentId = studentId;
		this.mark = mark;
	}
}
