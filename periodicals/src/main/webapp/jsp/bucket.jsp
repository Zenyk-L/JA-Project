<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title><spring:message code="bucket.title" /></title>

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
			<h1><spring:message code="bucket.title" /></h1>
		</div>

		<div style="margin-left: 10%; display: flex; flex-wrap: wrap">

			<table class="table table-striped">
				<thead>
					<tr>
						<th><spring:message code="bucket.id" /></th>
						<th><spring:message code="bucket.name" /></th>
						<th><spring:message code="bucket.description" /></th>
						<th><spring:message code="bucket.price" /></th>
						<th><spring:message code="bucket.image" /></th>
						<th><spring:message code="bucket.action" /></th>
					</tr>
				</thead>

				<tbody>
						<c:forEach items="${bucketItems}" var="currentbucket">
							<tr>
								<td>${currentbucket.id}</td>
								<th>${currentbucket.periodical.name}</th>
								<th>${currentbucket.periodical.description}</th>
								<th>${currentbucket.periodical.price}</th>
								<th style="width:300px"><img src="data:image/jpg;base64, ${currentbucket.periodical.encodedImage}"
							alt="File not found" style="width: 30%"></th>
								<th> <a href="bucket?id=${currentbucket.id}"><spring:message code="bucket.delete" /></a></th>
							</tr>
						</c:forEach>

				</tbody>

			</table>

		</div>



	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>