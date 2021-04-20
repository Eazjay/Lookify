<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<title>Lookify</title>
</head>
<body>
	<div class="container mt-5 w-75">
		<a href="/dashboard" class="link text-decoration-none float-end">Dashboard</a>
		<h2 class="m-5"><u>Top Ten Songs</u></h2>
		<ul class="list-group list-group-flush border w-50 mx-5">
			<c:forEach items="${playlist}" var="playlist">
				<li class="list-group-item list-style-type-none mt-3">${playlist.rating} - <a href="/songs/${playlist.id}" class="text-decoration-none">${playlist.title}</a> - ${playlist.artist}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>