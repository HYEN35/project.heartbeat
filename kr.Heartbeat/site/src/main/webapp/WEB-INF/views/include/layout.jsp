<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

    String pageName = (String) request.getAttribute("pageName");
    String pageTitle = (String) request.getAttribute("pageTitle");
	String pageRequest = request.getRequestURI();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title><%=pageName %></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="title" content="HeartBeat">
	<meta name="description" content="당신의 심장을 뛰게 하는 음악 사이트, It makes your HeartBeat">
	<meta name="keywords" content="HeartBeat,음악스트리밍,음악검색,음악듣기,팬커뮤니티,팬소통,팬소통앱,팬커뮤니티소통앱">
	<meta name="og:title" content="HeartBeat">
	<meta name="og:url" content="heartbeat.kr/">
	<meta name="og:site_name" content="HeartBeat">
	<meta name="og:description" content="당신의 심장을 뛰게 하는 음악 사이트, It makes your HeartBeat">
	<meta name="og:image" content="#none">
	<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/css/font.css">
	<link rel="stylesheet" type="text/css" href="/css/common.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script src="https://kit.fontawesome.com/dda279453f.js"></script>
	<script src="/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/js/common.js"></script>
</head>