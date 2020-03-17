package com.lxh.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lxh.bean.AdminLogin;
import com.lxh.bean.Course;
import com.lxh.bean.PageInfo;
import com.lxh.bean.Student;
import com.lxh.bean.StudentLogin;
import com.lxh.bean.Teacher;
import com.lxh.bean.TeacherLogin;

@Repository
public interface AdminDao {

	Integer manageCoursesCount();

	List<Course> manageCourses(PageInfo pageInfo);

	void updateAdminPassword(AdminLogin adminLogin);

	String checkAdminPassword(Integer adminId);

	Integer checkDeleteCourse(Integer courseId);

	void deleteCourses(Integer courseId);

	void updateCourses(Course course);

	void addCourses(Course course);

	Integer manageStudentsCount();
	
	List<Course> manageStudents(PageInfo pageInfo);

	void deleteStudents(Integer studentId);

	void updateStudents(Student student);

	void addStudents(Student student);

	Integer checkDeleteStudent(Integer studentId);

	Integer manageTeachersCount();

	List<Course> manageTeachers(PageInfo pageInfo);

	Integer checkDeleteTeacher(Integer teacherId);

	void deleteTeachers(Integer teacherId);

	void updateTeachers(Teacher teacher);

	void addTeachers(Teacher teacher);

	void resetStudentPassword(StudentLogin studentLogin);

	void resetTeacherPassword(TeacherLogin teacherLogin);

	void resetAdminPassword(AdminLogin adminLogin);

}
