<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<body>
	<div class="inner service join">
		<div class="container">
			<div class="wrap">
				<h1 class="logo">HeartBeat</h1>
				<div class="joinCnt">
					<form action="/signUp" method="post" name="joinForm" autocomplete="off" id="joinForm">
						<div class="inputBx">
							<p class="noti">*필수 입력 사항</p>
							<div class="doubleCheck">
								<input type="text" name="email" placeholder="* 이메일" id="email" class="txtBx">
								<button type="button" class="btn-border" onclick="popAlertCheckShow('email');">중복확인</button>
							</div>
							<p class="error pwd" style="display:none">*비밀번호는 특수문자, 숫자를 포함하여 8~16자로 구성되어야 합니다.</p>
							<input type="password" name="pwd" placeholder="* 비밀번호" id="pwd" class="txtBx">
							<p class="error pwdCheck" style="display:none">*입력하신 비밀번호가 틀립니다. 비밀번호를 확인하세요.</p>
							<input type="password" name="pwdCheck" placeholder="* 비밀번호 확인" id="pwdCheck" class="txtBx">
							<input type="text" name="name" placeholder="* 이름" id="name" class="txtBx">
							<div class="birthBx">
								<label for="birth">생년월일</label>
								<input type="date" name="birth" id="birth" class="txtBx" value='2000-01-01'>
							</div>
							<div class="doubleCheck">
								<input type="number" name="phone" placeholder="* 휴대폰번호" id="phone" class="txtBx">
								<button type="button" class="btn-border" onclick="popAlertCheckShow('phone');">중복확인</button>
							</div>
							<div class="doubleCheck">
								<input type="text" name="nickname" placeholder="* 닉네임" id="nickname" class="txtBx">
								<button type="button" class="btn-border" onclick="popAlertCheckShow('nickname');">중복확인</button>
							</div>
						</div>
						<div class="inputBx">
							<p class="noti">*선택 입력 사항</p>
							<div class="imgBx">
								<input type="file" id="file" name="profileImg" accept=".jpg, .jpeg, .png" hidden>
								<button type="button" class="btn-under" onclick="$('#file').click();">프로필 사진 선택</button>
								<div class="fileName"><i>파일명이길어질때는말줄임표가나옵니다나옵니다나옵니다.png</i></div>
							</div>
						</div>
						<button type="button" class="btn-full" onclick="validityCheck();">회원가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dimmed" onclick="popAlertCheckHide()"></div>
	
	<!-- [D] 팝업 중복확인 -->
	<div class="popup pop-alert-check"><%@ include file="../popup/pop-alert-check.jsp" %></div>

	<script>
		//정규식 패턴
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		var phonePattern = /^010\d{8}$/;
		var passwordPattern = /^(?=.*[!@#$%^&*()_+|<>?:{}\-])[A-Za-z\d!@#$%^&*()_+|<>?:{}\-]{8,16}$/;

		//중복확인 클릭 여부
		var isEmailChecked = false;
		var isPhoneChecked = false;
		var isNicknameChecked = false;

		//중복확인 클릭
		function popAlertCheckShow(field){
			//입력값 받기
			var valueData = $("#" + field).val();

			//null값으로 중복확인 클릭 했을 때
			function validateInput(field, value) {
				if (value == "") {
					alert(field + "을 입력하세요");
					$("#" + field).focus();
					return false;
				}

				return true;
			}

			if(field === 'email'){
				isEmailChecked = true;

				if(!validateInput(field, valueData)) return false;
				else if(!emailPattern.test(valueData)){ //이메일 형식이 틀렸을 때 
					alert("이메일 형식이 잘못되었습니다. 예시: test@gmail.com");
					$("#email").focus();
            		return false;
				}
			} else if (field === 'phone') {
				isPhoneChecked = true;
				
				if (!validateInput(field, valueData))return false;
				else if (!phonePattern.test(valueData)) {
					alert("핸드폰 번호 형식이 잘못되었습니다. 예시: 01012345678");
					$("#phone").focus();
					return false;
				}


			} else if (field === 'nickname') {
				isNicknameChecked = true;
		
				if (!validateInput(field, valueData)) return false;
			}

			$.ajax({
				url: '/member/double-check',  // 요청할 URL
				method: 'GET',
				data: {
					field: field,
					value: valueData  // 값을 field와 함께 전송
				},
				success: function(response) {
					$('.pop-alert-check').show();
					$('.dimmed').show();

					if (response === "중복된 값입니다.") {
						$('.pop-alert-check .msg').html("<i>" + valueData + "</i> 은/는 <br>이미 사용 중입니다.");
					} else {
						$('.pop-alert-check .msg').html("<i>" + valueData + "</i> 은/는 <br>사용 가능합니다.");
					}
				},
				error: function() {
					alert("중복 확인 요청에 실패했습니다.");
				}
			});
		}
		function popAlertCheckHide(){
			$('.pop-alert-check').hide();
			$('.dimmed').hide();
		}

		//비밀번호 유효성 검사
		function validatePwd(pwd) {
			if (!passwordPattern.test(pwd)) {
				alert("비밀번호는 최소 8자 이상, 영문, 특수문자, 숫자 조합이어야 합니다.");
				$("#pwd").focus();
				return false;
			}
			return true;
		}

		// 회원가입 유효성 검사
		function validityCheck() {
			var email = $("#email").val();
			var pwd = $("#pwd").val();
			var pwdCheck = $("#pwdCheck").val();
			var name = $("#name").val();
			var birth = $("#birth").val();
			var phone = $("#phone").val();
			var nickname = $("#nickname").val();
			var profileImg = $("#file")[0].files[0];

			// 이메일 유효성 검사
			if (email == "") {
				alert("이메일을 입력하세요");
				$("#email").focus();
				return false;
			} else if (!emailPattern.test(email)) {
				alert("이메일 형식이 잘못되었습니다. 예시: test@test.com");
				$("#email").focus();
				return false;
			}
			if (!isEmailChecked) {
				alert("이메일 중복 확인을 해주세요");
				return false;
			}

			// 비밀번호 유효성 검사
			if (pwd == "") {
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
			if (!validatePwd(pwd)) {
				return false;
			}

			// 비밀번호 확인 검사
			if (pwdCheck == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#pwdCheck").focus();
				return false;
			} else if (pwd !== pwdCheck) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#pwdCheck").focus();
				return false;
			}

			// 이름 유효성 검사
			if (name == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			}

			// 핸드폰 번호 유효성 검사
			if (phone == "") {
				alert("핸드폰번호를 입력하세요");
				$("#phone").focus();
				return false;
			} else if (!phonePattern.test(phone)) {
				alert("핸드폰 번호 형식이 잘못되었습니다. 예시: 01012345678");
				$("#phone").focus();
				return false;
			}
			if (!isPhoneChecked) {
				alert("핸드폰 번호 중복 확인을 해주세요");
				return false;
			}

			// 닉네임 유효성 검사
			if (nickname == "") {
				alert("닉네임을 입력하세요");
				$("#nickname").focus();
				return false;
			}
			if (!isNicknameChecked) {
				alert("닉네임 중복 확인을 해주세요");
				return false;
			}

			//회원가입 폼 검사

			var formData = new FormData();

			formData.append("email", email);
			formData.append("pwd", pwd);
			formData.append("name", name);
			formData.append("birth", birth);
			formData.append("phone", phone);
			formData.append("nickname", nickname);

			if (profileImg) {
				formData.append("profileImg", profileImg); // 프로필 이미지 파일 추가
			}

			// AJAX 요청
			$.ajax({
				url: '/signUp',  // 회원가입 요청을 처리할 URL
				method: 'POST',
				data: formData,
				contentType: false,
				processData: false, // jQuery가 데이터 처리하지 않도록
				success: function(response) {
					if (response === "회원가입 성공") {
						alert("Welcome HeartBeat! 로그인 후 서비스를 이용하세요!");
						window.location.href = "/login";  // 회원가입 후 로그인 페이지로 이동
					} else {
						alert("회원가입에 실패했습니다. 양식을 확인 후 다시 가입해주세요.\n" + response);
					}
				},
				error: function() {
					alert("회원가입 요청에 실패했습니다.");
				}
			});

			return false;  // 기본 폼 제출 방지
		};
	</script>
</body>
</html>