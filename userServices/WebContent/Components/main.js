$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click","#btnSave",function(event) {
			// Clear status msges-------------
			$("#alertSuccess").text("");
			$("#alertSuccess").hide();
			$("#alertError").text("");
			$("#alertError").hide();

			// Form validation----------------
			var status = validateUserForm();

			// If not valid-------------------
			if (status != true) {
				$("#alertError").text(status);
				$("#alertError").show();
				return;
			}

			// If valid----------------------
			var type = ($("#hidUserIDSave").val() == "") ? "POST" : "PUT";
			$.ajax(
			{
			url : "userAPI",
			type : type,
			data : $("#formUser").serialize(),
			dataType : "text",
			complete : function(response, status)
			{
			onItemSaveComplete(response.responseText, status);
			}
			});
			});


// REMOVE==========================================
$(document).on("click", ".remove", function(event) {
	$(this).closest(".student").remove();
	$("#alertSuccess").text("Removed successfully.");
	$("#alertSuccess").show();
});

// CLIENT-MODEL=================================================================
function validateUserForm() {
	// NAME
	if ($("#txtUsername").val().trim() == "") {
		return "Insert User name.";
	}
	// User Code
	if ($("#txtUserCode").val().trim() == "") {
		return "Insert User Code.";
	}
	// Type
	if ($("#SelectType").val() == "0") {
		return "Select Type.";
	}
	// Email
	if ($("#txtEmail").val().trim() == "") {
		return "Insert Email.";
	}
	// Password
	if ($("#txtPassword").val().trim() == "") {
		return "Insert Password.";
	}
	// Address
	if ($("#txtAddress").val().trim() == "") {
		return "Insert Address.";
	}
	// DOB
	if ($("#txtDob").val().trim() == "") {
		return "Insert Date of Birth.";
	}
	// Phone
	if ($("#txtPhone").val().trim() == "") {
		return "Insert Phone Number.";
	}

	return true;
}
//save====================
function onItemSaveComplete(response, status)
{
if (status == "success")
{
var resultSet = JSON.parse(response);
if (resultSet.status.trim() == "success")
{
	$("#alertSuccess").text("Successfully saved.");
	$("#alertSuccess").show();
	$("#divItemsGrid").html(resultSet.data);
} else if (resultSet.status.trim() == "error")
	{
		$("#alertError").text(resultSet.data);
		$("#alertError").show();
	}
} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
			$("#alertError").text("Unknown error while saving..");
			$("#alertError").show();
	}

	$("#hidItemIDSave").val("");
	$("#formUser")[0].reset();
}
//Update====================
$(document).on("click", ".btnUpdate", function(event)
		{
		$("#hidItemIDSave").val($(this).data("itemid"));
		$("#itemCode").val($(this).closest("tr").find('td:eq(0)').text());
		$("#itemName").val($(this).closest("tr").find('td:eq(1)').text());
		$("#itemPrice").val($(this).closest("tr").find('td:eq(2)').text());
		$("#itemDesc").val($(this).closest("tr").find('td:eq(3)').text());
		});
function getUserCard(name, usercode, type, email, password, address, dob, phone) {

	var typeno = "";

	switch (type) {
	case "1":
		typeno = "buyer";
		break;
	case "2":
		typeno = "investor";
		break;
	case "3":
		typeno = "developer";
		break;

	}

	var user = "";
	user += "<div class=\"student card bg-light m-2\""
			+ "style=\"max-width: 20rem; float: left;\">";
	user += "<div class=\"card-body\">";
	user += " Details of" + " " + typeno;
	user += "<br>";
	user += name + ",";
	user += "<br>";
	user += "Code" + " " + usercode + ",";
	user += "<br>";
	user += "Email:" + " " +email + ",";
	user += "<br>";
	user += "Password:" + " " +password + ",";
	user += "<br>";
	user += "Home Address:" + " " +address + ",";
	user += "<br>";
	user += "Date of Birth:" + " " +dob + ",";
	user += "<br>";
	user += "Phone:" + " " +phone ;

	user += "</div>";
	user += "<input type=\"button\" value=\"Remove\""
			+ "class=\"btn btn-danger remove\">";
	user += "</div>";
	return user;
}
