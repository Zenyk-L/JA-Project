<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
 <link type="text/css"  href="login.css" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body class="w3-teal">

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<h2 class="form-signin-heading">Create your account</h2>

			<spring:bind path="firstName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="firstName" class="fadeIn first"
						placeholder="First name" autofocus="true"></form:input>
					<form:errors path="firstName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="lastName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="lastName" class="fadeIn second"
						placeholder="Last name" autofocus="true"></form:input>
					<form:errors path="lastName"></form:errors>
				</div>
			</spring:bind>


			<spring:bind path="email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="email" class="fadeIn third"
						placeholder="Email" autofocus="true"></form:input>
					<form:errors path="email"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="password" path="password" class="fadeIn third"
						placeholder="Password"></form:input>
					<form:errors path="password"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="passwordConfirm">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="password" path="passwordConfirm"
						class="fadeIn fourth" placeholder="Confirm your password"></form:input>
					<form:errors path="passwordConfirm"></form:errors>
				</div>
			</spring:bind>

			<input class="fadeIn fourth w3-teal" type="submit" value="CREATE"/>
		</form:form>

	 </div>
  
</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>