<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>已选课程</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body>
		
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-xs" lay-event="del">退课</a>
		</script>
		
		<script>
			var myhref = window.location.href.split("?studentId=")[1];
		
			layui.use('table', function(){
				var table = layui.table;
			  
			    table.render({
			    	elem: '#test',
			    	url:'${pageContext.request.contextPath}/selectedCourses/'+myhref,
			    	cols: [[
			      		{field:'courseId', title: '课程号', sort: true},
			      		{field:'courseName', title: '课程名称'},
			      		{field:'teacherId', title: '授课老师编号'},
					    {field:'courseTime',  title: '上课时间'},
					    {field:'courseRoom', title: '地点'},
					    {field:'courseWeek', title: '上课周数'},
					    {field:'score', title: '学分', sort: true},
					    {fixed: 'right', title:'操作', toolbar: '#barDemo'}
			    	]],
			  	});
			    
			    //监听行工具事件
			    table.on('tool(test)', function(obj){
			        layer.confirm('确定退课吗？', function(index){
				        obj.del();
				        //var content = $(".layui-laypage-count").html();
				        //var count = content.replace(/[^0-9]/g, "") - 1;
				        //content = $(".layui-laypage-count").html('共 '+count+" 条");
				        //在course表中添加此处删除的课程
				        $.ajax({
				        	url:'${pageContext.request.contextPath}/deleteCourse',
						  	type:"GET",
						  	data:{"courseId":obj.data.courseId,"studentId":myhref}
				        });
				        layer.close(index);
			        });
			    });
			});
		</script>
	</body>
</html>