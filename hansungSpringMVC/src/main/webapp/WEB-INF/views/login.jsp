
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<title>로그인</title>
</head>
<body>
	<div class="card border-primary container">
		<div class="main">
			<div class="homeLink">
				<a href="${pageContext.request.contextPath}">Home</a>
			</div>
			<h1>로그인</h1>
			<div class="form-group">
				<form method='POST' action="<c:url value="/login"/>">
					<c:if test="${not empty errorMsg }">
						<div style="color: #ff0000">
							<h5>${errorMsg }</h5>
						</div>
					</c:if>

					<c:if test="${not empty logoutMsg }">
						<div style="color: #0000ff">
							<h5>${logoutMsg }</h5>
						</div>
					</c:if>

					<div class="form-group">
						<div style="text-align: left; font-size: 19px;">Username</div>
						<input type="text" name="username" class="form-control"
							placeholder="Username">
					</div>
					<p>
					<div class="form-group">
						<div style="text-align: left; font-size: 19px;">Password</div>
						<input type="password" name="password" class="form-control"
							placeholder="Password">
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<p style="margin-top: 20px;">
						<button type="submit" class="btn btn-info">Sign in</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>