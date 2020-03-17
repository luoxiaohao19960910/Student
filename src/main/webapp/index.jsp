<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>电气信息系学生成绩查分系统</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body  background="${pageContext.request.contextPath}/static/img/login.jpg" style="background-size: 100%">
	<h1 style="padding-left: 426px;padding-top: 100px">
	电&nbsp;&nbsp;气&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;系&nbsp;&nbsp;学&nbsp;&nbsp;生&nbsp;&nbsp;成&nbsp;&nbsp;绩&nbsp;&nbsp;查&nbsp;&nbsp;分&nbsp;&nbsp;系&nbsp;&nbsp;统</h1><br><br><br><br>
	
    	<form class="layui-form" action="" method="post" id="form" style="width: 380px; margin: 0px auto;">
			<div class="layui-form-item">
			    <label class="layui-form-label">身&nbsp;&nbsp;&nbsp;份:</label>
			    <div class="layui-input-block">
			    	<input type="radio" name="roles" value="学生" title="学生" checked>
			        <input type="radio" name="roles" value="教师" title="教师">
			        <input type="radio" name="roles" value="管理员" title="管理员">
			    </div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" for="u_name">用户名:</label>
			    <div class="layui-input-block">
			    	<input type="text" name="loginId" id="u_name" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" onblur="checkLoginId()" style="width: 240px">
			    	<span id="tip" style="color:#FF5722"></span>
			    </div>
			</div>
			<br>
			<div class="layui-form-item">
			    <label class="layui-form-label" for="u_password">密&nbsp;&nbsp;&nbsp;码:</label>
			    <div class="layui-input-inline">
			    	<input type="password" name="loginPassword" id="u_password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 240px">
			    </div>
			</div>
			<br>  
			<div class="layui-form-item">
			    <div class="layui-input-block">
			    	&nbsp;&nbsp;&nbsp;&nbsp;
			        <button class="layui-btn layui-btn-radius" id="login" lay-submit lay-filter="formDemo">登录</button>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button type="reset" onclick="resetAll()" class="layui-btn layui-btn-radius">重置</button>
			    </div>
			</div>
		</form>
		<script>
			layui.use('form', function() {
				var form = layui.form;

				form.on('submit(formDemo)', function(data) {
					var formValues = data.field;
					var role = formValues.roles;
					var loginId = formValues.loginId;
					var loginPassword = formValues.loginPassword;
					var path;
					if (role == "学生") {
						path = "/checkStudentLogin";
						role = "/student";
					} else if (role == "教师") {
						path = "/checkTeacherLogin";
						role = "/teacher";
					} else {
						path = "/checkAdminLogin";
						role = "/admin";
					}
					//发送ajax请求，查询数据库中是否含有对应的用户
					$.ajax({
						url:'${pageContext.request.contextPath}'+path,
					  	type:"POST",
					  	data:{"loginId":loginId,"loginPassword":loginPassword},
						success:function(data){
							//alert(data.count);
							if(data.count>0){
								$("#form").attr("action",'${pageContext.request.contextPath}'+role+"/"+loginId).submit();
							}else{
								layer.msg("用户名或密码输入错误",{icon: 5});
							}
						} 
					});
					return false;
				}); 
			});
			
			function checkLoginId(){
				$("#tip").html("");
				$("#login").attr("disabled",false);
				$("#login").removeClass("layui-btn-disabled");
				if(isNaN($("#u_name").val())){
					$("#tip").html("用户名只能是数字 !");
					$("#login").attr("disabled",true);
					$("#login").addClass("layui-btn-disabled");
				}
			}
			
			function resetAll(){
				$("#tip").html("");
				$("#login").attr("disabled",false);
				$("#login").removeClass("layui-btn-disabled");
			}
		</script>
  	</body>
</html>