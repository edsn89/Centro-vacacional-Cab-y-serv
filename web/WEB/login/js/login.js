var Login = function(){
	this.nombre = "";

	this.iniciarSesion = function(){
		var usuario = $("#usuario").val();
		var password = $("#password").val();
		console.log("Usuario "+usuario+" password "+password);
		$.ajax({
			url: "login2.php",
			data:{usuario:usuario,password:password},
			type:"POST",
			success: function(result){
	       console.log(result);
	       console.log((result === 'OK'));
	       if(result == 1)
	       {
	       	   window.location.href = "http://localhost/cambios/hawaiiblue/control/";
	       }
	       else{
	       	   console.log(result);
	       }
	    }
		});
	}
}

var login = new Login();
$(function(){
	$("#button_login").click(function(){
		login.iniciarSesion();
	});

});