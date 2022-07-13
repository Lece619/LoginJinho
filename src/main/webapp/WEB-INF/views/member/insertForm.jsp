<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/slate/bootstrap.min.css"
	integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ"
	crossorigin="anonymous">
</head>
<body>
	<div style="margin:0 auto; width: 30%; hight: auto; overflow: hidden;">
		<h1 style="text-align: center">회원 가입</h1>
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
				<label for="EMail" class="form-label mt-4">EMail</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Email" id="EMail" name="memberEmail">
					<button class="btn btn-primary" type="button" id="button-addon2">인증하기</button>
				</div>
			</div>
			
			<div class="form-group">
				<label for="address" class="form-label mt-4">우편번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="우편번호 입력해주세요" id="address" name="memberZipcode">
					<button class="btn btn-primary" type="button" id="button-addon2">주소찾기</button>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-form-label mt-4" for="inputDefault">주소</label>
			<input type="text" class="form-control" placeholder="주소" id="inputDefault" name="memberAddress">

			</div>
			<div class="form-group"><input
					type="text" class="form-control" placeholder="상세주소"
					id="inputDefault" name="memberAddressDetail">
			</div>
			<div class="form-group">
			<input type="text" class="form-control" placeholder="기타주소" id="inputDefault" name="memberAddressEtc">
			</div>
			
			<div class="form-group">
		      <label for="formFile" class="form-label mt-4">프로필 사진 선택</label>
		      <input class="form-control" type="file" id="formFile" name="profileImg">
		    </div>	
	
			<input type="button" value="회원가입" class="btn btn-primary" onclick='join()'>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	let idConfirm = false;
	var form = document.joinForm;
	
	//form submit 
	function join(){
		if(!idConfirm){
			alert("아이디 중복 확인 필요");
			return;
		}
		//유효성 검사
		
	}
	
	//중복확인
	function checkId(){
		
		//아이디 유효성 검사 
		
		$.ajax({
			url : "idCheck?memberId="+form.memberId.value,
			type : "GET",			
			success : function(result){
				if(result!="ok"){
					if(confirm("사용하시겠습니까?")){
						$('#memberId').attr("readonly",true);
						idConfirm = true;
					}	
				}else{
					alert("사용중인 아이디 입니다.");
				}
			}
		
		});
	}
	
	
	$('#floatingPassword').keyup(function(){
		let pass = $('#password1').val();
		let passCheck = $(this).val();

		if(passCheck==""){
			$('#checkPw').text("");
		}else{
			if(pass!=passCheck){
				$('#checkPw').text("비밀번호가 일치하지 않습니다");
				$("#checkPw").css("color","red");
			}else{
				$('#checkPw').text("");
			}
		}
	});
	
</script>

</html>