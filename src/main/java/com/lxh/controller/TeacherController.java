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
import com.lxh.bean.Msg;
import com.lxh.bean.PageInfo;
import com.lxh.bean.PageTeacherBusiness;
import com.lxh.bean.SelectedCourse;
import com.lxh.bean.StudentBusiness;
import com.lxh.bean.Teacher;
import com.lxh.bean.TeacherLogin;
import com.lxh.service.TeacherService;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
	@ResponseBody
	@RequestMapping("/teacher/{loginId}")
	public ModelAndView teacher(@PathVariable("loginId") Integer teacherLoginId) {
		
		Teacher teacherInfo = teacherService.queryTeacher(teacherLoginId);
		
		ModelAndView mv = new ModelAndView("teacher");
		mv.addObject("teacherInfo",teacherInfo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/myCourses/{teacherId}")
	public Msg myCourses(@PathVariable("teacherId") Integer teacherId,
			@RequestParam("page") String page,@RequestParam("limit") String limit) {
		
		Integer Page = Integer.parseInt(page);
		Integer Limit = Integer.parseInt(limit);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(Page);
		pageInfo.setLimit(Limit);
		pageInfo.setStartIndex(Page,Limit);
		Integer startIndex = pageInfo.getStartIndex();
		PageTeacherBusiness PageTeacherBusiness = new PageTeacherBusiness(teacherId,startIndex,Limit);
		Integer count = teacherService.queryMyCourseCount(teacherId);
		List<Course> list = teacherService.queryMyCourses(PageTeacherBusiness);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/queryMarks/{courseId}")
	public Msg queryMarks(@PathVariable("courseId") Integer courseId) {
		
		Integer count = teacherService.queryMarksCount(courseId);
		List<StudentBusiness> list = teacherService.queryMarks(courseId);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/updateMarks/{courseId}/{studentId}/{mark}")
	public Map<String,Object> updateMarks(@PathVariable("courseId") Integer courseId,
			@PathVariable("studentId") Integer studentId,@PathVariable("mark") Integer mark) {
		
		SelectedCourse selectedCourse = new SelectedCourse(courseId,studentId,mark);
		teacherService.updateMarks(selectedCourse);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/checkTeacherPassword/{teacherId}")
	public Map<String,Object> checkTeacherPassword(@PathVariable("teacherId") Integer teacherId) {
		
		String password = teacherService.checkTeacherPassword(teacherId);
		Map<String,Object> map = new HashMap<>();
		map.put("password",password);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateTeacherPassword")
	public Map<String,Object> updateTeacherPassword(@RequestParam("loginId") String loginId,
			@RequestParam("loginpassword") String loginpassword) {
		
		Integer loginid = Integer.parseInt(loginId);
		TeacherLogin teacherLogin = new TeacherLogin(loginid,loginpassword);
		teacherService.updateTeacherPassword(teacherLogin);
		Map<String,Object> map = new HashMap<>();
		map.put("result","success");
		return map;
	}
}
