<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %> 

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
	<div class="container p-5 mt-5">
		<a href="/dashboard" class="link text-decoration-none float-end">Dashboard</a>
		<div class="form-group mt-5">
			<form:form action="/create" method="post" modelAttribute="song">
                <p>
                    <form:label path="title">Title: </form:label>
                    <form:errors path="title"/>
                    <form:input path="title" class="form-control"/>
                </p>
                <p>
                    <form:label path="artist">Artist: </form:label>
                    <form:errors path="artist"/>
                    <form:input path="artist" class="form-control"/>
                </p>
                <p>
                    <form:label path="rating">Rating(1-10): </form:label>
                    <form:errors path="rating"/>
                    <form:input type="number" path="rating" class="form-control"/>
                </p> 
	            <input type="submit" value="Add Song" class="btn btn-primary btn-lg mt-3"/>
       		</form:form>
		</div>
	</div>
</body>
</html>