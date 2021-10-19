<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Periodicals</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<div class="container">

		<!-- Sidebar -->
		<jsp:include page="sideBar.jsp"></jsp:include>

		<!-- Page Content -->
		<div class="w3-container w3-teal" style="margin-left: 10%">
			<h1>Create new periodical</h1>
		</div>
		<div style="margin-left: 10%">

			<div class="w3-container">


				<form:form method="POST" action="${contextPath}/addPeriodical"
					enctype="multipart/form-data">
					<table>
						<tr>
							<td>Name</td>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<td>Description</td>
							<td><input type="text" name="description" /></td>
						</tr>
						<tr>
							<td>Price</td>
							<td><input type="number" name="price" step="0.01" /></td>
						</tr>
						<tr>
							<td>Select an image to upload</td>
							<td><input type="file" name="image" /></td>
						</tr>
						<tr>
							<td><input type="submit" value="Submit" /></td>
						</tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form>



			</div>

		</div>


	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>