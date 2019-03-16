<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="container">
	<div class="page-header">
  		<h1>National Park Geek Survey Results<small class="text-muted"> What's your favorite national park?</small></h1>
	</div>
	<h3>Here are our current winners:</h3>
	<table class="table table-striped">
		<thead>
   			<tr>
   				<th scope="col">#</th>
		    	<th scope="col">Park Image</th>
		    	<th scope="col">Park Name</th>
		    	<th scope="col">Votes</th>
		    </tr>
		</thead>
		<tbody>
		<c:forEach items="${favorites}" var="favorite" varStatus="loop">
			<tr class="survey-row">
      			<th scope="row">${loop.index + 1}</th>
      			<td>
	            	<c:url value="img/parks/${favorite.code}.jpg" var="image"/>
	            	<img src="${image}" class="img-fluid img-thumbnail">
	            </td>
      			<td><c:out value="${favorite.name}"/></td>
      			<td><c:out value="${favorite.surveyCount}"/></td>
    		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
                
<%@ include file="common/footer.jsp" %>