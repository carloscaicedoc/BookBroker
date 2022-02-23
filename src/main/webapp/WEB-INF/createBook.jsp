<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Page BookBroker</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-10 mx-auto mt-5 ms-5">
		<div class="d-flex justify-content-between mt-4 border-bottom">
			<h2 class="ms-4">Add a Book to Your Shelf!</h2>
			<a href="/books" class="mt-2 me-2">Back to the Shelves</a>
		</div>
		<div class="col-6 ms-4 mt-4">
		<form:form action="/books/new" method="post" modelAttribute="book">
			<div class="mb-2">
				<form:label path="title" class="form-label">Title</form:label>
				<form:input path="title" type="text" class="form-control" />
				<form:errors path="title" class="text-danger" />
			</div>
			<div class="mb-2">
				<form:label path="author" class="form-label">Author</form:label>
				<form:input path="author" type="text" class="form-control" />
				<form:errors path="author" class="text-danger" />
			</div>
			<div class="mb-3">
				<form:label path="thoughts" class="form-label">My thoughts</form:label>
				<form:textarea path="thoughts" class="form-control" />
				<form:errors path="thoughts" class="text-danger" />
			</div>
			<button type="submit" class="btn btn-outline-primary">Submit</button>
		</form:form>
		</div>
	</div>

</body>
</html>