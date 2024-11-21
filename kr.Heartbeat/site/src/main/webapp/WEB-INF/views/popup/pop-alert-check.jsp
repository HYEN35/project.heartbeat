<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrap">
	<form method="post" action="/member/double-check">
		<div class="topArea">
			<div class="title">중복확인</div>
			<button type="button" class="btn-i-close" onclick="popAlertCheckHide();"></button>
		</div>
		<div class="cntArea">
			<div class="messageBx">
				<p class="msg"><i id="valueData">입력값</i>은/는<br> 사용가능합니다.</p>
				<button type="button" class="btn-full" onclick="popAlertCheckHide();">확인</button>
			</div>
		</div>
	</form>
</div>