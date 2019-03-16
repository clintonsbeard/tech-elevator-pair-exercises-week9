<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="content">
	<div class="container-fluid">
		<div>
			<c:url value="img/parks/${park.code}.jpg" var="image"/>
			<img src="${image}" class="img-fluid img-thumbnail">
		</div>
		<div class="jumbotron">
			<h1><a href="${parkDetailURL}"><c:out value="${park.name}"/></a></h1>
			<h2><strong><c:out value="Located in:"/></strong> <c:out value="${park.state}"/></h2>
			<hr class="my-4">
			<p><c:out value="${park.parkDescription}"/></p>
			<blockquote class="blockquote text-center">
						<p class="mb-0"><c:out value="&quot;${park.inspirationalQuote}&quot;"/></p>
						<footer class="blockquote-footer"><cite>${park.inspirationalQuoteSource}</cite></footer>
			</blockquote>
			<hr class="my-4">
			<div class="container-fluid">
				<div class="row">
					<div class="col">
						<h3><c:out value="Acreage"/></h3>
						<p><c:out value="${park.formatNumberWithCommas(park.acreage)} acres"/></p>
						<h3><c:out value="Elevation"/></h3>
						<p><c:out value="${park.formatNumberWithCommas(park.elevationInFeet)} feet"/></p>
						<h3><c:out value="Miles of Trail"/></h3>
						<p><c:out value="${park.formatNumberWithCommas(park.milesOfTrail)} miles"/></p>
						<h3><c:out value="Number of Campsites"/></h3>
						<p><c:out value="${park.formatNumberWithCommas(park.numberOfCampsites)}"/></p>
					</div>
					<div class="col">
						<h3><c:out value="Climate"/></h3>
						<p><c:out value="${park.climate}"/></p>
						<h3><c:out value="Year Founded"/></h3>
						<p><c:out value="${park.yearFounded}"/></p>
						<h3><c:out value="Annual Visitor Count:"/></h3>
						<p><c:out value="${park.formatNumberWithCommas(park.annualVisitorCount)}"/></p>
						<h3><c:out value="Entry Fee:"/></h3>
						<p><c:out value="${park.entryFee}"/></p>
						<h3><c:out value="Number of Animal Species:"/></h3>
						<p><c:out value="${park.numberOfAnimalSpecies}"/></p>
					</div>
				</div>
			</div>
		</div>
		<div class="jumbotron">
			<div class="row">
				<c:forEach items="${weather}" var="dailyWeather">
					<div class="col">
						<c:out value="${dailyWeather.day}"/>
						<c:url var="tempURL" value="/switchTemperature">
							<c:param name="tempChoice" value="C"/>
							<c:param name="parkCode" value="${park.code}"/>
						</c:url>
						<a href="${tempURL}"><c:out value="Celsius"/></a>
						<c:url var="tempURL" value="/switchTemperature">
							<c:param name="tempChoice" value="F"/>
							<c:param name="parkCode" value="${park.code}"/>
						</c:url>
			       		<a href="${tempURL}"><c:out value="Fahrenheit"/></a>
						<c:choose>
							<c:when test="${tempChoice.equals('C')}">
								<fmt:formatNumber var="low" value="${(dailyWeather.lowTemperature - 32) / 1.8}" maxFractionDigits="0"/>
								<fmt:formatNumber var="high" value="${(dailyWeather.highTemperature - 32) / 1.8}" maxFractionDigits="0"/>
								<c:out value="Low: ${low}°C"/>
								<c:out value="High: ${high}°C"/>
							</c:when>
							<c:otherwise>
								<c:out value="Low: ${dailyWeather.lowTemperature}°F"/>
								<c:out value="High: ${dailyWeather.highTemperature}°F"/>
							</c:otherwise>
						</c:choose>
						<c:out value="${dailyWeather.forecast}"/>
					</div>
				</c:forEach>
			</div>
	  	</div>
	</div>
</div>
              
<%@ include file="common/footer.jsp" %>