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
<title>Display Book</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-10 mx-auto mt-5 ms-5">
		<div class="d-flex justify-content-between mt-4 border-bottom">
			<h2 class="ms-4">
				<c:out value="${ book.title }"></c:out>
			</h2>
			<div>
				<a href="/books" class="btn btn-outline-success mb-3">Back to
					the Shelves</a>
			</div>
		</div>
		<div class="d-flex mt-5 ms-3">
			<c:choose>
				<c:when test="${book.creator.id == userId}">
					<h4>
						<span class="text-danger">You</span> read <span class="text-light">:</span>
					</h4>
				</c:when>
				<c:otherwise>
					<h4>
						<span class="text-danger"> ${book.creator.userName}</span> read <span
							class="text-light">:</span>
					</h4>
				</c:otherwise>
			</c:choose>
			<h4>
				<span class="text-secondary">${book.title}</span> by <span
					class="text-success">${book.author}</span>
			</h4>
		</div>
		<div class="ms-3 mb-3">
			<c:choose>
				<c:when test="${book.creator.id == userId}">
					<p>Here are your thoughts...</p>
				</c:when>
				<c:otherwise>
					<p>Here are ${book.creator.userName}'s thoughts...</p>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-6 border-top border-bottom ms-5 pt-3 mb-3">
			<p>${book.thoughts}</p>
		</div>
		<div class="d-flex col-6 justify-content-end">
			<c:choose>
				<c:when test="${book.creator.id == userId}">
					<a href="/books/${book.id}/edit" class="btn btn-outline-dark ms-5 py-1 px-1">Edit
						Book</a>				
				</c:when>
			</c:choose>
		</div>
		<div class="d-flex col-6 justify-content-start">
			<c:choose>
				<c:when test="${book.creator.id == userId}">
					<form action="/books/${book.id}/delete" method="post">
						<input type="hidden" name="_method" value="delete" /> <input
							type="submit" value="Delete"
							class="btn btn-outline-danger py-1 px-2 ms-4" />
					</form>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>