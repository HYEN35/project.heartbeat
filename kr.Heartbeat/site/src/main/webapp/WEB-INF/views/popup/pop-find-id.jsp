<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrap">
	<div class="topArea">
		<div class="title">이메일 찾기</div>
		<button type="button" class="btn-i-close" onclick="popFindIdHide();"></button>
	</div>
	<div class="cntArea">
		<div class="findCnt">
			<form acrtion="/member/loign/findEmail" method="post" name="findEmailForm" autocomplete="off">
				<input type="text" class="txtBx" name="name" id="findIdName" placeholder="이름 입력">
				<input type="number" class="txtBx" name="birth" id="findIdBirth" placeholder="생년월일 8글자 입력">
				<input type="number" class="txtBx" name="phone" id="findIdPhone" placeholder="핸드폰번호 입력">
				<button type="button" class="btn-border" id="emailFormBtn" onclick="resultShow();">이메일 찾기</button>
			</form>
		</div>
		<div class="resultCnt">
			<p class="txt">
				<i id="userName">홍길동</i>님의 이메일은 <br><i id="findEmail">abcd@google.com</i>입니다.
			</p>
		</div>
	</div>
</div>