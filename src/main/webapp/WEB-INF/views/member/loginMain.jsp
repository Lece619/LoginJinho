<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/slate/bootstrap.min.css"
	integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ"
	crossorigin="anonymous">
</head>
<body>
	<div style="margin:50px;width: 30%; hight: auto; overflow: hidden;">
		<form method="post">
			<fieldset>
				<legend>Login</legend>

				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">ID</label> 
						<input type="email" class="form-control"
						name="memberId"
						placeholder="id"> 
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1" class="form-label mt-4">Password</label>
					<input type="password" class="form-control"
						name="memberPw" placeholder="Password">
				</div>

				<button type="submit" class="btn btn-primary">Login</button>
				<input type="button" class="btn btn-primary" onclick='location.href="insert"'  value="Sign-Up">	
			</fieldset>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</html>