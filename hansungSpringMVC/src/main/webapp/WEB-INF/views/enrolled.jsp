<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<title>수강 신청 완료</title>
</head>
<body>
	<div class="card border-primary container">
		<div class="main">
			<div class="homeLink">
				<a href="${pageContext.request.contextPath}">Home</a>
			</div>
			<h1 style="margin:30px 0px 30px 0px;">교과목 수강 신청이 완료되었습니다.</h1>
			
			<p>
				<button type="button" class="btn btn-primary btn-lg"
					onClick="location.href='${pageContext.request.contextPath}/enrollment'">수강
					신청하기</button>
			</p>
		</div>
	</div>
</body>
</html>