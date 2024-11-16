<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String menuPageRequest = request.getRequestURI();

	String summary = menuPageRequest.endsWith("summary.jsp") ? "on" : "";
    String member = menuPageRequest.endsWith("member.jsp") ? "on" : "";
    String post = menuPageRequest.endsWith("post.jsp") ? "on" : "";
    String comment =	menuPageRequest.endsWith("comment.jsp") ? "on" : "";
%>

<div id="menu" class="menu">
	<div class="wrap">
	    <h1 class="logo"><a href="${pageContext.request.contextPath}/chart">HeartBeat</a></h1>
	   	<div class="userCnt">
	   		<div class="user" onclick="dropMenuShow();">
	   			<div class="image"><img src="${pageContext.request.contextPath}/img/profile/user.png" onerror=this.src="${pageContext.request.contextPath}/img/user.png" alt="닉네임"></div>
	   			<div class="name">닉네임최대여덟자</div>
	   		</div>
	   		<div class="dropMenu">
	   			<button type="button" class="btn-under-02" onclick="popLogoutShow();">로그아웃</button>
	   		</div>
	   	</div>
	   	<div class="menuCnt">
	   		<ul>
	   			<li class="item"><a href="${pageContext.request.contextPath}/summary" class="<%=summary %>"><i class="fa-solid fa-house"></i>Summary</a></li>
	   			<li class="item"><a href="${pageContext.request.contextPath}/member" class="<%=member %>"><i class="fa-solid fa-users"></i>회원 리스트</a></li>
	   			<li class="item"><a href="${pageContext.request.contextPath}/post" class="<%=post %>"><i class="fa-solid fa-list-check"></i>게시글 확인</a></li>
	   			<li class="item"><a href="${pageContext.request.contextPath}/comment" class="<%=comment %>"><i class="fa-solid fa-comments"></i>댓글 확인</a></li>
	   		</ul>
	   	</div>
	</div>
</div>