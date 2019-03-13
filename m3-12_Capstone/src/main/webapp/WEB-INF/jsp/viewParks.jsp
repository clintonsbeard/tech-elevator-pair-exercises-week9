<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="container">
	<c:forEach items="${parks}" var="park">
		<div class="park">
			<div>
				<c:url var="parkDetailURL" value="parkDetails">
                	<c:param name="parkCode" value="${park.code}"/>
                </c:url>
				<c:url value="img/parks/${park.code}.jpg" var="image"/>
				<a href="${parkDetailURL}"><img src="${image}"></a>
			</div>
			<div class="parkText">
				<h1><c:out value="${park.name}"/></h1>
				<c:out value="${park.parkDescription}"/>
			</div>
		</div>
	</c:forEach>
</div>
                
<%@ include file="common/footer.jsp" %>