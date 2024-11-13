<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="wrap">
	<div class="topArea">
		<button type="button" class="btn-i-close" onclick="popPostFanHide();"></button>
	</div>
	<div class="cntArea">
		<div class="postBx">
			<div class="arti-comment">
				<div class="arti-top">
					<div class="arti-profile"><img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="arti-thumb" alt="닉네임1"></div>
					<span class="arti-mark"><span class="blind">artist</span></span>
					<span class="arti-name">닉네임1</span>
					<span class="arti-date">24-10-19 14:21</span>
				</div>
				<div class="arti-cnt">
					<div class="txt">안녕하세요</div>
				</div>
			</div>
		</div>
		<div class="replyBx">
			<div class="top">
				<div class="count">
					<div class="comm"><i class="num">100</i>개의 댓글</div>
					<button type="button" class="btn-i-reset"><i class="fa-solid fa-rotate-right"></i></button>
				</div>
			</div>
			<div class="reply">
				<div class="list">
					<div class="postBx">
						<div class="fan-profile">
							<img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="fan-thumb" alt="닉네임1">
							<span class="nickname">닉네임2</span>
							<div class="date">24-10-19 15:32</div>
						</div>
						<div class="fan-comment">
							<div><div>너무 귀엽다~</div></div>
						</div>
					</div>
				</div>
				<div class="input">
					<input type="text" class="txtBx" placeholder="댓글을 입력하세요." autocomplete="off">
					<button type="button" class="btn-i-send"><i class="fa-regular fa-paper-plane"></i></button>
				</div>
			</div>
		</div>
	</div>
</div>