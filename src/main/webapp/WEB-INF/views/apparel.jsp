<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Catalogue Application</title>
	<link href="${pageContext.request.contextPath}/resources/css/bulma.css" rel="stylesheet" type="text/css" />
</head>
<body>
<br/>
<h3 class="title is-3">Apparel List</h3>
<form method="get" action="<spring:url value="/search"/>">
	<div class="field has-addons">
	  <div class="control">
	    <input class="input" name="searchName" type="text" value="${param.searchName}" placeholder="Find apparel">
	  </div>
	  <div class="control">
	    <button class="button is-link">Search</button>
	  </div>
	</div>
</form>
<c:if test="${!empty listApparels}">
	<table class="table is-bordered is-striped is-hoverable is-fullwidth">
		<thead>
			<tr>
				<th width="80">Apparel ID</th>
				<th width="120">Apparel Name</th>
				<th width="120">Apparel Price</th>
				<th width="60">Apparel Stock</th>
			</tr>
		</thead>
		<tbody>	
			<c:forEach items="${listApparels}" var="apparel">
				<tr>
					<td>${apparel.id}</td>
					<td>${apparel.name}</td>
					<td>${apparel.price}</td>
					<td>${apparel.stock}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>
<c:if test="${empty listApparels}">
	<table class="table is-bordered is-striped is-hoverable is-fullwidth">
		<thead>
			<tr>
				<th width="80">Apparel ID</th>
				<th width="120">Apparel Name</th>
				<th width="120">Apparel Price</th>
				<th width="60">Apparel Stock</th>
			</tr>
		</thead>
		<tbody>		
			<tr>
				<td colspan="4"><center><b>Data not found.</b></center></td>
			</tr>	
		</tbody>
	</table>
</c:if>
</body>
</html>