<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="container">
	<div class="page-header">
  		<h1>National Park Geek Survey <small class="text-muted">What's your favorite national park?</small></h1>
	</div>
	<p>We here at National Park Geek are curious: Out of the options listed, what's your favorite national park?</p>
	<p>We only require <mark>four</mark> things:</p>
    <ul>
      <li>Your favorite national park (out of those provided)</li>
      <li>Your email address</li>
      <li>Your state of residence (valid only for the 50 states and District of Columbia)</li>
      <li>Your activity level (inactive, sedentary, active, or extremely active)</li>
    </ul>
    <p>Thank you for participating!</p>
	<p><small class="text-muted">Any information you provide below is used <strong>only</strong> for surveying purposes.</small></p>
	<c:url var="surveyUrl" value="/survey"/>
	<form:form action="${surveyUrl}" method="POST" modelAttribute="survey">
	<c:if test="${not empty errors}">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    		<span aria-hidden="true">&times;</span>
	  		</button>
	  		<div class="error">
				<form:errors path="code"/>
			</div>
			<div class="error">
				<form:errors path="email"/>
			</div>
			<div class="error">
				<form:errors path="state"/>
			</div>
			<div class="error">
				<form:errors path="activityLevel"/>
			</div>
		</div>
	</c:if>
		<div class="form-group row">
			<label for="favoritePark" class="col-sm-2 col-form-label"><strong>Favorite National Park</strong></label>
			<div class="col-sm-6">
				<select id="code" name="code" class="form-control">
					<%-- <c:choose>
						<c:when test="${empty remember.code}">
							<script language="JavaScript" type="text/JavaScript">
								var code = document.getElementById("code");
								code.options[code.options.selectedIndex].setAttribute("selected", "selected");
							</script>
						</c:when>
						<c:otherwise>
							<script language="JavaScript" type="text/JavaScript">
								var code = document.getElementById("code");
								code.options[code.options.selectedIndex].setAttribute("selected", "selected");
							</script>
						</c:otherwise>
					</c:choose> --%>
					<option selected="selected" disabled>Choose...</option>
					<c:forEach var="park" items="${parks}">
						<option value="${park.code}">${park.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label for="email" class="col-sm-2 col-form-label"><strong>Email</strong></label>
			<div class="col-sm-6">
   				<form:input type="email" class="form-control" path="email" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="state" class="col-sm-2 col-form-label"><strong>State of Residence</strong></label>
			<div class="col-sm-6">
				<select id="state" name="state" class="form-control">
					<option selected="selected" disabled>Choose...</option>
					<option value="Alabama">Alabama</option>
					<option value="Alaska">Alaska</option>
					<option value="Arizona">Arizona</option>
					<option value="Arkansas">Arkansas</option>
					<option value="California">California</option>
					<option value="Colorado">Colorado</option>
					<option value="Connecticut">Connecticut</option>
					<option value="Delaware">Delaware</option>
					<option value="District Of Columbia">District Of Columbia</option>
					<option value="Florida">Florida</option>
					<option value="Georgia">Georgia</option>
					<option value="Hawaii">Hawaii</option>
					<option value="Idaho">Idaho</option>
					<option value="Illinois">Illinois</option>
					<option value="Indiana">Indiana</option>
					<option value="Iowa">Iowa</option>
					<option value="Kansas">Kansas</option>
					<option value="Kentucky">Kentucky</option>
					<option value="Louisiana">Louisiana</option>
					<option value="Maine">Maine</option>
					<option value="Maryland">Maryland</option>
					<option value="Massachusetts">Massachusetts</option>
					<option value="Michigan">Michigan</option>
					<option value="Minnesota">Minnesota</option>
					<option value="Mississippi">Mississippi</option>
					<option value="Missouri">Missouri</option>
					<option value="Montana">Montana</option>
					<option value="Nebraska">Nebraska</option>
					<option value="Nevada">Nevada</option>
					<option value="New Hampshire">New Hampshire</option>
					<option value="New Jersey">New Jersey</option>
					<option value="New Mexico">New Mexico</option>
					<option value="New York">New York</option>
					<option value="North Carolina">North Carolina</option>
					<option value="North Dakota">North Dakota</option>
					<option value="Ohio">Ohio</option>
					<option value="Oklahoma">Oklahoma</option>
					<option value="Oregon">Oregon</option>
					<option value="Pennsylvania">Pennsylvania</option>
					<option value="Rhode Island">Rhode Island</option>
					<option value="South Carolina">South Carolina</option>
					<option value="South Dakota">South Dakota</option>
					<option value="Tennessee">Tennessee</option>
					<option value="Texas">Texas</option>
					<option value="Utah">Utah</option>
					<option value="Vermont">Vermont</option>
					<option value="Virginia">Virginia</option>
					<option value="Washington">Washington</option>
					<option value="West Virginia">West Virginia</option>
					<option value="Wisconsin">Wisconsin</option>
					<option value="Wyoming">Wyoming</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
	   		<label for="activityLevel" class="col-sm-2 col-form-label"><strong>Physical Activity Level</strong></label>
	   		<div class="col-sm-6">
		   		<select id="activityLevel" name="activityLevel" class="form-control">
		   			<option selected="selected" disabled>Choose...</option>
					<option value="inactive">Inactive</option>
					<option value="sedentary">Sedentary</option>
					<option value="active">Active</option>
					<option value="extremely active">Extremely Active</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
    		<div class="col-sm-12 center-block text-center">
     			<button type="submit" class="btn btn-dark">Submit</button>
    		</div>
  		</div>
	</form:form>
</div>
                
<%@ include file="common/footer.jsp" %>