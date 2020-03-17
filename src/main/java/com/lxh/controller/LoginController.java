package com.lxh.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxh.bean.AdminLogin;
import com.lxh.bean.StudentLogin;
import com.lxh.bean.TeacherLogin;
import com.lxh.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@ResponseBody
	@RequestMapping(value="/checkStudentLogin")
	public Map<String,Object> checkStudentLogin(@RequestParam("loginId") String loginId,
			@RequestParam("loginPassword") String loginPassword) {
		
		Integer studentLoginId = Integer.parseInt(loginId);
		StudentLogin studentLogin = new StudentLogin(studentLoginId,loginPassword);
		Integer count = loginService.checkStudentLogin(studentLogin);
		Map<String,Object> map = new HashMap<>();
		map.put("count",count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkTeacherLogin")
	public Map<String,Object> checkTeacherLogin(@RequestParam("loginId") String loginId,
			@RequestParam("loginPassword") String loginPassword) {
		
		Integer teacherLoginId = Integer.parseInt(loginId);
		TeacherLogin teacherLogin = new TeacherLogin(teacherLoginId,loginPassword);
		Integer count = loginService.checkTeacherLogin(teacherLogin);
		Map<String,Object> map = new HashMap<>();
		map.put("count",count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkAdminLogin")
	public Map<String,Object> checkAdminLogin(@RequestParam("loginId") String loginId,
			@RequestParam("loginPassword") String loginPassword) {
		
		Integer adminLoginId = Integer.parseInt(loginId);
		AdminLogin adminLogin = new AdminLogin(adminLoginId,loginPassword);
		Integer count = loginService.checkAdminLogin(adminLogin);
		Map<String,Object> map = new HashMap<>();
		map.put("count",count);
		return map;
	}
}
