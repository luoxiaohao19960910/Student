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
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<a href="" id="link"><span id="auto"></span></a>
		<div style="width: 100%;height: 90px;background-color: #F2F2F2">
			<span style="font-size: 40px;color: #666666;line-height: 90px;padding-left: 20px">已选该课程学生名单</span>
		</div>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<script type="text/html" id="barDemo">
		 	<a class="layui-btn layui-btn-xs" lay-event="detail">打分</a>
		</script>
		
		<script>
			var myhref = window.location.href.split("?courseId=")[1];
		
			layui.use('table', function(){
				var table = layui.table;
			  
			    table.render({
			    	elem: '#test',
			    	url:'${pageContext.request.contextPath}/queryMarks/'+myhref,
			    	cols: [[
			      		{field:'studentId', title: '学号', sort: true},
			      		{field:'studentName', title: '姓名'},
			      		{field:'mark', title: '分数'},
					    {fixed: 'right', title:'操作', toolbar: '#barDemo'}
			    	]],
			    	page: true
			  	});
			    
			    //监听行工具事件
			    table.on('tool(test)', function(obj){
			    	layer.prompt(function(value, index, elem){
			    		$.ajax({
			    			url:'${pageContext.request.contextPath}/updateMarks/'+myhref+"/"+obj.data.studentId+'/'+value,
			    			type:"GET",
			    			success: function(data){
			    				if(data.flag == "true"){
			    					$("#link").attr("href",'${pageContext.request.contextPath}/mark.jsp?courseId='+ myhref);
			    					$("#auto").trigger("click");
			    				}
			    			}
			    		});
		    		    layer.close(index);
			    	});
			    });
			});
		</script>
	</body>
</html>