<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<title>상세보기</title>
</head>
<body>
	<div class="card border-primary container">
		<div class="main">
			<div class="homeLink">
				<a href="${pageContext.request.contextPath}">Home</a>
				<span>/</span>
				<a href="${pageContext.request.contextPath}/subjects">Back</a>
			</div>
			<h1>상세보기</h1>
			<table class="table table-striped" id="mytable">
				<thead>
					<tr class="table-success">
						<th>년도</th>
						<th>학기</th>
						<th>교과목명</th>
						<th>교과구분</th>
						<th>담당교수</th>
						<th>학점</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="subject" items="${subjects}">
						<tr>
							<td><c:out value="${subject.year}"></c:out></td>
							<td><c:out value="${subject.semester}"></c:out></td>
							<td><c:out value="${subject.title}"></c:out></td>
							<td><c:out value="${subject.category}"></c:out></td>
							<td><c:out value="${subject.professor}"></c:out></td>
							<td><c:out value="${subject.credit}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>