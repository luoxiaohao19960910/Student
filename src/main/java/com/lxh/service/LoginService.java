package com.lxh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxh.bean.AdminLogin;
import com.lxh.bean.StudentLogin;
import com.lxh.bean.TeacherLogin;
import com.lxh.dao.LoginDao;

@Service
public class LoginService {
	
	@Autowired
	private LoginDao loginDao;
	
	public Integer checkStudentLogin(StudentLogin studentLogin) {
		
		return loginDao.checkStudentLogin(studentLogin);
	}

	public Integer checkTeacherLogin(TeacherLogin teacherLogin) {
		
		return loginDao.checkTeacherLogin(teacherLogin);
	}

	public Integer checkAdminLogin(AdminLogin adminLogin) {
		
		return loginDao.checkAdminLogin(adminLogin);
	}
}
