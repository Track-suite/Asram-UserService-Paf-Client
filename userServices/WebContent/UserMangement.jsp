<%@page import="model.user"%>
<%@page import="confirmation.userLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	//Insert item---------------------------------
if (request.getParameter("userId") != null) {
	user UserObj = new user();
	String stsMsg = UserObj.insertUser(request.getParameter("usercode"), request.getParameter("username"),
	request.getParameter("password"), request.getParameter("email"), request.getParameter("address"),
	request.getParameter("dob"), request.getParameter("phone"), request.getParameter("type"));
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


	<!--Form-->
	<div class="container">
		<div class="row">
			<div class="col-8">
				<h1 class="m-3">User Details</h1>
				<form id="formUser" name="formUser">

					<!-- User name -->
					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">User
							Name:</label>
						<div class="col-5">
							<input class="form-control" type="text" id="txtUsername" name="txtUsername">
						</div>
					</div>
					<br>


					<!-- User code -->
					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">User
							Code:</label>
						<div class="col-5">
							<input class="form-control" type="text" id="txtUserCode" name="txtUserCode">
						</div>
					</div>
					<br>
					<!-- Type -->
					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">Type:
							</label>
						<div class="col-5">
							<input class="form-control" type="text" id="SelectType" name="SelectType">
						</div>
					</div>
					<br>
						



					<!-- Email -->
					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">Email:
						</label>
						<div class="col-5">
							<input class="form-control" type="email" id="txtEmail" name="txtEmail"
								placeholder="name@example.com">
						</div>
					</div>
					<br>

					<!-- Password -->
					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">Password
							:</label>
						<div class="col-5">
							<input class="form-control" type="text" id="txtPassword" name="txtPassword">
						</div>
					</div>
					<br>

					<!-- Address -->
					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">Address
							:</label>
						<div class="col-5">
							<textarea class="form-control" type="text" id="txtAddress" name="txtAddress">
							</textarea>
						</div>
					</div>
					<br>

					<!-- DOB -->
					<div class="form-group row">
						<label for="example-date-input" class="col-2 col-form-label">Date
							of Birth:</label>
						<div class="col-5">
							<input class="form-control" type="date" id="txtDob" name="txtDob">
						</div>
					</div>
					<br>

					<!-- Phone -->
					<div class="form-group row">
						<label for="example-tel-input" class="col-2 col-form-label">Telephone:</label>
						<div class="col-5">
							<input class="form-control" type="tel" id="txtPhone"  name="txtPhone">
						</div>
					</div>
					<br>
					

					<div class="form-group row">
						<label for="example-text-input" class="col-2 col-form-label">
						</label>
						<div class="col-5">
							<input type="button" id="btnSave" value="Register"
								class="col-3  btn btn-success ">
								<input type="hidden" id="hidUserIDSave"
						name="hidUserIDSave" value="">
						</div>
					</div>
					<br> 
				</form>
				<!-- Alert -->
					<div id="alertSuccess" class="alert alert-success"></div>
					<div id="alertError" class="alert alert-danger"></div>
			</div>
		</div>
		<br><br>
		
		<h1 class="m-3">Buyer Table</h1>
	<div id="divItemsGrid"  class="col-12">
		
		<div id="divItemsGrid" class="col-15">
					<%
						user Userobj = new user();
					out.print(Userobj.readUsers("buyer"));
					%>
				</div>
	</div>
	<h1 class="m-3">Developer Table</h1>
	<div id="divItemsGrid"  class="col-12">
		
		<div id="divItemsGrid" class="col-15">
					<%
						user Userob = new user();
					out.print(Userobj.readUsers("developer"));
					%>
				</div>
	</div>
	<h1 class="m-3">Investor Table</h1>
	<div id="divItemsGrid"  class="col-12">
		
		<div id="divItemsGrid" class="col-15">
					<%
						user Userobjec = new user();
					out.print(Userobj.readUsers("investor"));
					%>
				</div>
	</div>
	

</body>
</html>