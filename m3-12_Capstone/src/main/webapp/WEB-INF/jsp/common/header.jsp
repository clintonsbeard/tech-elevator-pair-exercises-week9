<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${pageTitle}"/> - National Park Geek</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div id="header" class="container-fluid">
		<c:url value="/" var="home"/>
		<c:url value="img/logo.png" var="logo"/>
		<a href="${home}"><img src="${logo}" class="img-fluid"/></a>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed-top" id="navbar">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a href="<c:url value="/"/>" class="nav-link">Home</a>
				</li>
				<li class="nav-item active">
					<a href="<c:url value="/survey"/>" class="nav-link">Survey</a>
				</li>
				<li class="nav-item active">
					<a href="<c:url value="/favoriteParks"/>" class="nav-link">Survey Results</a>
				</li>
			</ul>
		</div>
	</nav>
	<div id="content">
		<div class="container-fluid">