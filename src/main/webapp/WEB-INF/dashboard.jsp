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
<title>BookBroker Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="col-9 mx-auto mt-4">
	<div class="d-flex justify-content-between">
		<h4 class="ms-2 text-dark">
			Hello,
			<c:out value=" ${ user.userName }"></c:out>
			Wellcome to ...
		</h4>
		<div>
			<a href="/logout" class="btn btn-outline-dark mt-2">Logout</a>
		</div>
	</div>
	<h1 class="text-primary">The Book Broker!</h1>
	<div class="d-flex justify-content-between mt-4">
		<h5 class="ms-2">Books from everyone's shelves.</h5>
		<a href="/books/new" class="btn btn-outline-primary mb-3">+ add Book to my shelf!
		</a>
	</div>

	<table
		class="table table-striped border-top mb-5">
		<thead class="text-center">
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Owner</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody class="bg-light text-center">
			<c:forEach var="book" items="${ allBooks }">
				<tr>
					<td><c:out value="${ book.id }"></c:out></td>
					<td><a href="/books/${ book.id }"><c:out
								value="${ book.title }"></c:out></a></td>
					<td><c:out value="${ book.author }"></c:out></td>
					<td><c:out value="${ book.creator.userName }"></c:out></td>
					<td><c:choose>
							<c:when test="${book.creator.id == user.id}">
								<div class="d-flex gap-1 justify-content-center">
									<a href="/books/${book.id}/edit"
										class="btn btn-outline-primary py-0 px-1">Edit</a>
									<form action="/books/${book.id}/delete" method="post">
										<input type="hidden" name="_method" value="delete" /> <input
											type="submit" value="Delete" class="btn btn-outline-danger py-0 px-1" />
									</form>
								</div>
							</c:when>
							<c:otherwise>
								<form action="/books/checkout" method="post">
									<input type="hidden" name="_method" value="put" /> <input
										type="hidden" name="bookId" value="${book.id}" /> <input
										type="submit" value="Check Out"
										class="btn btn-outline-primary py-0 px-1 me-0" />
								</form>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${user.borrowedBooks.size() != 0}">
        <div class="d-flex flex-column align-items-center mt-5">
            <h5>Books I'm Borrowing:</h5>
            <table class="table table-striped w-75 mx-auto border-top mt-1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Owner</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${user.borrowedBooks}">
                        <tr>
                            <td>${book.id}</td>
                            <td><a href="/books/${book.id}">${book.title}</a></td>
                            <td>${book.author}</td>
                            <td>${book.creator.userName}</td>
                            <td>
                                <form action="/books/return" method="post">
                                    <input type="hidden" name="_method" value="put" />
                                    <input type="hidden" name="bookId" value="${book.id}" />
                                    <input type="submit" value="Return" class="btn btn-outline-danger py-0 px-1" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</body>
</html>