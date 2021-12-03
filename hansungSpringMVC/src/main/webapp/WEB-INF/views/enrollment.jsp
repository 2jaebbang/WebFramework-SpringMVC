<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<title>수강 신청</title>
</head>
<body>
	<div class="card border-primary container">
		<div class="main">
			<div class="homeLink">
				<a href="${pageContext.request.contextPath}">Home</a>
			</div>
			<h1>수강 신청</h1>
			<sf:form method="post"
				action="${pageContext.request.contextPath}/verifyEnrollment"
				modelAttribute="subject"  accept-charset="UTF-8">
				<table class="table table-striped" id="mytable">
					<tr>
						<td>년도</td>
						<td>${subject.year}</td>
					</tr>
					<tr>
						<td>학기</td>
						<td>${subject.semester}</td>
				</tr>
					<tr>
						<td>교과코드</td>
						<td><sf:input type="text" path="course_id" /><br /> <sf:errors
								path="course_id" class="error" /></td>
					</tr>
					<tr>
						<td>교과목명</td>
						<td><sf:input type="text" path="title" /><br /> <sf:errors
								path="title" class="error" /></td>
					</tr>
					<tr>
						<td>교과구분</td>
						<td><sf:input type="text" path="category" /><br /> <sf:errors
								path="category" class="error" /></td>
					</tr>
					<tr>
						<td>담당교수</td>
						<td><sf:input type="text" path="professor" /><br /> <sf:errors
								path="professor" class="error" /></td>
					</tr>
					<tr>
						<td>학점</td>
						<td><sf:input type="text" path="credit" /> <br /> <sf:errors
								path="credit" class="error" /></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-info">신청</button>
				<p>
			</sf:form>
		</div>
	</div>
</body>
</html>