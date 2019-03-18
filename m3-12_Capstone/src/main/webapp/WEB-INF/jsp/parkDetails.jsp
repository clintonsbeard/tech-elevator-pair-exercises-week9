<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="${park.name} Details"/>
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
			<blockquote class="blockquote text-right">
				<p class="mb-0"><c:out value="&quot;${park.inspirationalQuote}&quot;"/></p>
				<footer class="blockquote-footer"><cite>${park.inspirationalQuoteSource}</cite></footer>
			</blockquote>
			<hr class="my-4">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<div class="data-left">
							<div class="icon-left center-block text-center">
								<i class="fas fa-map-marked-alt icon fa-3x"></i>
							</div>
							<h1><c:out value="Acreage"/></h1>
							<h5><c:out value="${park.formatNumberWithCommas(park.acreage)} acres"/></h5>
						</div>
						<div class="data-left">
							<div class="icon-left center-block text-center">
								<i class="fas fa-mountain fa-3x"></i>
							</div>
							<h1><c:out value="Elevation"/></h1>
							<h5><c:out value="${park.formatNumberWithCommas(park.elevationInFeet)} feet"/></h5>
						</div>
						<div class="data-left">
							<div class="icon-left center-block text-center">
								<i class="fas fa-map-signs fa-3x"></i>
							</div>
							<h1><c:out value="Miles of Trail"/></h1>
							<h5><c:out value="${park.formatNumberWithCommas(park.milesOfTrail)} miles"/></h5>
						</div>
						<div class="data-left">
							<div class="icon-left center-block text-center">
								<i class="fas fa-campground fa-3x"></i>
							</div>
							<h1><c:out value="Number of Campsites"/></h1>
							<h5><c:out value="${park.formatNumberWithCommas(park.numberOfCampsites)} campsites"/></h5>
						</div>
						<div class="data-left">
							<div class="icon-left center-block text-center">
								<i class="fas fa-temperature-high fa-3x"></i>
							</div>
							<h1><c:out value="Climate"/></h1>
							<h5><c:out value="${park.climate}"/></h5>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="data-right">
							<div class="icon-right center-block text-center">
								<i class="fas fa-flag fa-3x"></i>
							</div>
							<h1><c:out value="Year Founded"/></h1>
							<h5><c:out value="${park.yearFounded}"/></h5>
						</div>
						<div class="data-right">
							<div class="icon-right center-block text-center">
								<i class="fas fa-users fa-3x"></i>
							</div>
							<h1><c:out value="Annual Visitors"/></h1>
							<h5><c:out value="${park.formatNumberWithCommas(park.annualVisitorCount)} visitors"/></h5>
						</div>
						<div class="data-right">
							<div class="icon-right center-block text-center">
								<i class="fas fa-money-bill-wave fa-3x"></i>
							</div>
							<h1><c:out value="Entry Fee"/></h1>
							<h5><c:out value="${park.formatMoney(park.entryFee)}"/></h5>
						</div>
						<div class="data-right">
							<div class="icon-right center-block text-center">
								<i class="fas fa-paw fa-3x"></i>
							</div>
							<h1><c:out value="Animal Species"/></h1>
							<h5><c:out value="${park.numberOfAnimalSpecies} different animal species"/></h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="jumbotron">
			<div class="container-fluid">
				<h1 class="display-4">Five Day Weather Report <span class="badge badge-secondary badge-success"><c:out value="${park.code.toUpperCase()}"/></span></h1>
				<div class="row">
				    <c:forEach items="${weather}" var="dailyWeather" varStatus="loop">
					    <c:choose>
						    <c:when test="${loop.index == 0}">
	                            <div class="col-sm-4 align-self-center center-block text-center">
	                            <c:url value="img/weather/${dailyWeather.forecast}.png" var="weatherImage"/>
	                                <div class="thumbnail">
	                                    <img src="${weatherImage}" class="img-fluid">
	                                    <div class="caption">
	                    					<div class="h1">
	                    	                    <strong><c:out value="${dailyWeather.getDayOfTheWeek(dailyWeather.day)}"/></strong>
	                    	                </div>
	                                        <c:choose>
	                                            <c:when test="${tempChoice.equals('C')}">
	                                            <c:url var="tempURL" value="/switchTemperature">
	                                                <c:param name="tempChoice" value="F"/>
	                                                <c:param name="parkCode" value="${park.code}"/>
	                                            </c:url>
	                                                <div class="h2">
	                                                	<strong><c:out value="Low: "/></strong>
	                                                	<c:out value="${dailyWeather.conversionLowTempToCelsius}°C | "/>
	                                                	<a href="${tempURL}"><c:out value="°F"/></a>
	                                                </div>
	                                                <div class="h2">
	                                                	<strong><c:out value="High: "/></strong>
	                                                	<c:out value="${dailyWeather.conversionHighTempToCelsius}°C | "/>
	                                                	<a href="${tempURL}"><c:out value="°F"/></a>
	                                                </div>
	                                            </c:when>
	                                            <c:otherwise>
	                                            <c:url var="tempURL" value="/switchTemperature">
	                                                <c:param name="tempChoice" value="C"/>
	                                                <c:param name="parkCode" value="${park.code}"/>
	                                            </c:url>
	                                                <div class="h2">
	                                                	<strong><c:out value="Low: "/></strong>
	                                               		<c:out value="${dailyWeather.lowTemperature}°F | "/>
	                                               		<a href="${tempURL}"><c:out value="°C"/></a>
	                                               	</div>
	                                                <div class="h2">
	                                                	<strong><c:out value="High: "/></strong>
	                                                	<c:out value="${dailyWeather.highTemperature}°F | "/>
	                                                	<a href="${tempURL}"><c:out value="°C"/></a>
	                                                </div>
	                                            </c:otherwise>
	                                        </c:choose>
	                                        <div class="h2">
	                                        	<strong><c:out value="Forecast: "/></strong>
	                                        	<c:out value="${dailyWeather.capitalizeFirstLetter(dailyWeather.forecast)}"/>
	                                        </div>
	                                        <div class="h2">
	                                        	<strong><c:out value="Current Advisories:"/></strong>
	                                        </div>
	                                        <c:forEach items="${dailyWeather.advisories}" var="advisory" varStatus="loop">
                                        		<c:choose>
                                        			<c:when test="${advisory == 'No current advisories.  Enjoy!'}">
                                        				<div class="h3">
                                        					<c:out value="${advisory}"/>
                                        				</div>
                                        			</c:when>
                                        			<c:when test="${loop.index == 0}">
                                        				<div class="h3">
                                        					<strong><c:out value="WARNING:"/></strong>
                                        					<c:out value="${advisory}"/>
                                        				</div>
                                        			</c:when>
                                        			<c:otherwise>
                                        				<div class="h3">
                                        					<strong><c:out value="WARNING:"/></strong>
                                        					<c:out value="${advisory}"/>
                                        				</div>
                                        			</c:otherwise>
                                        		</c:choose>
	                                        </c:forEach>
	                                    </div>
	                                </div>
	                            </div>
						    </c:when>
						    <c:otherwise>
							    <div class="col-sm-2 align-self-center center-block text-center">
								<c:url value="img/weather/${dailyWeather.forecast}.png" var="weatherImage"/>
								    <div class="thumbnail">
									    <img src="${weatherImage}" class="img-fluid">
									    <div class="caption">
									    	<div class="h2">
	                    	                    <strong><c:out value="${dailyWeather.getDayOfTheWeek(dailyWeather.day)}"/></strong>
	                    	                </div>
	                                        <c:choose>
	                                            <c:when test="${tempChoice.equals('C')}">
	                                            <c:url var="tempURL" value="/switchTemperature">
	                                                <c:param name="tempChoice" value="F"/>
	                                                <c:param name="parkCode" value="${park.code}"/>
	                                            </c:url>
	                                                <div class="h3">
	                                                	<strong><c:out value="Low: "/></strong>
	                                                	<c:out value="${dailyWeather.conversionLowTempToCelsius}°C | "/>
	                                                	<a href="${tempURL}"><c:out value="°F"/></a>
	                                                </div>
	                                                <div class="h3">
	                                                	<strong><c:out value="High: "/></strong>
	                                                	<c:out value="${dailyWeather.conversionHighTempToCelsius}°C | "/>
	                                                	<a href="${tempURL}"><c:out value="°F"/></a>
	                                                </div>
	                                            </c:when>
	                                            <c:otherwise>
	                                            <c:url var="tempURL" value="/switchTemperature">
	                                                <c:param name="tempChoice" value="C"/>
	                                                <c:param name="parkCode" value="${park.code}"/>
	                                            </c:url>
	                                                <div class="h3">
	                                                	<strong><c:out value="Low: "/></strong>
	                                               		<c:out value="${dailyWeather.lowTemperature}°F | "/>
	                                               		<a href="${tempURL}"><c:out value="°C"/></a>
	                                               	</div>
	                                                <div class="h3">
	                                                	<strong><c:out value="High: "/></strong>
	                                                	<c:out value="${dailyWeather.highTemperature}°F | "/>
	                                                	<a href="${tempURL}"><c:out value="°C"/></a>
	                                                </div>
	                                            </c:otherwise>
	                                        </c:choose>
	                                        <div class="h3">
	                                        	<strong><c:out value="Forecast: "/></strong>
	                                            <c:out value="${dailyWeather.capitalizeFirstLetter(dailyWeather.forecast)}"/>
	                                        </div>
	                                        <button type="button" class="btn btn-secondary" data-placement="bottom" data-toggle="tooltip" data-html="true"
	                                        title="
	                                        	<c:forEach items="${dailyWeather.advisories}" var="advisory" varStatus="loop">
	                                        		<c:choose>
	                                        			<c:when test="${advisory == 'No current advisories.  Enjoy!'}">
	                                        				<c:out value="${advisory}"/>
	                                        			</c:when>
	                                        			<c:when test="${loop.index == 0}">
	                                        				<strong><c:out value="WARNING:"/></strong>
	                                        				<c:out value="${advisory}"/>
	                                        			</c:when>
	                                        			<c:otherwise>
	                                        				<br><strong><c:out value="WARNING:"/></strong>
	                                        				<c:out value="${advisory}"/>
	                                        			</c:otherwise>
	                                        		</c:choose>
	                                        	</c:forEach>">
	                                            <strong><c:out value="View Advisories"/></strong>
	                                        </button>
									    </div>
									</div>
								</div>
						    </c:otherwise>
					    </c:choose>
				    </c:forEach>
		  	    </div>
		    </div>
	    </div>
	</div>
</div>

<%@ include file="common/footer.jsp" %>