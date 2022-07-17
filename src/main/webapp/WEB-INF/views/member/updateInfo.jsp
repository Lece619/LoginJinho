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
		<h1 style="text-align: center">회원 정보 수정</h1>
		<form name="updateForm" action="updateInfo" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="memberId" class="form-label mt-4">ID</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" readonly="readonly" value="${member.memberId}" id="memberId" name="memberId">
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
					type="text" class="form-control" value="${member.memberName}"
					id="inputDefault" name="memberName" readonly="readonly">
			</div>
			
			<div class="form-group">
				<label for="memberEmail" class="form-label mt-4">EMail</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" value="${member.memberEmail}" id="memberEmail" name="memberEmail" readonly="readonly">
				</div>
				
			</div>
			
			<div class="form-group">
				<label for="address" class="form-label mt-4">우편번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" value="${member.memberZipcode }" id="memberZipcode" name="memberZipcode">
					<button class="btn btn-primary" type="button" id="button-addon2" onclick="postCode()">주소찾기</button>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-form-label mt-4" for="inputDefault">주소</label>
			<input type="text" class="form-control" value="${member.memberAddress}" id="memberAddress" name="memberAddress">

			</div>
			<div class="form-group"><input
					type="text" class="form-control" value="${member.memberAddressDetail}"
					id="memberAddressDetail" name="memberAddressDetail">
			</div>
			<div class="form-group">
			<input type="text" class="form-control" value="${member.memberAddressEtc}" id="memberAddressEtc" name="memberAddressEtc">
			</div>
			
			
			<div class="form-group">
		    	<label for="formFile" class="form-label mt-4">프로필 사진 선택</label>
				<div  style="text-align: center; width: 100%">
				  <img id="preview" style="text-align:center; width: 50%;" alt="" src="resources/upload/${member.imgName}">
				</div>
			    <input style="margin-top: 5px;"class="form-control" type="file" id="profileImg" name="profileImg">
			    <input type="hidden" name="imgName" value="${member.imgName}">
		    </div>	
			
			<div style="text-align: center">
			<input style="width: 45%" type="button" value="변경하기" class="btn btn-primary" onclick='update()'>
			<input style="width: 45%" type="button" value="취소하기" class="btn btn-primary" onclick='goMemberPage()'>
			</div>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	var form = document.updateForm;
	let pwConfirm = false;
	
	$('#floatingPassword').keyup(function(){
		let pass = $('#password1').val();
		let passCheck = $(this).val();

		if(passCheck==""){
			$('#checkPw').text("");
		}else{
			if(pass!=passCheck){
				$('#checkPw').text("비밀번호가 일치하지 않습니다");
				$("#checkPw").css("color","red");
				pwConfirm = false;
			}else{
				$('#checkPw').text("");
				pwConfirm = true;
			}
		}
	});
		
	$('#password1').blur(function(){
		
		
		
		let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(form.memberPw.value.length < 4 || form.memberPw.value.length > 12){
			alert("아이디는 4자 이상, 12자 이하로 입력해주세요.");
			
			return;
		}
		//같은문자를 4번 사용 오류
		if(/(\w)\1\1\1/.test(form.memberPw.value)){
			alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
			
			return;
		}
		
		//비밀번호 안에 아이디가 있을 때
		if(form.memberId.value && form.memberPw.value.search(form.memberId.value) != -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다.");
			
			return;
		}
		
		//비밀번호에 한글이 있으면 안된다form.password.value
		if(hangleCheck.test(form.memberPw.value)){
			alert("비밀번호에 한글을 사용할 수 없습니다.");
			return;
		}
		
		//비밀번호에 공백을 표현할 수 없다.
		if(form.memberPw.value.search(/\s/) != -1){ 
			alert("비밀번호에 공백은 사용할 수 없습니다.");	
			return;
		}
	} );
	
	//이미지 미리보기
	$('#profileImg').change(function(){
		var reader = new FileReader();
		reader.readAsDataURL(form.profileImg.files[0]);
		
		reader.onload = function(e){
			$('#preview').attr("src",e.target.result);
		};
	});
	
	/* 업데이트 */
	function update(){
		
		if(pwConfirm){
			form.submit();
		}else{
			alert("비밀번호를 제대로 입력해주세요.");
		}
		
	}
	
	/* 취소하기 */
	function goMemberPage(){
		form.action("memberPage");
		form.submit();
	}

</script>

<!-- 주소찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("memberAddressEtc").value = extraAddr;
                
                } else {
                    document.getElementById("memberAddressEtc").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberZipcode').value = data.zonecode;
                document.getElementById("memberAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memberAddressDetail").focus();
            }
        }).open();
    }
</script>

</html>