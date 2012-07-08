$(document).ready(function(){
	$.validator.setDefaults({
		errorElement: "p",
		errorLabelContainer: ".alert-error"
		/*
		errorPlacement: function(error, element) {
			$(".alert-error").append(error)
		}
		*/
	});	
	
	$("#login-form").validate({
		rules: {
			"user[username]": "required",
			"user[clear_password]": "required"
		},
		messages: {
			"user[username]": "Username is required",
			"user[clear_password]": "Password is required"
		}  
	});
	
	$("#resetpasswd-form").validate({
		rules: {
			"user[clear_password]": "required",
			"user[clear_password_confirmation]": {
				required: true,
				equalTo: "#passwd"
			}
		},
		messages: {
			"user[clear_password]": "Password is required",
			"user[clear_password_confirmation]": {
				required: "Confirm Password",
				equalTo: "Password mismatch"
			}
		}  
	});	

	$("#user-form").validate({
		rules: {
			"user[first_name]": "required",
			"user[last_name]": "required",
			"user[username]": "required",
			"user[phone_number]": "required",
			"user[clear_password]": {
				required: function() {
					return $("#add-user").val() == 1;
				}
			},
			"user[clear_password_confirmation]": {
				required: function() {
					return $("#add-user").val() == 1;
				},
				equalTo: "#user_clear_password"
			}			
		},
		messages: {
			"user[first_name]": "First Name is required",
			"user[last_name]": "Last Name is required",
			"user[username]": "User Name is required",
			"user[phone_number]": "Phone Number is required",
			"user[clear_password]": "Password is required",
			"user[clear_password_confirmation]": {
				required: "Confirm Password",
				equalTo: "Password mismatch"
			}
		}  
	});		
	
	
	$("#org-form").validate({
		rules: {
			"organisation[name]": "required",
			"organisation[address1]": "required",
			"organisation[city]": "required",
			"organisation[state]": "required",
			"organisation[zip]": "required",
			"organisation[business_phone_number]": "required",
			"organisation[domain]": "required"
		},
		messages: {
			"organisation[name]": "Organization Name is required",
			"organisation[address1]": "Address Line 1 is required",
			"organisation[city]": "City is required",
			"organisation[state]": "State is required",
			"organisation[zip]": "Zip code is required",
			"organisation[business_phone_number]": "Phone Number is required",
			"organisation[domain]": "Organization domain is required"
		}  
	});	
	
	
});