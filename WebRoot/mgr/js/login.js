$(document).ready(function() {

	$("#login_button").click(function() {
		var urlpath="/mall/mgr/";
		var username = $('#username').val();
		var password = $('#password').val();
		$.get(urlpath+"loginAdmin.do", {
			aid : username,
			apassword : password
		}, function(data, status) {
			
			if(status){
				if(data.status)
					//window.location.href=urlpath+"index.html";
					history.back();
				else{
					$('#error-message').html(data.msg);
					$('#error_span').show();
				}
					
			}else{
				alert('请求失败');				
			}
			 
		});

	});

});