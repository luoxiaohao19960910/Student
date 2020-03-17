<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>账号密码重置</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body  background="${pageContext.request.contextPath}/static/img/update.jpg" style="background-size: 100%">
		<a href="${pageContext.request.contextPath}/index.jsp" target="_parent" id="back"><span id="auto"></span></a>
    	<form class="layui-form" action="" method="post" id="form" style="width: 380px; margin: 0px auto;margin-top: 180px">
			<div class="layui-form-item">
			    <label class="layui-form-label">身&nbsp;&nbsp;&nbsp;份:</label>
			    <div class="layui-input-block">
			    	<input type="radio" name="roles" value="学生" title="学生" checked>
			        <input type="radio" name="roles" value="教师" title="教师">
			        <input type="radio" name="roles" value="管理员" title="管理员">
			    </div>
			</div>
			<br>
			<div class="layui-form-item">
				<label class="layui-form-label" for="u_name">用户名:</label>
			    <div class="layui-input-block">
			    	<input type="text" name="loginId" id="u_name" required lay-verify="required" placeholder="请输入需要重置密码的用户名" autocomplete="off" class="layui-input" onblur="checkLoginId()" style="width: 240px">
			    	<span id="tip" style="color:#FF5722"></span>
			    </div>
			</div>
			<br>
			<div class="layui-form-item">
			    <div class="layui-input-block">
			    	&nbsp;&nbsp;&nbsp;&nbsp;
			        <button class="layui-btn layui-btn-radius" id="login" lay-submit lay-filter="formDemo">确定</button>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button type="reset" onclick="resetAll()" class="layui-btn layui-btn-radius">取消</button>
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
					var path;
					if (role == "学生") {
						path = "/resetStudentPassword";
					} else if (role == "教师") {
						path = "/resetTeacherPassword";
					} else {
						path = "/resetAdminPassword";
					}
					layer.confirm('确定重置？', function(){
						//发送ajax请求，重置数据库中对应用户的密码
						$.ajax({
							url:'${pageContext.request.contextPath}'+path,
						  	type:"POST",
						  	data:{"loginId":loginId},
							success:function(data){
								//alert(data.count);
								if(data.flag == "true"){
									layer.msg("重置成功!");
								}
							} 
						});
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