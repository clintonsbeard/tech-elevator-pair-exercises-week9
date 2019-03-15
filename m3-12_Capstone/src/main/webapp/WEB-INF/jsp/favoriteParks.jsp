<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="container">
	<c:forEach items="${favorites}" var="favorite">
		<div>
			<c:out value="${favorite.name}"/>
			<c:out value="${favorite.surveyCount}"/>
			<%-- <c:out value="${park.parkDescription}"/> --%>
		</div>
	</c:forEach>
</div>
                
<%@ include file="common/footer.jsp" %>