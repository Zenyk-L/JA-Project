<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Log in with your account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
 <link type="text/css"  href="login.css" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-teal">
<div class="wrapper fadeInDown ">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="https://player.slideplayer.com/16/4963010/data/images/img0.jpg" id="icon" alt="Login icon" />
    </div>
    
      <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">PERIODICALS</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="email" type="text" placeholder="Email" class="fadeIn second" 
                   autofocus value="user@gmail.com"/>
            <input name="password" type="password" placeholder="Password" class="fadeIn third " value="user"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <input class="fadeIn fourth w3-teal" type="submit" value="Log In"/>
        </div>

    </form>
    

    <!-- Remind Passowrd -->
    <div id="formFooter" class="w3-teal">
      <a class="underlineHover"  href="${contextPath}/registration" >Create an account</a>
    </div>

  </div>
</div>

	
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>