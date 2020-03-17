<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>课程管理</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body>
		<a href="" id="link"><span id="auto"></span></a>
		<div style="position: relative;width: 100%;height: 90px;background-color: #F2F2F2">
			<span style="font-size: 40px;color: #666666;line-height: 90px;padding-left: 20px">课程列表</span>
			
			<button class="layui-btn layui-btn-lg layui-btn-normal" style="position: absolute;right: 40px;top: 25px;" onclick="addCourse()">添加课程信息
				<i class="layui-icon layui-icon-add-circle" style="line-height: 40px"></i>
			</button>
		</div>
		
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		
		<div class="layui-row" id="update" style="display:none;">
		    <div class="layui-col-md10">
		        <form class="layui-form" lay-filter="formTestFilter" id="myForm" style="margin-top: 20px">
		           <div class="layui-form-item">
		                <span class="layui-form-label">课程号：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="courseId" id="text01" value=""  class="layui-input" placeholder="例如：1">
		                </div>
		           </div>
		           <div class="layui-form-item">
		                <span class="layui-form-label">课程名称：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="courseName" id="text02" value=""  class="layui-input" placeholder="例如：C语言">
		                </div>
		            </div>
		            <div class="layui-form-item">
		                <span class="layui-form-label">老师编号：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="teacherId" id="text1" value=""  class="layui-input" placeholder="例如：1001">
		                </div>
		            </div>
		            <div class="layui-form-item">
		                <span class="layui-form-label">上课时间：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="courseTime" id="text2" value="" class="layui-input" placeholder="例如：8:20-9:55">
		                </div>
		            </div>
		            <div class="layui-form-item">
		                <span class="layui-form-label">地点：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="courseRoom" id="text3" value="" class="layui-input" placeholder="例如：工2——105">
		                </div>
		            </div>
		            <div class="layui-form-item">
		                <span class="layui-form-label">上课周数：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="courseWeek" id="text4" value=""  class="layui-input" placeholder="例如：1-10周">
		                </div>
		            </div>
		            <div class="layui-form-item">
		                <span class="layui-form-label">学分：</span>
		                <div class="layui-input-inline">
		                    <input type="text" name="score" id="text5" value="" class="layui-input" placeholder="例如：3">
		                </div>
		            </div>
		            <div class="layui-form-item">
					    <div class="layui-input-block">
					      <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
					      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
					    </div>
  					</div>
		        </form>
		    </div>
		</div>
		
		<script>
			layui.use('table', function(){
				var table = layui.table;
			  
			    table.render({
			    	elem: '#test',
			    	url:'${pageContext.request.contextPath}/manageCourses',
			    	cols: [[
			      		{field:'courseId', title: '课程号', sort: true},
			      		{field:'courseName', title: '课程名称'},
			      		{field:'teacherId', title: '授课老师编号',sort: true},
					    {field:'courseTime',  title: '上课时间'},
					    {field:'courseRoom', title: '地点'},
					    {field:'courseWeek', title: '上课周数'},
					    {field:'score', title: '学分', sort: true},
					    {fixed: 'right', title:'操作', toolbar: '#barDemo'}
			    	]],
			    	page: true
			  	});
			    
			    //监听行工具事件
			    table.on('tool(test)', function(obj){
			    	var data = obj.data;
			    	
		        	if(obj.event === 'del'){
	        	          $.ajax({
	        	          	url:'${pageContext.request.contextPath}/checkDeleteCourse/'+data.courseId,
	        	          	type:"GET",
	        	          	success:function(data){
	        	          		if(data.result>0){
	        	          			layer.msg("有学生选择该课程，无法删除!",{icon: 5});
	        	          		}else{
	        	          			layer.confirm('确定删除？', function(index){
	        	          				 obj.del();
	        	          				 $.ajax({
	        	          					 url:'${pageContext.request.contextPath}/deleteCourses/'+obj.data.courseId,
	        	          					 type:"GET",
	        	          					 success:function(data){
	        	          						 if(data.flag == "true"){
	        	          							layer.close(index);
	        	          							$("#link").attr("href",'${pageContext.request.contextPath}/manageCourses.jsp');
	        				    					$("#auto").trigger("click");
	        	          						 }
	        	          					 }
	        	          				 });
	        	          			});
	        	          		}
	        	          	}
	        	      	  });
	        	    } else if(obj.event === 'edit'){
	        	    	setFormValue(data);//动态向表单赋值
	        	    	layer.open({
					        type: 1,
					        title:'修改课程信息',
					        skin:'layui-layer-rim',
					        area: ['380px','500px'],
					        content:$("#update").html() 
		    			});
	        	    }
			    });
			});
			
			function setFormValue(data){
				$("#text01").attr("value",data.courseId);
				$("#text01").attr("readonly","readonly");
				$("#text02").attr("value",data.courseName);
				$("#text02").attr("readonly","readonly");
				$("#text1").attr("value",data.teacherId);
				$("#text2").attr("value",data.courseTime);
				$("#text3").attr("value",data.courseRoom);
				$("#text4").attr("value",data.courseWeek);
				$("#text5").attr("value",data.score);
		  	}
			
			function addCourse(){
				$("#text01").attr("value",'');
				$("#text01").removeAttr("readonly");
				$("#text02").attr("value",'');
				$("#text02").removeAttr("readonly");
				$("#text1").attr("value",'');
				$("#text2").attr("value",'');
				$("#text3").attr("value",'');
				$("#text4").attr("value",'');
				$("#text5").attr("value",'');
				layer.open({
			        type: 1,
			        title:'添加课程信息',
			        skin:'layui-layer-rim',
			        area: ['380px','500px'],
			        content:$("#update").html() 
    			});
			}
			layui.use('form', function(){
			  var form = layui.form;
			  
			  //监听提交
			  form.on('submit(formDemo)', function(data){
			    //alert(data.field);
						if($("#text01").attr("readonly") == "readonly"){
							$.ajax({
								url:'${pageContext.request.contextPath}/updateCourses',
								type:"GET",
								data:data.field,
								success:function(data){
									if(data.result == "true"){
				    					$("#link").attr("href",'${pageContext.request.contextPath}/manageCourses.jsp');
				    					$("#auto").trigger("click");
									}
								}
							});
						}else{
							$.ajax({
								url:'${pageContext.request.contextPath}/addCourses',
								type:"GET",
								data:data.field,
								success:function(data){
									if(data.result == "true"){
				    					$("#link").attr("href",'${pageContext.request.contextPath}/manageCourses.jsp');
				    					$("#auto").trigger("click");
									}
								}
							});
						}
			    return false;
			  });
			});
			
		</script>
	</body>
</html>