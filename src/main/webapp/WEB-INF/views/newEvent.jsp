<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:set var="root" value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}/css/newEvent.css">

<title>Calendar</title>
</head>
<body>
<header>
		<div class="collapse bg-dark" id="navbarHeader">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-7 py-4">
						<h4 class="text-white">About</h4>
						<p class="text-muted">Add some information about the album
							below, the author, or any other background context. Make it a few
							sentences long so folks can pick up some informative tidbits.
							Then, link them off to some social networking sites or contact
							information.</p>
					</div>
					<div class="col-sm-4 offset-md-1 py-4">
						<h4 class="text-white">Contact</h4>
						<ul class="list-unstyled">
							<li><a href="#" class="text-white">Follow on Twitter</a></li>
							<li><a href="#" class="text-white">Like on Facebook</a></li>
							<li><a href="#" class="text-white">Email me</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container d-flex justify-content-between">
				<a href="${pageContext.request.contextPath}/calendar" class="navbar-brand d-flex align-items-center"><strong>Calendar</strong>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarHeader" aria-controls="navbarHeader"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>
	<div class="container">

        <div class="jumbotron">
          <h4  class="text-center text-primary">Nouveau Evénement </h4>
          <hr>
          <f:form cssClass="form" modelAttribute="event" action="newEvent">
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
						<input type="submit" value="Ajouter" class="btn btn-primary">
						<input type="reset" class="btn btn-danger">
                    </f:form>
        </div>
    </div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
</body>
</html>