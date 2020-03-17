<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改学生密码</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
	</head>
	<body background="${pageContext.request.contextPath}/static/img/update.jpg" style="background-size: 100%">
		<a href="${pageContext.request.contextPath}/index.jsp" target="_parent" id="back"><span id="auto"></span></a>
		<form class="layui-form" action="" method="post" id="form" style="width: 380px; margin-left: 340px; margin-top: 135px">
			<div class="layui-form-item">
				<label class="layui-form-label" for="u_password1">旧密码:</label>
			    <div class="layui-input-block">
			    	<input type="password" name="loginPassword1" id="u_password1" required lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input" onblur="checkPassword()" style="width: 240px">
			    	<span id="tip1" style="color:red"></span>
			    </div>
			</div>
			<br> 
			<div class="layui-form-item">
			    <label class="layui-form-label" for="u_password2">新密码:</label>
			    <div class="layui-input-block">
			    	<input type="password" name="loginPassword2" id="u_password2" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input" style="width: 240px">
			    </div>
			</div>
			<br> 
			<div class="layui-form-item">
			    <label class="layui-form-label" for="u_password3">确认新密码:</label>
			    <div class="layui-input-block">
			    	<input type="password" name="loginPassword3" id="u_password3" required lay-verify="required" placeholder="请再次输入新密码" autocomplete="off" class="layui-input" onmouseleave="checkNewPassword()" style="width: 240px">
			    	<span id="tip2" style="color:red"></span>
			    </div>
			</div>
			<br>   
			<div class="layui-form-item">
			    <div class="layui-input-block">
			    	&nbsp;&nbsp;&nbsp;&nbsp;
			        <button class="layui-btn layui-btn-radius" id="login" lay-submit lay-filter="formDemo">修改</button>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button type="reset" onclick="resetAll()" class="layui-btn layui-btn-radius">重置</button>
			    </div>
			</div>
		</form>
		<script>
			var myhref = window.location.href.split("?studentId=")[1];
		
			layui.use('form', function() {
				var form = layui.form;
	
				form.on('submit(formDemo)', function(data) {
					var formValues = data.field;
					var password = formValues.loginPassword3;
					layer.confirm('修改后需要重新登录，确定吗？', function(){
						$.ajax({
							url:'${pageContext.request.contextPath}/updateStudentPassword',
							type:"GET",
							data:{"loginId":myhref,"loginpassword":password},
							success:function(data){
								if(data.result == 'success'){
									$("#auto").trigger("click");
								}
							}
						});
		        	});
					return false;
				}); 
			});
			
			function resetAll(){
				$("#tip1").html("");
				$("#tip2").html("");
				$("#login").attr("disabled",false);
				$("#login").removeClass("layui-btn-disabled");
			}
			
			function checkPassword(){
				$("#tip1").html("");
				$("#login").attr("disabled",false);
				$("#login").removeClass("layui-btn-disabled");
				$.ajax({
					url:'${pageContext.request.contextPath}/checkStudentPassword/'+myhref,
					type:"POST",
					success:function(data){
						//alert(data.password);
						//alert($("#u_password1").val());
						if( !(data.password == $("#u_password1").val()) ){
							$("#tip1").html("密码输入错误 !");
							$("#login").attr("disabled",true);
							$("#login").addClass("layui-btn-disabled");
						}
					} 
				});
			}
			
			function checkNewPassword(){
				$("#tip2").html("");
				$("#login").attr("disabled",false);
				$("#login").removeClass("layui-btn-disabled");
				if( !($("#u_password2").val() == $("#u_password3").val()) ){
					$("#tip2").html("两次输入不一致，请重新输入 !");
					$("#login").attr("disabled",true);
					$("#login").addClass("layui-btn-disabled");
				}
			}
			
			$("#u_password3").keydown(function(e){
				if (e.keyCode == 13) {
					checkNewPassword();
				}
			});
		</script>
	</body>
</html>