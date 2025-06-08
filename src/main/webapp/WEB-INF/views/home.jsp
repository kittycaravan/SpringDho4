<!-- 0. 웹 애플리케이션의 루트 경로(컨텍스트 경로) 를 가져와서 링크에 다 연결해줘야 함     -->		
<!-- 1. 0을 위한 준비. jstl core 태그 선언     -->		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<!-- 2. 0을 위한 준비. el 태그로 가져올 수 있는데 이걸 더 짧게 찍기위해 변수 대입함.     -->		
<c:set var="cp" value="${pageContext.request.contextPath}" /><!-- el변수 cp에 경로저장 -->		

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>대항해시대4 v0.0.1.4</title>
	<link rel="stylesheet" href="${cp}/resources/common.css">
</head>
<body>

<h1>대항해시대4</h1>

<fieldset>
	<legend>현재시간</legend>
	<P>${serverTime}</P>
</fieldset>
<fieldset>
	<legend>공지사항</legend>
	<p>aws ci cd 적용 후 이것저것 테스트 중입니다.</p>
</fieldset>

</body>
</html>
