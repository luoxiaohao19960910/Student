package com.lxh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lxh.bean.Course;
import com.lxh.bean.CourseBusiness;
import com.lxh.bean.Msg;
import com.lxh.bean.PageInfo;
import com.lxh.bean.PageStudentBusiness;
import com.lxh.bean.SelectedCourse;
import com.lxh.bean.Student;
import com.lxh.bean.StudentLogin;
import com.lxh.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@ResponseBody
	@RequestMapping("/student/{loginId}")
	public ModelAndView student(@PathVariable("loginId") Integer studentLoginId) {
		
		Student studentInfo = studentService.queryStudent(studentLoginId);
		ModelAndView mv = new ModelAndView("student");
		mv.addObject("studentInfo",studentInfo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/allCourses/{studentId}")
	public Msg allCourses(@PathVariable("studentId") Integer studentId,
			@RequestParam("page") String page,@RequestParam("limit") String limit) {
		
		Integer Page = Integer.parseInt(page);
		Integer Limit = Integer.parseInt(limit);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(Page);
		pageInfo.setLimit(Limit);
		pageInfo.setStartIndex(Page,Limit);
		Integer setStartIndex = pageInfo.getStartIndex();
		PageStudentBusiness pageStudentBusiness = new PageStudentBusiness(studentId,setStartIndex,Limit);
		
		Integer count = studentService.queryCourseCount(studentId);
		List<Course> list = studentService.queryAllCourses(pageStudentBusiness);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/selectedCourses/{studentId}")
	public Msg selectedCourses(@PathVariable("studentId") Integer studentId) {
		
		Integer count = studentService.querySelectedCourseCount(studentId);
		List<Course> list = studentService.querySelectedCourses(studentId);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@RequestMapping("/addCourse")
	public String addCourse(@RequestParam("courseId") String courseId,
			@RequestParam("studentId") String studentId) {
		
		Integer courseid = Integer.parseInt(courseId);
		Integer studentid = Integer.parseInt(studentId);
		
		SelectedCourse selectedCourse = new SelectedCourse(courseid,studentid,null);
		studentService.addCourse(selectedCourse);
		
		return "redirect:/courses.jsp";
	}
	
	@RequestMapping("/deleteCourse")
	public String deleteCourse(@RequestParam("courseId") String courseId,
			@RequestParam("studentId") String studentId) {
		
		Integer courseid = Integer.parseInt(courseId);
		Integer studentid = Integer.parseInt(studentId);
		
		SelectedCourse selectedCourse = new SelectedCourse(courseid,studentid,null);
		studentService.deleteCourse(selectedCourse);
		
		return "redirect:/selectedCourses.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/finishedCourses/{studentId}")
	public Msg deleteCourse(@PathVariable("studentId") Integer studentId) {
		
		Integer count = studentService.selectedCourseCount(studentId);
		List<CourseBusiness> list = studentService.finishedCourses(studentId);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/checkStudentPassword/{studentId}")
	public Map<String,Object> checkStudentPassword(@PathVariable("studentId") Integer studentId) {
		
		String password = studentService.checkStudentPassword(studentId);
		Map<String,Object> map = new HashMap<>();
		map.put("password",password);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateStudentPassword")
	public Map<String,Object> updateStudentPassword(@RequestParam("loginId") String loginId,
			@RequestParam("loginpassword") String loginpassword) {
		
		Integer loginid = Integer.parseInt(loginId);
		StudentLogin studentLogin = new StudentLogin(loginid,loginpassword);
		studentService.updateStudentPassword(studentLogin);
		Map<String,Object> map = new HashMap<>();
		map.put("result","success");
		return map;
	}
}
