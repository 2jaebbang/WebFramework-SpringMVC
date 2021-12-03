<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<title>학기별 이수 학점 조회</title>
</head>
<body>
	<div class="card border-primary container">
		<div class="main">
			<div class="homeLink">
				<a href="${pageContext.request.contextPath}">Home</a>
			</div>
			<h1>학기별 이수 학점 조회</h1>
			<table class="table table-striped" id="mytable">
				<thead>
					<tr class="table-success">
						<th>년도</th>
						<th>학기</th>
						<th>취득 학점</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalCredit" value="0" />
					<c:forEach var="yearAndSemester" items="${yearAndSemesters}">
						<tr>
							<td><c:out value="${yearAndSemester.year}"></c:out></td>
							<td><c:out value="${yearAndSemester.semester}"></c:out></td>
							<td><c:out value="${yearAndSemester.credit}"></c:out></td>
							<td><a
								href="${pageContext.request.contextPath}/detail?year=${yearAndSemester.year}&semester=${yearAndSemester.semester}">링크</a></td>
						</tr>
						<c:set var="totalCredit"
							value="${totalCredit+yearAndSemester.credit}" />
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="table-warning">
						<td>총합</td>
						<td></td>
						<td><c:out value="${totalCredit}"></c:out></td>
						<td></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>