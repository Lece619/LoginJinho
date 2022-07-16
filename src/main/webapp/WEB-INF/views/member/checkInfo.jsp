<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/slate/bootstrap.min.css"
	integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ"
	crossorigin="anonymous">
</head>
<body>
	<div style="margin:0 auto; width: 30%; hight: auto; overflow: hidden;">
		<h1 style="text-align: center">회원 정보 확인</h1>
		
			<div class="form-group">
				<div  style="text-align: center; width: 100%">
				  <img id="preview" style="text-align:center; width: 50%;" alt="" src="resources/upload/${memberVO.imgName}">
				</div>
			</div>
			
			
	<div class="card text-white border-light mb-3" style="width: 100%;">
	  <div class="card-header">회원 ID
	  <h4 style="text-align: right" class="card-title">${memberVO.memberId}</h4>	</div>
	</div>		
	<div class="card text-white border-light mb-3" style="width: 100%;">
	  <div class="card-header">이름
	  <h4 style="text-align: right" class="card-title">${memberVO.memberName}</h4>	</div>
	</div>		
	<div class="card text-white border-light mb-3" style="width: 100%;">
	  <div class="card-header">이메일
	  <h4 style="text-align: right" class="card-title">${memberVO.memberEmail}</h4>	</div>
	</div>		
	<div class="card text-white border-light mb-3	" style="width: 100%;">
	  <div class="card-header">주소
	  <p style="text-align: right">${memberVO.memberZipcode }</p>
	  <h5 style="text-align: left" class="card-title">${memberVO.memberAddress} ${memberVO.memberAddressDetail} ${memberVO.memberAddressEtc}</h5>	
	  </div>
	</div>			
	<div style="text-align: center;">
	<button style="width:45%;" type="button" class="btn btn-light ">Logout</button>
	<button style="width:45%;" type="button" class="btn btn-light">ChangInfo</button>
	</div>		
		
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</html>