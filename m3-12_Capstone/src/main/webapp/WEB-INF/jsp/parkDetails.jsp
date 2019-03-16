<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="content">
	<div class="container-fluid">
		<div>
			<c:url value="img/parks/${park.code}.jpg" var="parkImage"/>
			<img src="${parkImage}" class="img-fluid img-thumbnail">
		</div>
		<div class="jumbotron">
			<h1 class="display-4"><c:out value="${park.name}"/> <span class="badge badge-secondary badge-success"><c:out value="${park.code.toUpperCase()}"/></span></h1>
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
						<p><c:out value="${park.formatNumberWithCommas(park.numberOfCampsites)} campsites"/></p>
					</div>
					<div class="col">
						<h3><c:out value="Climate"/></h3>
						<p><c:out value="${park.climate}"/></p>
						<h3><c:out value="Year Founded"/></h3>
						<p><c:out value="${park.yearFounded}"/></p>
						<h3><c:out value="Annual Visitor Count:"/></h3>
						<p><c:out value="${park.formatNumberWithCommas(park.annualVisitorCount)} visitors"/></p>
						<h3><c:out value="Entry Fee:"/></h3>
						<p><c:out value="${park.formatMoney(park.entryFee)}"/></p>
						<h3><c:out value="Number of Animal Species:"/></h3>
						<p><c:out value="${park.numberOfAnimalSpecies} different animal species"/></p>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<c:forEach items="${weather}" var="dailyWeather" varStatus="loop">
					<c:choose>
						<c:when test="${loop.index == 0}">
							<div class="col-sm-3">
								<c:url value="img/weather/${dailyWeather.forecast}.png" var="weatherImage"/>
								<div class="thumbnail">
									<img src="${weatherImage}" class="img-fluid img-thumbnail">
										<div class="caption">
										<h1><c:out value="${dailyWeather.getDayOfTheWeek(dailyWeather.day)}"/></h1>
										<c:choose>
											<c:when test="${tempChoice.equals('C')}">
												<c:url var="tempURL" value="/switchTemperature">
													<c:param name="tempChoice" value="F"/>
													<c:param name="parkCode" value="${park.code}"/>
												</c:url>
												<h3><c:out value="Low: ${dailyWeather.conversionLowTempToCelsius}°C | "/>
												<a href="${tempURL}"><c:out value="°F"/></a></h3>
				                    			<h3><c:out value="High: ${dailyWeather.conversionHighTempToCelsius}°C | "/>
				                    			<a href="${tempURL}"><c:out value="°F"/></a></h3>
											</c:when>
											<c:otherwise>
												<c:url var="tempURL" value="/switchTemperature">
													<c:param name="tempChoice" value="C"/>
													<c:param name="parkCode" value="${park.code}"/>
												</c:url>
												<h3><c:out value="Low: ${dailyWeather.lowTemperature}°F | "/>
												<a href="${tempURL}"><c:out value="°C"/></a></h3>
				                    			<h3><c:out value="High: ${dailyWeather.highTemperature}°F | "/>
				                    			<a href="${tempURL}"><c:out value="°C"/></a></h3>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
						</c:when>
						<c:otherwise>
							<div class="col-sm-2">
								<c:url value="img/weather/${dailyWeather.forecast}.png" var="weatherImage"/>
								<div class="thumbnail">
									<img src="${weatherImage}" class="img-fluid img-thumbnail">
									<div class="caption">
									<h2><c:out value="${dailyWeather.getDayOfTheWeek(dailyWeather.day)}"/></h2>
										<c:choose>
											<c:when test="${tempChoice.equals('C')}">
												<c:url var="tempURL" value="/switchTemperature">
													<c:param name="tempChoice" value="F"/>
													<c:param name="parkCode" value="${park.code}"/>
												</c:url>
												<h4><c:out value="Low: ${dailyWeather.conversionLowTempToCelsius}°C | "/>
												<a href="${tempURL}"><c:out value="°F"/></a></h4>
				                    			<h4><c:out value="High: ${dailyWeather.conversionHighTempToCelsius}°C | "/>
				                    			<a href="${tempURL}"><c:out value="°F"/></a></h4>
											</c:when>
											<c:otherwise>
												<c:url var="tempURL" value="/switchTemperature">
													<c:param name="tempChoice" value="C"/>
													<c:param name="parkCode" value="${park.code}"/>
												</c:url>
												<h4><c:out value="Low: ${dailyWeather.lowTemperature}°F | "/>
												<a href="${tempURL}"><c:out value="°C"/></a></h4>
				                    			<h4><c:out value="High: ${dailyWeather.highTemperature}°F | "/>
				                    			<a href="${tempURL}"><c:out value="°C"/></a></h4>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
						</c:otherwise>
					</c:choose>
						<strong><c:out value="Forecast: "/></strong><c:out value="${dailyWeather.capitalizeFirstLetter(dailyWeather.forecast)}"/>
						<strong><c:out value="Advisory: "/></strong>
						<c:out value="${dailyWeather.weatherAdvisory}"/>
            			<c:out value="${dailyWeather.tempAdvisory}"/>
            			<c:out value="${dailyWeather.differenceInTempAdvisory}"/>
					</div>
				</c:forEach>
			</div>
	  	</div>
	</div>
</div>

<%@ include file="common/footer.jsp" %>