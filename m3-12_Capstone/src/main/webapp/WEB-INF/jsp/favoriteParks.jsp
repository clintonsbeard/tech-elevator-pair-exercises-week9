<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Favorite National Park Survey Results"/>
<%@ include file="common/header.jsp" %>

<div id="container">
	<div class="page-header">
  		<h1>National Park Geek Survey Results<small class="text-muted"> What's your favorite national park?</small></h1>
	</div>
	<h3>Here are our current winners:</h3>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
	   			<tr>
	   				<th style="width: 5%" class="text-center">#</th>
			    	<th style="width: 30%" class="text-center">Park Image</th>
			    	<th style="width: 50%" class="text-center">Park Name</th>
			    	<th style="width: 5%" class="text-center">Votes</th>
			    </tr>
			</thead>
			<tbody>
			<c:forEach items="${favorites}" var="favorite" varStatus="loop">
				<tr>
	      			<th class="text-center align-middle"><h${loop.index + 1}>${loop.index + 1}</h${loop.index + 1}></th>
	      			<td class="text-center align-middle">
		            	<c:url value="img/parks/${favorite.code}.jpg" var="image"/>
		            	<img src="${image}" class="img-fluid img-thumbnail">
		            </td>
	      			<td class="text-center align-middle"><h${loop.index + 1}><c:out value="${favorite.name}"/></h${loop.index + 1}></td>
	      			<td class="text-center align-middle"><h${loop.index + 1}><c:out value="${favorite.surveyCount}"/></h${loop.index + 1}></td>
	    		</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
                
<%@ include file="common/footer.jsp" %>