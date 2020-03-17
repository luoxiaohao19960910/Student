<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>可选课程</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body>
		<a href="" id="link"><span id="auto"></span></a>
		<div style="width: 100%;height: 90px;background-color: #F2F2F2">
			<span style="font-size: 40px;color: #666666;line-height: 90px;padding-left: 20px">我教授的课程</span>
		</div>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-xs" lay-event="detail">评分</a>
		</script>
		
		<script>
			var myhref = window.location.href.split("?teacherId=")[1];
		
			layui.use('table', function(){
				var table = layui.table;
			  
			    table.render({
			    	elem: '#test',
			    	url:'${pageContext.request.contextPath}/myCourses/'+myhref,
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
			    	$("#link").attr("href",'${pageContext.request.contextPath}/mark.jsp?courseId='+ obj.data.courseId);
					$("#auto").trigger("click");
			    	//console.log(obj);
			    	//alert(obj.data.courseId);
			    	/*
			        layer.confirm('确定选课吗？', function(index){
				        obj.del();
				        //在selectedcourse表中添加此处删除的课程
				        $.ajax({
				        	url:'${pageContext.request.contextPath}/addCourse',
						  	type:"GET",
						  	data:{"courseId":obj.data.courseId,"studentId":myhref}
				        });
				        layer.close(index);
			        });
			    	*/
			    	
			    });
			});
		</script>
	</body>
</html>