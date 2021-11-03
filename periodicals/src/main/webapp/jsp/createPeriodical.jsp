<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><spring:message code="create_periodical.title" /></title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		var selItem = localStorage.getItem("locales");
		$('#locales').val(selItem ? selItem : 'en');
		$('#locales').change(function() {
			var selectedOption = $('#locales').val();
			if (selectedOption) {
				window.location.replace('?lang=' + selectedOption);
				localStorage.setItem("locales", selectedOption);
			}
		});

	});
</script>
</head>
<body>

	<div class="container">

		<!-- Sidebar -->
		<jsp:include page="sideBar.jsp"></jsp:include>

		<!-- Page Content -->
		<div class="w3-container w3-teal" style="margin-left: 10%">
			<h1><spring:message code="create_periodical.title" /></h1>
		</div>
		<div style="margin-left: 10%">

			<div class="w3-container">


				<form:form method="POST" action="${contextPath}/addPeriodical"
					enctype="multipart/form-data">
					<table>
						<tr>
							<td><spring:message code="bucket.name" /></td>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<td><spring:message code="bucket.description" /></td>
							<td><input type="text" name="description" /></td>
						</tr>
						<tr>
							<td><spring:message code="bucket.price" /></td>
							<td><input type="number" name="price" step="0.01" /></td>
						</tr>
						<tr>
							<td><spring:message code="create_periodical.select_image" /></td>
							<td><input type="file" name="image" /></td>
						</tr>
						<tr>
							<td><input type="submit" value="<spring:message code="create_periodical.submit" />" /></td>
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