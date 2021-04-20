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
	<div class="container mt-5">
		<a href="/dashboard" class="link text-decoration-none float-end">Dashboard</a>
		<h6>Title: <c:out value="${playlist.title}"/></h6>
		<h6 class="mt-5">Artist: <c:out value="${playlist.artist}"/></h6>
		<h6 class="mt-5">Rating(1-10): <c:out value="${playlist.rating}"/></h6>
		<a href="/${playlist.id}/delete" class="btn btn-outline-danger mt-5">Delete</a>
	</div>
</body>
</html>