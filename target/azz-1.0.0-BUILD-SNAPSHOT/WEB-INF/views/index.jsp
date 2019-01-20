<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
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
<link rel="stylesheet" href="${root}/css/calendar.css">
<title>Calendar</title>
</head>
<body>
	<nav class="navbar navbar-dark bg-primary mb-3"> <a
		href="${pageContext.request.contextPath}/calendar"
		class="navbar-brand">Calendar</a> </nav>
	<div
		class="d-flex flex-row align-items-center justify-content-between mx-sm-3">
		<h1>${mois}</h1>
		<div>
		     <a href="${pageContext.request.contextPath}/calendar/event/list" class="btn btn-primary">Event List</a> 
			 <a href="${pageContext.request.contextPath}/calendar/addEvent"  class="btn btn-primary">New </a> 
				
				&nbsp; <a href="${pageContext.request.contextPath}/calendar/previous"
				class="btn btn-danger">&lt;</a> <a
				href="${pageContext.request.contextPath}/calendar/next"
				class="btn btn-danger">&gt;</a>
		</div>
	</div>
	<table class="calendar-table calendar-table-${weeks}weeks">
		<c:forEach begin="1" end="${weeks}" var="i">
			<tr>
				<c:forEach items="${weekDays}" var="day" varStatus="d">
					<td>
						<div class="calendar-weekday">${day}</div>
						<div class="calendar-day">
							<c:out
								value="${((startingDay+d.index)+((i-1)*7))%(numDayOfMonth)+1}" />
							<c:forEach items="${events}" var="e">
								<c:set var="CurrentDate"
									value="${a}-${m}-${((d.index)+((i-1)*7))%(numDayOfMonth)+1}" />
								<c:if test="${e.date_debut eq CurrentDate}">
									<div>
										<a
											href="${pageContext.request.contextPath}/calendar/event/${e.id_evenemet}"
											class="btn btn-outline-success"> <c:out
												value="${e.designation}" /></a>
										<c:if test="${e.importance eq 'S' }">
											<span class="badge badge-primary"><c:out
													value="${e.importance}" /></span>
										</c:if>
										<c:if test="${e.importance eq 'M' }">
											<span class="badge badge-success"><c:out
													value="${e.importance}" /></span>
										</c:if>
										<c:if test="${e.importance eq 'X' }">
											<span class="badge badge-warning"><c:out
													value="${e.importance}" /></span>
										</c:if>
										<c:if test="${e.importance eq 'XL' }">
											<span class="badge badge-danger"><c:out
													value="${e.importance}" /></span>
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>

	<!-- modal new event -->

	<div class="modal fade" id="newEvent" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Nouveau Evénement</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<f:form cssClass="form" modelAttribute="event" action="newEvent">
						<div class="form-group">
							<f:input path="designation" type="text" name="designation"
								cssClass="form-control" placeholder="designation" />
						</div>
						<div class="form-group">
							<f:input path="description" type="text" name="description"
								cssClass="form-control" placeholder="description" />
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<f:input path="date_debut" type="text" name="date_debut"
									cssClass="form-control" placeholder="date debut :yyyy-m-dd" />
							</div>
							<div class="form-group col-sm-6">
								<f:input path="heure_debut" type="text" name="heure_debut"
									cssClass="form-control" placeholder="heure :hh:mm" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<f:input path="date_fin" type="text" name="date_fin"
									cssClass="form-control" placeholder="date fin :yyyy-m-dd" />
							</div>
							<div class="form-group col-sm-6">
								<f:input path="heure_fin" type="text" name="heure_fin"
									cssClass="form-control" placeholder="heure :hh:mm" />
							</div>
						</div>
						<div class="form-group">
							<f:select path="type" cssClass="form-control">
								<f:option value="professionel">Professionel</f:option>
								<f:option value="personnel">Personnel</f:option>
								<f:option value="autre">Autre</f:option>
							</f:select>
						</div>
						<div class="form-group">
							<f:select path="importance" cssClass="form-control">
								<f:option value="S">Moins important</f:option>
								<f:option value="M">Moyen important</f:option>
								<f:option value="X">Important</f:option>
								<f:option value="XL">Trés important</f:option>
							</f:select>
						</div>
						<div class="form-group">
							<label class="label-control"><b>Notifier :</b> </label> <label
								class="radio-inline"> <f:radiobutton path="notifier"
									value="true" />Oui
							</label> <label class="radio-inline"> <f:radiobutton
									path="notifier" value="false" />Non
							</label>
						</div>
						<input type="submit" value="Ajouter" class="btn primary">
						<input type="reset" class="btn btn-danger">
					</f:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>