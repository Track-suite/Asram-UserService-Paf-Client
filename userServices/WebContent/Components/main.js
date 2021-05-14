$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
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
	$.ajax({
		url : "userAPI",
		type : type,
		data : $("#formUser").serialize(),
		dataType : "text",
		complete : function(response, status) {
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
	if ($("#SelectType").val() == "") {
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
// save====================
function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}

	$("#hidUserIDSave").val("");
	$("#formUser")[0].reset();
}
// Update====================
$(document).on("click", ".btnUpdate", function(event) {
	$("#hidUserIDSave").val($(this).data("userID"));
	$("#txtUserCode").val($(this).closest("tr").find('td:eq(0)').text());
	$("#txtUsername").val($(this).closest("tr").find('td:eq(1)').text());
	$("#txtPassword").val($(this).closest("tr").find('td:eq(2)').text());
	$("#txtEmail").val($(this).closest("tr").find('td:eq(3)').text());
	$("#txtAddress").val($(this).closest("tr").find('td:eq(4)').text());
	$("#txtDob").val($(this).closest("tr").find('td:eq(5)').text());
	$("#txtPhone").val($(this).closest("tr").find('td:eq(6)').text());

});
// Delete====================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "userAPI",
		type : "DELETE",
		data : "userID=" + $(this).data("userid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});
//Delete Function====================
function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


