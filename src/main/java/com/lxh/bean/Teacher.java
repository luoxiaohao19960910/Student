package com.lxh.bean;

public class Teacher {
	private Integer teacherId;
	private String teacherName;
	private String teacherSex;
	private String title;
	private Integer classId;
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherSex() {
		return teacherSex;
	}
	public void setTeacherSex(String teacherSex) {
		this.teacherSex = teacherSex;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Teacher() {
	}
	public Teacher(Integer teacherId, String teacherName, String teacherSex, String title, Integer classId) {
		super();
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.teacherSex = teacherSex;
		this.title = title;
		this.classId = classId;
	}
}
