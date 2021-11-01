<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"  uri="http://www.springframework.org/security/tags"%>


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
			<h1>Periodicals</h1>
		</div>

		<div style="margin-left: 10%; display: flex; flex-wrap: wrap">

			<c:if test="${not empty periodicals}">
				<c:forEach items="${periodicals}" var="currentPeriodical">

					<div class="w3-card-4" style="width: 20%; margin: 2%">
						<img
							src="data:image/jpg;base64, ${currentPeriodical.encodedImage}"
							alt="File not found" style="width: 100%">
						<div class="w3-container w3-center">
							<h3>${currentPeriodical.name}</h3>
							<p>${currentPeriodical.description}</p>
							<p>${currentPeriodical.price}</p>
						</div>

						<security:authorize access="hasRole('ROLE_USER')">
							<form:form action="${contextPath}/bucket" method="POST"
								enctype="multipart/form-data">

								<input type="hidden" class="form-control" name="periodicalId"
									value="${currentPeriodical.id}">
								<input type="submit" class="w3-button w3-block w3-dark-grey"
									value="+ add to bucket">

							</form:form>
						</security:authorize>


					</div>


				</c:forEach>
			</c:if>
		</div>



	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>