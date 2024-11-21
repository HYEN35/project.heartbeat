<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String menuPageRequest = request.getRequestURI();
	
	String chart = menuPageRequest.contains("/chart") ? "on" : "";
	String playlist = menuPageRequest.contains("/playlist") ? "on" : "";
	String community = menuPageRequest.contains("/community") ? "on" : "";
	String membership =	menuPageRequest.contains("/membership") ? "on" : "";
	String mypage =	menuPageRequest.contains("/mypage") ? "on" : "";
%>

<div id="menu" class="menu">
	<div class="wrap">
		<h1 class="logo"><a href="/chart">HeartBeat</a></h1>
		<div class="userCnt">
			<div class="user" onclick="dropMenuShow();">
				<div class="image"><img src="/img/profile/user.png" onerror=this.src="/img/user.png"></div>
				<div class="name">닉네임최대여덟자</div>
			</div>
			<div class="dropMenu">
				<button type="button" class="btn-under-02" onclick="popLogoutShow();">로그아웃</button>
			</div>
		</div>
		<div class="menuCnt">
			<ul>
				<li class="item">
					<a href="/chart" class="<%=chart %>"><i class="fa-brands fa-spotify"></i>차트</a>
				</li>
				<li class="item">
					<a href="/playlist" class="<%=playlist %>"><i class="fa-solid fa-icons"></i>플레이리스트</a>
				</li>
				<li class="item">
					<a href="/community" class="<%=community %> <%="artist".equals(request.getAttribute("artistPage")) ? "on" : "" %>"><i class="fa-solid fa-comment"></i>커뮤니티</a>
				</li>
				<li class="item">
					<a href="/membership" class="<%=membership %>"><i class="fa-solid fa-credit-card"></i>멤버십</a>
				</li>
				<li class="item">
					<a href="/mypage" class="<%=mypage %>"><i class="fa-solid fa-user-pen"></i>마이페이지</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- [D] 팝업 로그아웃-->
<div class="popup pop-alert-logout"><%@ include file="../popup/pop-alert-logout.jsp" %></div>