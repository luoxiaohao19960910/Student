package com.lxh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxh.bean.AdminLogin;
import com.lxh.bean.Course;
import com.lxh.bean.PageInfo;
import com.lxh.bean.Student;
import com.lxh.bean.StudentLogin;
import com.lxh.bean.Teacher;
import com.lxh.bean.TeacherLogin;
import com.lxh.dao.AdminDao;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;

	public Integer manageCoursesCount() {
		return adminDao.manageCoursesCount();
	}

	public List<Course> manageCourses(PageInfo pageInfo) {
		return adminDao.manageCourses(pageInfo);
	}

	public String checkAdminPassword(Integer adminId) {
		return adminDao.checkAdminPassword(adminId);
	}

	public void updateAdminPassword(AdminLogin adminLogin) {
		adminDao.updateAdminPassword(adminLogin);
	}

	public Integer checkDeleteCourse(Integer courseId) {
		return adminDao.checkDeleteCourse(courseId);
	}

	public void deleteCourses(Integer courseId) {
		adminDao.deleteCourses(courseId);
	}

	public void updateCourses(Course course) {
		adminDao.updateCourses(course);
	}

	public void addCourses(Course course) {
		adminDao.addCourses(course);
	}

	public Integer manageStudentsCount() {
		return adminDao.manageStudentsCount();
	}

	public List<Course> manageStudents(PageInfo pageInfo) {
		return adminDao.manageStudents(pageInfo);
	}
	
	public Integer checkDeleteStudent(Integer studentId) {
		return adminDao.checkDeleteStudent(studentId);
	}

	public void deleteStudents(Integer studentId) {
		adminDao.deleteStudents(studentId);
	}

	public void updateStudents(Student student) {
		adminDao.updateStudents(student);
	}

	public void addStudents(Student student) {
		adminDao.addStudents(student);
	}

	public Integer manageTeachersCount() {
		return adminDao.manageTeachersCount();
	}

	public List<Course> manageTeachers(PageInfo pageInfo) {
		return adminDao.manageTeachers(pageInfo);
	}

	public Integer checkDeleteTeacher(Integer teacherId) {
		return adminDao.checkDeleteTeacher(teacherId);
	}

	public void deleteTeachers(Integer teacherId) {
		adminDao.deleteTeachers(teacherId);
	}

	public void updateTeachers(Teacher teacher) {
		adminDao.updateTeachers(teacher);
	}

	public void addTeachers(Teacher teacher) {
		adminDao.addTeachers(teacher);	
	}

	public void resetStudentPassword(StudentLogin studentLogin) {
		adminDao.resetStudentPassword(studentLogin);
	}

	public void resetTeacherPassword(TeacherLogin teacherLogin) {
		adminDao.resetTeacherPassword(teacherLogin);
	}

	public void resetAdminPassword(AdminLogin adminLogin) {
		adminDao.resetAdminPassword(adminLogin);
	}

}
