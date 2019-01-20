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
<title>Calendar</title>
</head>
<body>
	<nav class="navbar navbar-dark bg-primary mb-3"> <a
		href="${pageContext.request.contextPath}/calendar"
		class="navbar-brand">Calendar</a> </nav>
	<div
		class="d-flex flex-row align-items-center justify-content-between mx-sm-3">
		<h1>${mois}</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="jumbotron">
					<h4 class="display-5">
						<b>Details de l'événement </b>
					</h4>
					<hr class="my-4">
					<table class="table table-borderless">
						<tr>
							<td><b>Designation :</b></td>
							<td>${event.designation }</td>
						</tr>
						<td><b>Description :</b></td>
						<td>${event.description }</td>
						</tr>
						<td><b>Date de debut :</b></td>
						<td><c:out value="${event.date_debut}--${event.heure_debut}" /></td>
						</tr>
						<td><b>Date Fin :</b></td>
						<td><c:out value="${event.date_fin}--${event.heure_fin}" /></td>
						</tr>
						<td><b>Type :</b></td>
						<td>${event.type }</td>
						</tr>
						</tr>
						<td><b>Importance :</b></td>
						<td><c:if test="${event.importance eq 'S' }">
								<span class="badge badge-primary">Moins Imprtant</span>
							</c:if> <c:if test="${event.importance eq 'M' }">
								<span class="badge badge-success">Moyen Important</span>
							</c:if> <c:if test="${event.importance eq 'X' }">
								<span class="badge badge-warning">Important</span>
							</c:if> <c:if test="${event.importance eq 'XL' }">
								<span class="badge badge-danger">Trés Important</span>
							</c:if></td>
						</tr>
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/calendar/event/${event.id_evenemet}"
								class="btn btn-success">Modifier</a></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="jumbotron">
					<h4 class="display-5">
						<b>Modifier l'événement </b>
					</h4>
					<hr class="my-4">
                    <f:form cssClass="form" modelAttribute="event" action="updateEvent">
                       <f:hidden path="id_evenemet" value="${event.id_evenemet}" />
                       <div class="form-group"> 
                         <f:input path="designation" type="text" name="designation" cssClass="form-control" placeholder="designation"/>
                       </div>
                       <div class="form-group"> 
                         <f:input path="description" type="text" name="description" cssClass="form-control" placeholder="description"/>
                       </div>
                       <div class="row">
                       <div class="form-group col-sm-6"> 
                         <f:input path="date_debut" type="text" name="date_debut" cssClass="form-control" placeholder="date debut :yyyy-m-dd"/>
                       </div>
                       <div class="form-group col-sm-6"> 
                         <f:input  path="heure_debut" type="text" name="heure_debut" cssClass="form-control" placeholder="heure :hh:mm"/>
                       </div>
                       </div>
                       <div class="row">
                       <div class="form-group col-sm-6"> 
                         <f:input path="date_fin" type="text" name="date_fin" cssClass="form-control" placeholder="date fin :yyyy-m-dd"/>
                       </div>
                       <div class="form-group col-sm-6"> 
                         <f:input path="heure_fin" type="text" name="heure_fin" cssClass="form-control" placeholder="heure :hh:mm" />
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
						<input type="submit" value="Modifier" class="btn btn-success">
						<input type="reset" class="btn btn-danger">
                    </f:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>