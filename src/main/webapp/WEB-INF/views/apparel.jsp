<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Catalogue Application</title>
	<spring:url value="/resources/css/bulma.css" var="mainCss" />
	<link href="${mainCss}" rel="stylesheet" />
</head>
<body>
<h3>Apparels List</h3>
<c:if test="${!empty listApparels}">
	<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
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
</body>
</html>