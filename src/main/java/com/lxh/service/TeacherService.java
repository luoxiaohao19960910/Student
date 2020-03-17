package com.lxh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxh.bean.Course;
import com.lxh.bean.PageTeacherBusiness;
import com.lxh.bean.SelectedCourse;
import com.lxh.bean.StudentBusiness;
import com.lxh.bean.Teacher;
import com.lxh.bean.TeacherLogin;
import com.lxh.dao.TeacherDao;

@Service
public class TeacherService {
	
	@Autowired
	private TeacherDao teacherDao;

	public Teacher queryTeacher(Integer teacherLoginId) {
		return teacherDao.queryTeacher(teacherLoginId);
	}

	public Integer queryMyCourseCount(Integer teacherId) {
		return teacherDao.queryMyCourseCount(teacherId);
	}

	public List<Course> queryMyCourses(PageTeacherBusiness pageTeacherBusiness) {
		return teacherDao.queryMyCourses(pageTeacherBusiness);
	}

	public Integer queryMarksCount(Integer courseId) {
		return teacherDao.queryMarksCount(courseId);
	}

	public List<StudentBusiness> queryMarks(Integer courseId) {
		return teacherDao.queryMarks(courseId);
	}

	public void updateMarks(SelectedCourse selectedCourse) {
		teacherDao.updateMarks(selectedCourse);
	}

	public String checkTeacherPassword(Integer teacherId) {
		return teacherDao.checkTeacherPassword(teacherId);
	}

	public void updateTeacherPassword(TeacherLogin teacherLogin) {
		teacherDao.updateTeacherPassword(teacherLogin);
	}
}
