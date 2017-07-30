var Mgr={};
function no_login_jmp(){
	window.location.href="login.html";
}

$(document).ready(function() {
        var arrayList =[];	    
		var urlpath="/mall/mgr/";
		$.ajaxSetup({cache:false}); 
		$.get(urlpath+"checkLogin.do", {
		}, function(data, status) {
			
			if(status){
				if(data.status){
					initLogin(data.username);
					executeEvent();
				}else{
					no_login_jmp();
				}       
			}else{
				alert('请求失败');				
			}
			 
		});
	
	 function executeEvent(){
	    	for(var k in arrayList){
	    		arrayList[k]();
	    	}
	 }
	  Mgr.addEvent=function (e){
    	 arrayList.push(e);
     };
     
     function initLogin(username){
        $('#user_name').html(username);
     	$('#login_span').toggle();
     	$('#user_span').toggle();
   
     }
     
     $('#logout_bt').click(function(){
    	 $.ajaxSetup ({ cache: false });
    	 $.get(urlpath+"logoutAdmin.do", {
 		}, function(data, status) {
 			
 			if(status){
 				 window.location.href=urlpath+'index.html'; 				
 			}else{
 				alert('请求失败');				
 			}
 			 
 		});
    	 return false;
     });

});