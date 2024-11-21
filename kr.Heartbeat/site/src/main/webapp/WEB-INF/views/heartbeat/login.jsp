<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>
 
<body>
	<div class="inner service login">
        <div class="container">
            <div class="wrap">
                <h1 class="logo">HeartBeat</h1>
                <div class="loginCnt">
                    <form action="/signIn" method="post" name="loginForm" autocomplete="off">
                        <div id="id" class="item">
                            <p>이메일</p>
                            <input type="text" name="id" class="txtBx" placeholder="E-mail 입력">
                            <p class="error" style="display:none">이메일을 확인해주세요.</p>
                        </div>
                        <div id="password" class="item">
                            <p>비밀번호</p>
                            <input type="password" name="pwd" class="txtBx" placeholder="비밀번호 입력">
                            <p class="error" style="display:none">비밀번호를 확인해주세요.</p>
                        </div>
                        <button type="submit" id="btnLogin" class="btn-full en">Login</button>
                    </form>
                    <div class="btnBx">
                        <button type="button" id="findId" class="btn-under-01" onclick="popFindIdShow();">이메일 찾기</button>
                        <button type="button" id="findPwd" class="btn-under-01" onclick="popFindPasswordShow();">비밀번호 찾기</button>
                        <a href="/join" id="btnJoin" class="btn-under-01">회원가입</a>
                    </div>
                </div>
                <p class="line"><i>혹은</i></p>
                <div id="snsLogin" class="btnCnt">
                    <button type="button" class="login-google"><i class="fa-brands fa-google"></i></button>
                    <button type="button" class="login-spotify"><i class="fa-brands fa-spotify"></i></button>
                </div>
            </div>
        </div>
    </div>

	<div class="dimmed" onclick="popFindIdHide();popFindPasswordHide();"></div>

	<!-- [D] 팝업 아이디찾기 -->
	<div class="popup pop-find-id"><%@ include file="../popup/pop-find-id.jsp" %></div>
	<!-- [D] 팝업 비밀번호찾기 -->
	<div class="popup pop-find-password"><%@ include file="../popup/pop-find-password.jsp" %></div>

	<script>
		$(function(){
			//loginError();
		});
		
		//로그인 오류
 		function loginError(){
			if(request.getAttribute("error") != null){ 
				$('.error').css('display', 'block');
			}
		}

		//팝업 아이디찾기
		function popFindIdShow(){
			$('.pop-find-id').show();
			$('.dimmed').show();
		}
		function popFindIdHide(){
			$('.pop-find-id').hide();
			$('.dimmed').hide();
		}

		//팝업 비밀번호찾기
		function popFindPasswordShow(){
			$('.pop-find-password').show();
			$('.dimmed').show();
		}
		function popFindPasswordHide(){
			$('.pop-find-password').hide();
			$('.dimmed').hide();
		}

		//비밀번호, 아이디 찾기 결과 보기
		function resultShow(){
			var name = $("#findIdName").val();
			var birth = $("#findIdBirth").val();
			var phone = $("#findIdPhone").val();
			var resultEmail = "temp@email.com";
			

			if (name && birth && phone) {
				$("#emailFormBtn").submit();
				$(".resultCnt #userName").html(name)
				$(".resultCnt #findEmail").html(resultEmail)
				$('.resultCnt').show();
			} else {
				alert("모든 필드를 입력해 주세요.");
			}


			console.log(name, birth, phone)
		}
	</script>
</body>
</html>