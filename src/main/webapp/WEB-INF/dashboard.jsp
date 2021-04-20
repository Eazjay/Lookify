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
		<div class="w-25">
			<a href="/songs/new" class="link text-decoration-none">Add New</a>
			<a href="/search/topTen" class="link text-decoration-none float-end">Top Songs</a>
		</div>
		<div>
			<form action="/search" method="post" class="float-end border d-flex">
				<input type="text" name="artist" placeholder="search" class="form-control">
				<input type="submit" value="Search Artist" class="btn btn-primary">
			</form>
		</div>
		<table class="table table-striped border mt-5">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Artist</th>
					<th scope="col">Title</th>
					<th scope="col">Rating</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${playlist}" var="playlist">
					<tr>
						<td><c:out value="${playlist.id}"></c:out></td>
						<td><a href="/songs/${playlist.id}" class="text-decoration-none"><c:out value="${playlist.artist}"/></a></td>
						<td><c:out value="${playlist.title}" /></td>
						<td><c:out value="${playlist.rating}" /></td>
						<td>
							<a href="/${playlist.id}/delete"><button type="submit" class="btn btn-outline-danger">Delete</button></a>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>