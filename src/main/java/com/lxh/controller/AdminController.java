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

import com.lxh.bean.AdminLogin;
import com.lxh.bean.Course;
import com.lxh.bean.Msg;
import com.lxh.bean.PageInfo;
import com.lxh.bean.Student;
import com.lxh.bean.StudentLogin;
import com.lxh.bean.Teacher;
import com.lxh.bean.TeacherLogin;
import com.lxh.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@ResponseBody
	@RequestMapping("/admin/{loginId}")
	public ModelAndView admin(@PathVariable("loginId") Integer adminLoginId) {
		
		AdminLogin adminLogin = new AdminLogin(adminLoginId,null);
		ModelAndView mv = new ModelAndView("admin");
		mv.addObject("adminInfo",adminLogin);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/manageCourses")
	public Msg manageCourses(@RequestParam("page") String page,@RequestParam("limit") String limit) {
		
		Integer Page = Integer.parseInt(page);
		Integer Limit = Integer.parseInt(limit);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(Page);
		pageInfo.setLimit(Limit);
		pageInfo.setStartIndex(Page,Limit);
		Integer count = adminService.manageCoursesCount();
		List<Course> list = adminService.manageCourses(pageInfo);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/checkDeleteCourse/{courseId}")
	public Map<String,Object> checkDeleteCourse(@PathVariable("courseId") Integer courseId) {
		
		Integer count = adminService.checkDeleteCourse(courseId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("result",count);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/deleteCourses/{courseId}")
	public Map<String,Object> deleteCourse(@PathVariable("courseId") Integer courseId) {
		
		adminService.deleteCourses(courseId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateCourses")
	public Map<String,Object> updateCourses(@RequestParam("courseId") String courseId,
			@RequestParam("courseName") String courseName,
			@RequestParam("teacherId") String teacherId,
			@RequestParam("courseTime") String courseTime,
			@RequestParam("courseRoom") String courseRoom,
			@RequestParam("courseWeek") String courseWeek,
			@RequestParam("score") String score) {
		
		Integer courseid = Integer.parseInt(courseId);
		Integer teacherid = Integer.parseInt(teacherId);
		Integer score2 = Integer.parseInt(score);
		
		Course course = new Course(courseid,courseName,teacherid,courseTime,
				courseRoom,courseWeek,score2);
		
		adminService.updateCourses(course);
		Map<String,Object> map = new HashMap<>();
		map.put("result","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/addCourses")
	public Map<String,Object> addCourses(@RequestParam("courseId") String courseId,
			@RequestParam("courseName") String courseName,
			@RequestParam("teacherId") String teacherId,
			@RequestParam("courseTime") String courseTime,
			@RequestParam("courseRoom") String courseRoom,
			@RequestParam("courseWeek") String courseWeek,
			@RequestParam("score") String score) {
		
		Integer courseid = Integer.parseInt(courseId);
		Integer teacherid = Integer.parseInt(teacherId);
		Integer score2 = Integer.parseInt(score);
		
		Course course = new Course(courseid,courseName,teacherid,courseTime,
				courseRoom,courseWeek,score2);
		
		adminService.addCourses(course);
		Map<String,Object> map = new HashMap<>();
		map.put("result","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/manageStudents")
	public Msg manageStudents(@RequestParam("page") String page,@RequestParam("limit") String limit) {
		
		Integer Page = Integer.parseInt(page);
		Integer Limit = Integer.parseInt(limit);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(Page);
		pageInfo.setLimit(Limit);
		pageInfo.setStartIndex(Page,Limit);
		Integer count = adminService.manageStudentsCount();
		List<Course> list = adminService.manageStudents(pageInfo);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/checkDeleteStudent/{studentId}")
	public Map<String,Object> checkDeleteStudent(@PathVariable("studentId") Integer studentId) {
		
		Integer count = adminService.checkDeleteStudent(studentId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("result",count);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/deleteStudents/{studentId}")
	public Map<String,Object> deleteStudents(@PathVariable("studentId") Integer studentId) {
		
		adminService.deleteStudents(studentId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateStudents")
	public Map<String,Object> updateStudents(@RequestParam("studentId") String studentId,
			@RequestParam("studentName") String studentName,
			@RequestParam("studentSex") String studentSex,
			@RequestParam("studentBirth") String studentBirth,
			@RequestParam("classId") String classId) {
		
		Integer studentid = Integer.parseInt(studentId);
		Integer classid = Integer.parseInt(classId);
		
		Student student = new Student(studentid,studentName,studentSex,studentBirth,classid);
		
		adminService.updateStudents(student);
		Map<String,Object> map = new HashMap<>();
		map.put("result","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/addStudents")
	public Map<String,Object> addStudents(@RequestParam("studentId") String studentId,
			@RequestParam("studentName") String studentName,
			@RequestParam("studentSex") String studentSex,
			@RequestParam("studentBirth") String studentBirth,
			@RequestParam("classId") String classId) {
		
		Integer studentid = Integer.parseInt(studentId);
		Integer classid = Integer.parseInt(classId);
		
		Student student = new Student(studentid,studentName,studentSex,studentBirth,classid);
		
		adminService.addStudents(student);
		Map<String,Object> map = new HashMap<>();
		map.put("result","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/manageTeachers")
	public Msg manageTeachers(@RequestParam("page") String page,@RequestParam("limit") String limit) {
		
		Integer Page = Integer.parseInt(page);
		Integer Limit = Integer.parseInt(limit);
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(Page);
		pageInfo.setLimit(Limit);
		pageInfo.setStartIndex(Page,Limit);
		Integer count = adminService.manageTeachersCount();
		List<Course> list = adminService.manageTeachers(pageInfo);
		
		Msg msg = new Msg();
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(list);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/checkDeleteTeacher/{teacherId}")
	public Map<String,Object> checkDeleteTeacher(@PathVariable("teacherId") Integer teacherId) {
		
		Integer count = adminService.checkDeleteTeacher(teacherId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("result",count);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/deleteTeachers/{teacherId}")
	public Map<String,Object> deleteTeachers(@PathVariable("teacherId") Integer teacherId) {
		
		adminService.deleteTeachers(teacherId);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateTeachers")
	public Map<String,Object> updateTeachers(@RequestParam("teacherId") String teacherId,
			@RequestParam("teacherName") String teacherName,
			@RequestParam("teacherSex") String teacherSex,
			@RequestParam("title") String title,
			@RequestParam("classId") String classId) {
		
		Integer teacherid = Integer.parseInt(teacherId);
		Integer classid = Integer.parseInt(classId);
		
		Teacher teacher = new Teacher(teacherid,teacherName,teacherSex,title,classid);
		
		adminService.updateTeachers(teacher);
		Map<String,Object> map = new HashMap<>();
		map.put("result","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/addTeachers")
	public Map<String,Object> addTeachers(@RequestParam("teacherId") String teacherId,
			@RequestParam("teacherName") String teacherName,
			@RequestParam("teacherSex") String teacherSex,
			@RequestParam("title") String title,
			@RequestParam("classId") String classId) {
		
		Integer teacherid = Integer.parseInt(teacherId);
		Integer classid = Integer.parseInt(classId);
		
		Teacher teacher = new Teacher(teacherid,teacherName,teacherSex,title,classid);
		
		adminService.addTeachers(teacher);
		Map<String,Object> map = new HashMap<>();
		map.put("result","true");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/resetStudentPassword")
	public Map<String,Object> resetStudentPassword(@RequestParam("loginId") String loginId) {
		
		Integer loginid = Integer.parseInt(loginId);
		StudentLogin studentLogin = new StudentLogin(loginid,"123456");
		adminService.resetStudentPassword(studentLogin);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/resetTeacherPassword")
	public Map<String,Object> resetTeacherPassword(@RequestParam("loginId") String loginId) {
		
		Integer loginid = Integer.parseInt(loginId);
		TeacherLogin teacherLogin = new TeacherLogin(loginid,"123456");
		adminService.resetTeacherPassword(teacherLogin);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/resetAdminPassword")
	public Map<String,Object> resetAdminPassword(@RequestParam("loginId") String loginId) {
		
		Integer loginid = Integer.parseInt(loginId);
		AdminLogin adminLogin = new AdminLogin(loginid,"123456");
		adminService.resetAdminPassword(adminLogin);
		
		Map<String,Object> map = new HashMap<>();
		map.put("flag","true");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/checkAdminPassword/{adminId}")
	public Map<String,Object> checkAdminPassword(@PathVariable("adminId") Integer adminId) {
		
		String password = adminService.checkAdminPassword(adminId);
		Map<String,Object> map = new HashMap<>();
		map.put("password",password);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/updateAdminPassword")
	public Map<String,Object> updateAdminPassword(@RequestParam("loginId") String loginId,
			@RequestParam("loginpassword") String loginpassword) {
		
		Integer loginid = Integer.parseInt(loginId);
		AdminLogin adminLogin = new AdminLogin(loginid,loginpassword);
		adminService.updateAdminPassword(adminLogin);
		Map<String,Object> map = new HashMap<>();
		map.put("result","success");
		return map;
	}
}
