package com.lxh.dao;

import org.springframework.stereotype.Repository;

import com.lxh.bean.AdminLogin;
import com.lxh.bean.StudentLogin;
import com.lxh.bean.TeacherLogin;

@Repository
public interface LoginDao {
	//检查学生登录表中是否存在登录信息
	Integer checkStudentLogin(StudentLogin studentLogin);

	Integer checkTeacherLogin(TeacherLogin teacherLogin);

	Integer checkAdminLogin(AdminLogin adminLogin);
}
