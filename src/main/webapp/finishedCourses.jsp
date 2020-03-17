<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>已修课程</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body>
		
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<script type="text/html" id="toolbarDemo">
  			<div class="layui-btn-container">
  			</div>
		</script>
		
		<script>
			var myhref = window.location.href.split("?studentId=")[1];
		
			layui.use('table', function(){
				var table = layui.table;
			  
			    table.render({
			    	elem: '#test',
			    	url:'${pageContext.request.contextPath}/finishedCourses/'+myhref,
			    	toolbar: '#toolbarDemo',
			    	cols: [[
			      		{field:'courseId', title: '课程号', sort: true},
			      		{field:'courseName', title: '课程名称'},
			      		{field:'teacherId', title: '授课老师编号'},
					    {field:'courseTime',  title: '上课时间'},
					    {field:'courseRoom', title: '地点'},
					    {field:'courseWeek', title: '上课周数'},
					    {field:'score', title: '学分', sort: true},
					    {field: 'mark', title: '成绩', sort: true}
			    	]],
			    	page: true
			  	});
			});
		</script>
	</body>
</html>