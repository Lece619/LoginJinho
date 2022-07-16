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
		<form name="joinForm" action="insertOk" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="memberId" class="form-label mt-4">ID</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="id" id="memberId" name="memberId">
					<button class="btn btn-primary" type="button" id="button-addon2" onclick='checkId()'>중복확인</button>
				</div>
			</div>


			<div class="form-group">
				<label for="password1" class="form-label mt-4">Password</label>
				<input type="password" class="form-control"
					id="password1" placeholder="Password" name="memberPw">
			</div>
			<div class="form-group">

				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword" 
						placeholder="Password 확인">
				</div>
				<span style="font-size: 1em" id="checkPw"> </span>	
			</div>
			
			<div class="form-group">
				<label class="col-form-label mt-4" for="inputDefault">이름</label> 
				<input
					type="text" class="form-control" placeholder="이름"
					id="inputDefault" name="memberName">
			</div>
			
			<div class="form-group">
				<label for="memberEmail" class="form-label mt-4">EMail</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Email" id="memberEmail" name="memberEmail">
					<button class="btn btn-primary" type="button" id="button-addon2" onclick="sendEmail()">인증하기</button>
				</div>
				<div id=emailDiv style="display: none;">
				<div  class="input-group mb-3">
					<input type="text" class="form-control" placeholder="인증번호 입력" id="emailCode" name="emailCode">
					<button class="btn btn-primary" type="button" id="button-addon2" onclick="confirmEmail()">확인하기</button>
				</div>
				<span style="margin-top: 0px">남은 시간 </span>
				<span id="setTime">3:00</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="address" class="form-label mt-4">우편번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="우편번호 입력해주세요" id="memberZipcode" name="memberZipcode">
					<button class="btn btn-primary" type="button" id="button-addon2" onclick="postCode()">주소찾기</button>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-form-label mt-4" for="inputDefault">주소</label>
			<input type="text" class="form-control" placeholder="주소" id="memberAddress" name="memberAddress">

			</div>
			<div class="form-group"><input
					type="text" class="form-control" placeholder="상세주소"
					id="memberAddressDetail" name="memberAddressDetail">
			</div>
			<div class="form-group">
			<input type="text" class="form-control" placeholder="기타주소" id="memberAddressEtc" name="memberAddressEtc">
			</div>
			
			
			<div class="form-group">
		    	<label for="formFile" class="form-label mt-4">프로필 사진 선택</label>
				<div  style="text-align: center; width: 100%">
				  <img id="preview" style="text-align:center; width: 50%;" alt="" src="resources/img/noImage.png">
				</div>
			    <input style="margin-top: 5px;"class="form-control" type="file" id="profileImg" name="profileImg">
		    </div>	
			
			<div style="text-align: center">
			<input style="width: 45%" type="button" value="회원가입" class="btn btn-primary" onclick='join()'>
			<input style="width: 45%" type="button" value="취소하기" class="btn btn-primary" onclick="location.href='Main'">
			</div>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</html>