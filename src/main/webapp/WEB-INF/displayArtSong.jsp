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
		<table class="table table-striped border mt-3">
			<thead>
				<tr>
					<th scope="col">Title</th>
					<th scope="col">Rating</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${playlist}" var="song">
					<tr>
						<td><a href="/songs/${song.id}" class="text-decoration-none"><c:out value="${song.title}"/></a></td>
						<td><c:out value="${song.rating}" /></td>
						<td>
							<a href="/${song.id}/delete" class="btn btn-outline-danger">Delete</a>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>