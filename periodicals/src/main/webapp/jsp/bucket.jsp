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
			<h1>Bucket</h1>
		</div>

		<div style="margin-left: 10%; display: flex; flex-wrap: wrap">

			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Image</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
						<c:forEach items="${bucketItems}" var="currentbucket">
							<tr>
								<td>${currentbucket.id}</td>
								<th>${currentbucket.periodical.name}</th>
								<th>${currentbucket.periodical.description}</th>
								<th>${currentbucket.periodical.price}</th>
								<th><img src="data:image/jpg;base64, ${currentbucket.periodical.encodedImage}"
							alt="File not found" style="width: 30%"></th>
								<th> <a href="bucket?id=${currentbucket.id}">delete</a></th>
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