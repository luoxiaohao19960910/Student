package com.lxh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxh.bean.Course;
import com.lxh.bean.CourseBusiness;
import com.lxh.bean.PageStudentBusiness;
import com.lxh.bean.SelectedCourse;
import com.lxh.bean.Student;
import com.lxh.bean.StudentLogin;
import com.lxh.dao.StudentDao;

@Service
public class StudentService {
	
	@Autowired
	private StudentDao studentDao;

	public Student queryStudent(Integer studentLoginId) {

		return studentDao.queryStudent(studentLoginId);
	}

	public Integer queryCourseCount(Integer studentId) {
		return studentDao.queryCourseCount(studentId);
	}

	public List<Course> queryAllCourses(PageStudentBusiness pageStudentBusiness) {
		return studentDao.queryAllCourses(pageStudentBusiness);
	}

	public void addCourse(SelectedCourse selectedCourse) {
		studentDao.addCourse(selectedCourse);
	}

	public Integer querySelectedCourseCount(Integer studentId) {
		return studentDao.querySelectedCourseCount(studentId);
	}

	public List<Course> querySelectedCourses(Integer studentId) {
		return studentDao.querySelectedCourses(studentId);
	}

	public void deleteCourse(SelectedCourse selectedCourse) {
		studentDao.deleteCourse(selectedCourse);
	}

	public List<CourseBusiness> finishedCourses(Integer studentId) {
		return studentDao.finishedCourses(studentId);
	}

	public Integer selectedCourseCount(Integer studentId) {
		return studentDao.selectedCourseCount(studentId);
	}

	public String checkStudentPassword(Integer studentId) {
		return studentDao.checkStudentPassword(studentId);
	}

	public void updateStudentPassword(StudentLogin studentLogin) {
		studentDao.updateStudentPassword(studentLogin);
	}
	
}
