

</body><%@page import="model.user"%>
<%@page import="confirmation.userLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	//Insert item---------------------------------
if (request.getParameter("itemCode") != null) {
	user UserObj = new user();
	String stsMsg = UserObj.insertUser(request.getParameter("usercode"), request.getParameter("username"),
	request.getParameter("password"), request.getParameter("email"), request.getParameter("address"),
	request.getParameter("dob"), request.getParameter("phone"), request.getParameter("type"),
	request.getParameter("desc"));
	session.setAttribute("statusMsg", stsMsg);
}
//Delete item----------------------------------
if (request.getParameter("itemID") != null) {
	user UserObj = new user();
	String stsMsg = UserObj.deleteUser(request.getParameter("type"), request.getParameter("userID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="View/css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>
	<!-- navigation Bar -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Gadget Budget</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarScrollingDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Link </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarScrollingDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-10">
				<h1 class="m-3">Buyer Table</h1>
				<div id="divItemsGrid" class="col-15">
					<%
						user Userobj = new user();
					out.print(Userobj.readUsers("buyer"));
					%>
				</div>

				<div class="container">
					<div class="row">
						<div class="col-10">
							<h1 class="m-3">Developer Table</h1>
							<div id="divItemsGrid" class="col-15">
								<%
									user Userob = new user();
								out.print(Userobj.readUsers("developer"));
								%>
							</div>


						</div>
					</div>
				</div>
</body>
</html>
</html>