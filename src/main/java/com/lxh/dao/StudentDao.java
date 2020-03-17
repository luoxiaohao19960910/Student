package com.lxh.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lxh.bean.Course;
import com.lxh.bean.CourseBusiness;
import com.lxh.bean.PageStudentBusiness;
import com.lxh.bean.SelectedCourse;
import com.lxh.bean.Student;
import com.lxh.bean.StudentLogin;

@Repository
public interface StudentDao {

	Student queryStudent(Integer studentLoginId);

	Integer queryCourseCount(Integer studentId);

	List<Course> queryAllCourses(PageStudentBusiness pageStudentBusiness);

	void addCourse(SelectedCourse selectedCourse);

	Integer querySelectedCourseCount(Integer studentId);

	List<Course> querySelectedCourses(Integer studentId);

	void deleteCourse(SelectedCourse selectedCourse);

	List<CourseBusiness> finishedCourses(Integer studentId);

	Integer selectedCourseCount(Integer studentId);

	String checkStudentPassword(Integer studentId);

	void updateStudentPassword(StudentLogin studentLogin);
	
}
