package com.lxh.bean;

public class Course {
	private Integer courseId;
	private String courseName;
	private Integer teacherId;
	private String courseTime;
	private String courseRoom;
	private String courseWeek;
	private Integer score;
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	public String getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	public String getCourseRoom() {
		return courseRoom;
	}
	public void setCourseRoom(String courseRoom) {
		this.courseRoom = courseRoom;
	}
	public String getCourseWeek() {
		return courseWeek;
	}
	public void setCourseWeek(String courseWeek) {
		this.courseWeek = courseWeek;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Course() {
		
	}
	public Course(Integer courseId, String courseName, Integer teacherId, String courseTime, String courseRoom,
			String courseWeek, Integer score) {
		this.courseId = courseId;
		this.courseName = courseName;
		this.teacherId = teacherId;
		this.courseTime = courseTime;
		this.courseRoom = courseRoom;
		this.courseWeek = courseWeek;
		this.score = score;
	}
}
