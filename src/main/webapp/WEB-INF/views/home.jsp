<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
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
<link rel="stylesheet" href="${root}/css/index.css">
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
				<a href="${pageContext.request.contextPath}/calendar"
					class="navbar-brand d-flex align-items-center"><strong>Calendar</strong>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarHeader" aria-controls="navbarHeader"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>

	<main role="main">
	<div class="album py-5 bg-light">
		<div class="container">

			<div class="row">
				<div class="col-sm-5">
				 <img alt="" src="${root}/images/pic3.png" width="100%" height="100%"/>
				</div>
				<div class="col-sm-7">
					<div class="jumbotron">
						<h4 class="display-5">
							<b>Créer votre Calendrier maintenant !</b>
						</h4>
						<hr class="my-4">
						<f:form cssClass="form" modelAttribute="utilisateur"
							action="saveUser">
							<div class="row">
								<div class="form-group col-sm-6">
									<f:label path="nom" class="form-label">
										<b>Nom :</b>
									</f:label>
									<f:input path="nom" type="text" name="nom"
										cssClass="form-control" placeholder="nom" />
								</div>
								<div class="form-group col-sm-6">
									<f:label path="prenom" class="form-label">
										<b>Prénom :</b>
									</f:label>
									<f:input path="prenom" type="text" name="prenom"
										cssClass="form-control" placeholder="prenom" />
								</div>
							</div>
							<div class="form-group">
								<f:label path="calendrier" class="form-label">
									<b>Nom Calendrier :</b>
								</f:label>
								<f:input path="calendrier" type="text" name="calendrier"
									cssClass="form-control" placeholder="nom Calendrier" />
							</div>
							<div class="form-group">
								<f:label path="email" class="form-label">
									<b>Email :</b>
								</f:label>
								<f:input path="email" type="text" name="email"
									cssClass="form-control" placeholder="Email" />
							</div>
							<div class="form-group">
								<f:label path="pass" class="form-label">
									<b>Password :</b>
								</f:label>
								<f:input path="pass" type="password" name="pass"
									cssClass="form-control" placeholder="Password" />
							</div>
							<div class="form-group">
								<f:label path="nom" class="form-label">
									<b>Télephone :</b>
								</f:label>
								<f:input path="telephone" type="text" name="telephone"
									cssClass="form-control" placeholder="Télephone" />
							</div>
							<div class="pull-left">
								<input type="submit" value="Créer"
									class="btn btn-primary btn-lg"> <input type="reset"
									class="btn btn-danger btn-lg">
							</div>
							<p>
								vous avez déjà un compte ? <span><a href=""
									data-toggle="modal" data-target="#modalId" data-keyboard="true"
									class="badge badgre-primary">Login</a></span>
							</p>
							<p>
								<b style="color: red;">${resultat}</b>
							</p>
						</f:form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">Back to top</a>
			</p>
			<p>Gestion des films &copy; Bootstrap, but please download and
				customize it for yourself!</p>
			<p>
				New to Bootstrap? <a href="../../">Visit the homepage</a> or read
				our <a href="../../getting-started/">getting started guide</a>.
			</p>
		</div>
	</footer>
	<!-- modal reserve ticket -->
	<div class="modal fade" id="modalId">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<b>Authentification </b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<f:form class="form" cssClass="form" modelAttribute="utilisateur"
						action="login">
						<div class="form-group">
							<f:label path="email" class="form-label">
								<b>Email :</b>
							</f:label>
							<f:input path="email" type="text" name="email"
								cssClass="form-control" placeholder="Email" />
						</div>
						<div class="form-group">
							<f:label path="pass" class="form-label">
								<b>Password :</b>
							</f:label>
							<f:input path="pass" type="password" name="pass"
								cssClass="form-control" placeholder="Password" />
						</div>

						<input type="submit" class="btn btn-primary" value="Login">
						<input type="button" class="btn btn-secondary"
							data-dismiss="modal" value="Fermer">

					</f:form>
				</div>

			</div>
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
