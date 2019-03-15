<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div>
	<c:forEach items="${parks}" var="park">
		<div class="park">
			<div class="container-fluid">
				<c:url var="parkDetailURL" value="/switchTemperature">
                	<c:param name="parkCode" value="${park.code}"/>
                </c:url>
				<c:url value="img/parks/${park.code}.jpg" var="image"/>
				<a href="${parkDetailURL}"><img src="${image}" class="img-fluid img-thumbnail"></a>
			</div>
			<div class="jumbotron">
				<h1 class="display-4"><a href="${parkDetailURL}"><c:out value="${park.name}"/></a></h1>
				<hr class="my-4">
				<p class="lead"><c:out value="${park.parkDescription}"/></p>
				<p class="lead">
			    	<a class="btn btn-dark btn-lg" href="${parkDetailURL}" role="button">Learn more</a>
			  	</p>
			</div>
		</div>
	</c:forEach>
</div>
                
<%@ include file="common/footer.jsp" %>