var Admin=function(){
	this.cerrar_sesion=function(){
		$.ajax({
			url: "cerrarsesion.php",
			type:"POST",
			success: function(result){
	       if(result == 1)
	       {
	       	   window.location.href = "http://localhost/cambios/hawaiiblue/login";
	       }
	       else{
	       	   console.log(result);
	       }
	    }
		});
	};
}
var admin= new Admin();
$(function(){
	$("#cerrar_session").click(function(){
		admin.cerrar_sesion();
	});

});