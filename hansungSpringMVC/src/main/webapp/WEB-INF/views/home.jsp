<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<title>한성 학사 정보 시스템</title>
</head>
<body>
	<div class="card border-primary container">
		<div class="main">
			<p>
			<h1 style="font-size: 60px">한성 학사 정보 시스템</h1>
			<div
				style="text-align: center ; border: 2px solid black; margin: 30px 100px 40px 100px;">
				<p style="margin: 16px 0px 16px 0px;">한성대학교 입학 후 현재까지의 수강 교과목 내역을 조회 할 수 있습니다.</p>
				<p>수강 교과목 내역은 년도&학기 별로 분류되어 있습니다.</p>
				<p>2022년 1학기 수강신청을 진행 할 수 있습니다.</p>
				<p>서비스를 이용하기 위해서는 로그인이 필요합니다.</p>
			</div>

			<p>
				<button type="button" class="btn btn-primary btn-lg"
					onClick="location.href='${pageContext.request.contextPath}/subjects'">학기별
					이수 학점 조회</button>
			</p>
			<p>
				<button type="button" class="btn btn-primary btn-lg"
					onClick="location.href='${pageContext.request.contextPath}/enrollment'">수강
					신청하기</button>
			</p>
			<p>
				<button type="button" class="btn btn-primary btn-lg"
					onClick="location.href='${pageContext.request.contextPath}/readEnrollment'">수강
					신청 조회</button>
			</p>

			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a href="javascript:document.getElementById('logout').submit()"
					class="btn btn-danger btn-lg active" role="button">로그아웃</a>
			</c:if>
			<form id="logout" action="<c:url value="/logout" />" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</div>

</body>
</html>
