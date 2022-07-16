<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/slate/bootstrap.min.css"
	integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ"
	crossorigin="anonymous">
</head>
<body>
	<div style="margin:50px;width: 30%; hight: auto; overflow: hidden;">
		<form action="memberPage" name=loginForm method="post">
			<fieldset>
				<legend>Login</legend>

				<div class="form-group">
					<label for="memberId" class="form-label mt-4">ID</label> 
						<input type="email" class="form-control" id="memberId"
						name="memberId"
						placeholder="id"> 
				</div>
				<div class="form-group">
					<label for="memberPw" class="form-label mt-4">Password</label>
					<input type="password" class="form-control" id="memberPw"
						name="memberPw" placeholder="Password">
				</div>

				<input type="button" class="btn btn-primary" onclick='doLogin()' value="Login">
				<input type="button" class="btn btn-primary" onclick='location.href="insert"'  value="Sign-Up">	
			</fieldset>
		</form>
	</div>

</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
	function doLogin(){
		var form = document.loginForm;
		let loginCheck = false;
		
		if(!form.memberId.value){
			form.memberId.focus();
			Swal.fire({
				  icon: 'error',
				  text: '아이디를 입력해주세요!'
				});
			return;
		}
		if(!form.memberPw.value){
			form.memberPw.focus();
			Swal.fire({
				  icon: 'error',
				  text: '비밀번호를 입력해주세요!'
				});
			return;
		}
		
		$.ajax({
			url:"loginCheck",
			type:"POST",
			data: {"memberId": $('#memberId').val(),"memberPw":$('#memberPw').val()},
			success: function(result){
				if(result=="false"){
					Swal.fire({
						  icon: 'error',
						  text: '아이디 비밀번호를 확인해주세요!'
						});
					loginCheck = false;
				}
				else{
					loginCheck = true;
					form.submit();
				}
			}
		});
		
	}	

</script>
</html>