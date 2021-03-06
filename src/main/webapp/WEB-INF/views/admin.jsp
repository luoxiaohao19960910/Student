<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员信息</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/iconfont/iconfont.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	</head>
	<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
	
			<!-- 头部导航栏 -->
	
			<div class="layui-header" style="position: relative; color: white;">
				<div class="layui-logo" style="color: white;">管 理 员 基 本 信 息</div>
				<h1 style="text-align: center; line-height: 60px;">电&nbsp;&nbsp;气&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;系&nbsp;&nbsp;学&nbsp;&nbsp;生&nbsp;&nbsp;成&nbsp;&nbsp;绩&nbsp;&nbsp;查&nbsp;&nbsp;分&nbsp;&nbsp;系&nbsp;&nbsp;统</h1>
	
				<div style="position: absolute; right: 40px; top: 16px;">
					 <i class="iconfont icon-guanliyuan" style="position: absolute; right: 70px; top: -5px;font-size: 40px;"></i>&nbsp;<span style="position: absolute; right: 0px; top: 2px;font-size: 20px;width: 60px">管理员</span>
				</div>
			
			</div>
	
			<!-- 左侧垂直导航栏 -->
	
			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<br>
						<li class="layui-nav-item" style="position: relative;"><a
							class="" href="javascript:;" onclick="manageCourses()" style="font-size: 16px;">课程管理<i
								class="iconfont icon-shuben"
								style="position: absolute; left: 145px; top: 0px; font-size: 25px;"></i>
						</a></li>
						<br>
						<li class="layui-nav-item" style="position: relative;"><a
							class="" href="javascript:;" onclick="manageStudents()" style="font-size: 16px;">学生管理 <i
								class="iconfont icon-xuesheng"
								style="position: absolute; left: 145px; top: 0px; font-size: 25px;"></i>
						</a></li>
						<br>
						<li class="layui-nav-item" style="position: relative;"><a
							class="" href="javascript:;" onclick="manageTeachers()" style="font-size: 16px;">教师管理 <i
								class="iconfont icon-laoshi"
								style="position: absolute; left: 145px; top: 0px; font-size: 25px;"></i>
						</a></li>
						<br>
						<li class="layui-nav-item" style="position: relative;"><a
							href="javascript:;" onclick="resetPasswords()" style="font-size: 16px;">账号密码重置 <i
								class="iconfont icon-icon_refresh"
								style="position: absolute; left: 145px; top: -1px; font-size: 25px;"></i>
						</a></li>
						<br>
						<li class="layui-nav-item" style="position: relative;"><a
							href="javascript:;" onclick="updateAdminPassword()" style="font-size: 16px;">修改密码 <i
								class="iconfont icon-icon-pencil"
								style="position: absolute; left: 145px; top: 0px; font-size: 25px;"></i>
						</a></li>
						<br>
						<li class="layui-nav-item" style="position: relative;"><a
							href="javascript:;" onclick="leave()" style="font-size: 16px;">退出系统 <i
								class="iconfont icon-tuichu"
								style="position: absolute; left: 145px; top: 0px; font-size: 25px;"></i>
						</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 主要类容区域 -->
			<div class="layui-body">
				<a href="https://720yun.com/t/bb62bwa6q46?scene_id=43664" target="school" id="link"><span id="auto"></span></a>
				<iframe name="school" style="width: 100%; height: 100%;"></iframe>
			</div>
	
			<!-- 底部区域 -->
	
			<div class="layui-footer">© 湖北工业大学工程技术学院 - 电气信息系</div>
	
		</div>
	
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
		<script>
	
			$(function() {
				$("#auto").trigger("click");
			});
			
			
			function manageCourses(){
				$("#link").attr("href",'${pageContext.request.contextPath}/manageCourses.jsp');
				$("#auto").trigger("click");
			}
			
			function manageStudents(){
				$("#link").attr("href",'${pageContext.request.contextPath}/manageStudents.jsp');
				$("#auto").trigger("click");
			}
			
			function manageTeachers(){
				$("#link").attr("href",'${pageContext.request.contextPath}/manageTeachers.jsp');
				$("#auto").trigger("click");
			}
			
			function resetPasswords(){
				$("#link").attr("href",'${pageContext.request.contextPath}/resetPasswords.jsp');
				$("#auto").trigger("click");
			}
			
			function updateAdminPassword(){
				$("#link").attr("href",'${pageContext.request.contextPath}/updateAdminPassword.jsp?adminId=${adminInfo.loginId}');
				$("#auto").trigger("click");
			}
			
			function leave(){
				layui.use('layer', function(){
					var layer = layui.layer;
					layer.confirm('确定退出吗？', function(){
						$("#link").attr("href",'${pageContext.request.contextPath}/index.jsp');
						$("#link").attr("target",'_parent');
						$("#auto").trigger("click");
					});
				}); 
			}
		</script>
	</body>
</html>