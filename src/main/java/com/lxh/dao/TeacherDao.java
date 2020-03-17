package com.lxh.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lxh.bean.Course;
import com.lxh.bean.PageTeacherBusiness;
import com.lxh.bean.SelectedCourse;
import com.lxh.bean.StudentBusiness;
import com.lxh.bean.Teacher;
import com.lxh.bean.TeacherLogin;

@Repository
public interface TeacherDao {

	Teacher queryTeacher(Integer teacherLoginId);

	Integer queryMyCourseCount(Integer teacherId);

	List<Course> queryMyCourses(PageTeacherBusiness pageTeacherBusiness);

	Integer queryMarksCount(Integer courseId);

	List<StudentBusiness> queryMarks(Integer courseId);

	void updateMarks(SelectedCourse selectedCourse);

	String checkTeacherPassword(Integer teacherId);

	void updateTeacherPassword(TeacherLogin teacherLogin);
	
}
