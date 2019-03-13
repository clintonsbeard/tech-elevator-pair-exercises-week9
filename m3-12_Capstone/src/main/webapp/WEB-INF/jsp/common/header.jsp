<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${pageTitle}"/> - Validation Exercises</title>
    <link href="<c:url value="/css/site.css"/>" rel="stylesheet" type="text/css" />
    <style type="text/css">
        label {
            display: block;
        }

        .form-control {
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div id="logo">
                <c:url value="/" var="home"/>
                <c:url value="img/logo.png" var="logo"/>
                <a href="${home}" class="navbar"><img src="${logo}"/></a>
            </div>
            <div id="navbar">
                <ul id="navbarList">
                    <li><a href="<c:url value="/"/>">Home</a></li>
                    <li><a href="<c:url value="/survey"/>">Survey</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container">