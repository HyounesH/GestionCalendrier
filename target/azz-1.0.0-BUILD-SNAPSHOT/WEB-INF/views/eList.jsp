<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Calendar</title>
</head>
<body>
	<nav class="navbar navbar-dark bg-primary mb-3"> <a
		href="${pageContext.request.contextPath}/calendar"
		class="navbar-brand">Calendar</a> </nav>

	<div class="fluid-container">

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Designation</th>
					<th scope="col">Descrption</th>
					<th scope="col">Date_debut</th>
					<th scope="col">Date_fin</th>
					<th scope="col">type</th>
					<th scope="col">Importance</th>
					<th scope="col">Op</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
			<c:forEach items="${events}" var="event">
				<tr>
					<th scope="row"><c:out value="${event.id_evenemet}"/></th>
					<td><c:out value="${event.designation}" /></td>
					<td><c:out value="${event.description}" /></td>
					<td><c:out value="${event.date_debut}--${event.heure_debut}" /></td>
					<td><c:out value="${event.date_fin}--${event.heure_fin}" /></td>
					<td><c:out value="${event.type }" /></td>
					<td><c:if test="${event.importance eq 'S' }">
							<span class="badge badge-primary">Moins Imprtant</span>
						</c:if> <c:if test="${event.importance eq 'M' }">
							<span class="badge badge-success">Moyen Important</span>
						</c:if> <c:if test="${event.importance eq 'X' }">
							<span class="badge badge-warning">Important</span>
						</c:if> <c:if test="${event.importance eq 'XL' }">
							<span class="badge badge-danger">Trés Important</span>
						</c:if>
					</td>
					<td>
					<a href="${pageContext.request.contextPath}/calendar/event/suppr/${event.id_evenemet}" class="btn btn-danger">supr</a>
					<a href="${pageContext.request.contextPath}/calendar/event/${event.id_evenemet}" class="btn btn-primary">edit</span></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>