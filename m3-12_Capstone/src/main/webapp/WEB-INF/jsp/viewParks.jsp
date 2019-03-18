<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="content">
	<c:forEach items="${parks}" var="park">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 view-parks">
					<c:url var="parkDetailURL" value="/switchTemperature">
	                	<c:param name="parkCode" value="${park.code}"/>
	                </c:url>
					<c:url value="img/parks/${park.code}.jpg" var="image"/>
					<a href="${parkDetailURL}"><img src="${image}" class="image img-fluid img-thumbnail"></a>
				</div>
				<div class="col-lg-6">
					<div class="jumbotron park-card">
						<h1><a href="${parkDetailURL}"><c:out value="${park.name}"/></a></h1>
						<h2><strong>Located in:</strong> <c:out value="${park.state}"/></h2>
						<hr class="my-4">
						<p id=description><c:out value="${park.parkDescription}"/></p>
						<p class="lead">
					    	<a class="btn btn-dark btn-lg" href="${parkDetailURL}" role="button">Learn more</a>
					  	</p>
				  	</div>
				</div>
			</div>
		</div>
		<hr class="my-3">
	</c:forEach>
</div>
                
<%@ include file="common/footer.jsp" %>