<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="container">
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
			<c:out value="${park.state}"/>
			<c:out value="${park.acreage}"/>
			<c:out value="${park.elevationInFeet}"/>
			<c:out value="${park.milesOfTrail}"/>
			<c:out value="${park.numberOfCampsites}"/>
			<c:out value="${park.climate}"/>
			<c:out value="${park.yearFounded}"/>
			<c:out value="${park.annualVisitorCount}"/>
			<c:out value="${park.inspirationalQuote}"/>
			<c:out value="${park.inspirationalQuoteSource}"/>
			<c:out value="${park.entryFee}"/>
			<c:out value="${park.numberOfAnimalSpecies}"/>
			<hr>
			
			<c:forEach items="${weather}" var="dailyWeather">
				<c:out value="${dailyWeather.day}"/>
				<c:out value="${dailyWeather.highTemperature}"/>
				<c:out value="${dailyWeather.lowTemperature}"/>
				<c:out value="${dailyWeather.forecast}"/>
				<c:choose>
					<c:when test="${dailyWeather.forecast == 'rain'}">
						<c:out value="Pack rain gear and waterproof shoes!"/>
					</c:when>
					<c:when test="${dailyWeather.forecast == 'thunderstorms'}">
						<c:out value="Seek shelter and avoid hiking on exposed ridges!"/>
					</c:when>
					<c:when test="${dailyWeather.forecast == 'snow'}">
						<c:out value="Pack snow shoes!"/>
					</c:when>
					<c:when test="${dailyWeather.forecast == 'sunny'}">
						<c:out value="Pack sunblock!"/>
					</c:when>
					<c:when test="${dailyWeather.highTemperature > 75}">
						<c:out value="Bring an extra gallon of water!"/>
					</c:when>
					<c:when test="${dailyWeather.highTemperature - dailyWeather.lowTemperature > 20}">
						<c:out value="Wear breathable layers!"/>
					</c:when>
					<c:when test="${(dailyWeather.highTemperature < 20) || (dailyWeather.lowTemperature < 20)}">
						<c:out value="Danger!  Frigid temperatures!"/>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>
                
<%@ include file="common/footer.jsp" %>