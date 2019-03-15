<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="pageTitle" value="Home Page"/>
<%@ include file="common/header.jsp" %>

<div id="container">
	<c:url var="surveyUrl" value="/survey"/>
	<form:form action="${surveyUrl}" method="POST" modelAttribute="survey">
		<label for="favoritePark">Favorite National Park</label>
		<select id="code" name="code">
			<c:forEach var="park" items="${parks}">
				<option value="${park.code}">${park.name}</option>
			</c:forEach>
		</select>
		<label for="email">Your Email</label>
   		<form:input path="email" placeholder="enter email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'enter email'"/>
		<label for="state">State of Residence</label>
		<select id="state" name="state">
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
   		<label for="activityLevel">Activity Level</label>
   		<select id="activityLevel" name="activityLevel">
			<option value="inactive">Inactive</option>
			<option value="sedentary">Sedentary</option>
			<option value="active">Active</option>
			<option value="extremely active">Extremely Active</option>
		</select>
   		<button type="submit">Submit</button>
	</form:form>
</div>
                
<%@ include file="common/footer.jsp" %>