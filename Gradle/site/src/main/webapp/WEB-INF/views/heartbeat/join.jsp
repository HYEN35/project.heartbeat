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
                                <button type="button" class="btn-border">중복확인</button>
                            </div>
                            <p class="error pwd" style="display:none">*비밀번호는 특수문자, 숫자를 포함하여 8~16자로 구성되어야 합니다.</p>
                            <input type="password" name="pwd" placeholder="* 비밀번호" id="pwd" class="txtBx">
                            <p class="error pwdCheck" style="display:none">*입력하신 비밀번호가 틀립니다. 비밀번호를 확인하세요.</p>
                            <input type="password" name="pwdCheck" placeholder="* 비밀번호 확인" id="pwdCheck" class="txtBx">
                            <input type="text" name="name" placeholder="* 이름" class="txtBx">
                            <div class="birthBx">
                                <label for="birth">생년월일</label>
                                <input type="date" name="birth" id="birth" class="txtBx" value='2000-01-01'>
                            </div>
                            <div class="doubleCheck">
                                <input type="number" name="phone" placeholder="* 휴대폰번호" id="phone" class="txtBx">
                                <button type="button" class="btn-border">중복확인</button>
                            </div>
                            <div class="doubleCheck">
                                <input type="text" name="nickname" placeholder="* 닉네임" id="nickname" class="txtBx">
                                <button type="button" class="btn-border">중복확인</button>
                            </div>
                        </div>
                        <div class="inputBx">
                            <p class="noti">*선택 입력 사항</p>
                            <div class="imgBx">
                                <input type="file" id="file" accept=".jpg, .jpeg, .png" hidden>
                                <button type="button" class="btn-under" onclick="$('#file').click();">프로필 사진 선택</button>
                                <div class="fileName"><i>파일명이길어질때는말줄임표가나옵니다나옵니다나옵니다.png</i></div>
                            </div>
                        </div>
                        <button type="submit" class="btn-full">회원가입</button>
                    </form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dimmed" onclick="popAlertCheckHide()"></div>
	
	<!-- [D] 팝업 중복확인 -->
	<div class="popup pop-alert-check"><%@ include file="../popup/pop-alert-check.jsp" %></div>
</body>
</html>