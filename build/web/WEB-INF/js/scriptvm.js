/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//


function enviar_datos(arrayvalores) {
    var url = "procesardatos.jsp";
    $.ajax({
        type: "post",
        url: url,
        data: arrayvalores,
        success: function (datos) {
            $("" + arrayvalores['div'] + "").html(datos);
        }
    }
    );
}

function cargarIdCedUsuario(arrayvalores) {
    console.log(arrayvalores['usua_id']);
    var idus=$("input:radio[name=radio_id]:checked").val();
    console.log(idus);
    var url = "procesardatos.jsp";
    $.ajax({
        type: "post",
        url: url,
        data: arrayvalores,
        success: function (datos) {
            $("" + arrayvalores['div'] + "").html(datos);
        }
    }
    );
}

function cargarSelTab(arrayvalores) {
    console.log("select");
    var url = "procesardatos.jsp";
    $.ajax({
        type: "post",
        url: url,
        data: {opcion: "" + arrayvalores['opcion'] + ""},
        success: function (datos) {
            $("" + arrayvalores['select'] + "").html('<option value="0" selected>Seleccione</option>' + datos.substring(datos.indexOf("@") + 1, datos.indexOf("&")));
            $("" + arrayvalores['tabla'] + "").html(datos.substring(datos.indexOf("°") + 1, datos.indexOf("|")));
        }
    }
    );
}

function cargarSelTab2(arrayvalores){
   console.log("select");
    var url = "procesardatos.jsp";
   $.ajax({
       type: "post",
       url: url,
       data: {opcion: ""+arrayvalores['opcion']+""},
       success: function (datos) {
               $("" + arrayvalores['tabla'] + "").html(datos.substring(datos.indexOf("°")+1, datos.indexOf("|")));
       }
   }
   );
}
//
//$("#cargartc").click(function(){
//    console.log("select");
//     var url = "procesardatos.jsp";
//    $.ajax({
//        type: "post",
//        url: url,
//        data: {opcion: "get_tipo"},
//        success: function (datos) {
//                $("#tc_id").html('<option value="0" selected>Seleccione</option>'+datos.substring(datos.indexOf("@")+1, datos.indexOf("&")));
//                $("#tiposc").html(datos.substring(datos.indexOf("°")+1, datos.indexOf("|")));
//        }
//    }
//    );
//});
function obtenerdelform(form, div, pag) {
    $(document).ready(function () {
        $("" + form + "").submit(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $.ajax({
                type: "POST",
                url: "procesardatos.jsp",
                async: false,
                //Serializamos los datos del Form. Los parámetros son los NAME del formulario, no los id
                data: $(this).serialize(),
                success: function (data) {
                    $("" + div + "").html(data);
                    $("input:not([type=button],[type=submit],[type=radio],[type=hidden],[disabled])").val("");
                    $("select:not([disabled])").val("0");
                    console.log(data);
                },
                error: function (xml, msg) {
                    $("" + div + "").text("Error form");
                }
            }); //$.ajax
            return false;
        }); //submit
        // $("#contenido").load(""+pag+"");
    }); //ready
}

function autocompleta(arrayvalores) {
    var textoBusqueda = arrayvalores['busqueda'];
    if (textoBusqueda !== "") {
        $.post(
                arrayvalores['url'],
                arrayvalores,
                function (mensaje) {
                    $(arrayvalores['div']).html(mensaje);
                });
    } else {
        $("" + arrayvalores['div'] + "").html('');
    }
    ;
}
;

function reservar(arrayvalores) {
    var url = "procesardatos.jsp";
    $.ajax({
        type: "post",
        url: url,
        data: arrayvalores,
        success: function (datos) {
            $("" + arrayvalores['div'] + "").html(datos);
        }
    }
    );
}
function obtenerdelformU(form, div) {
    $(document).ready(function () {
        $("" + form + "").submit(function () {
            $.ajax({
                type: "POST",
                url: "procesardatos.jsp",
                async: false,
                //Serializamos los datos del Form. Los parámetros son los NAME del formulario, no los id
                data: $(this).serialize(),
                success: function (data) {
                    $("" + div + "").html(data);
                    $("input:not([type=button],[type=submit])").val("");
                },
                error: function (xml, msg) {
                    $("" + div + "").text("Error");
                }
            }); //$.ajax
            return false;
        }); //submit
    }); //ready
}
//function enviar_datosbusc(id_busc, opcion, div) {
//    var idbusc = document.getElementById(id_busc).value;
//    var opc = document.getElementById(opcion).value;
//    var url = "procesardatos.jsp";
//    console.log(opc);
//    $.ajax({
//        type: "post",
//        url: url,
//        data: {tc_id: idbusc, opcion: opc},
//        success: function (datos) {
//            $(""+div+"").html(datos);
//        }
//    }
//    );
//}

//
//function modificar_datos(algo){
//	var idt=document.getElementById("tc_id").value;
//	var nomb=document.getElementById("tc_nombre").value;
//	var descrp=document.getElementById("tc_descripcion").value;
//	var prec=document.getElementById("tc_precio").value;
//	var opcn="tpc "+algo;
//	console.log(opcn);
//	var url="procesardatos.jsp";
//	$.ajax({
//		type:"post",
//		url:url,
//		data:{tc_id:idt, tc_nombre:nomb, tc_descripcion:descrp, tc_precio:prec, opcion:opcn},
//		success:function(datos){
//			$("#mdftipoc").html(datos);
//		}
//	}
//	);
//}

//function realizaProceso(arrayids, div) {
//                var parametros = arrayids;
//                console.log(div);
//                $.ajax({
//                    data: parametros,
//                    url: 'procesardatos.jsp',
//                    type: 'post',
//                    beforeSend: function () {
//                        $(""+div+"").html("Procesando, espere por favor...");
//                    },
//                    success: function (response) {
//                        $(""+div+"").html(response);
//                    }
//                });
//            }

//

//

//
//function modificar_datos(){
//	var idt=document.getElementById("tc_id").value;
//	var nomb=document.getElementById("tc_nombre").value;
//	var descrp=document.getElementById("tc_descripcion").value;
//	var prec=document.getElementById("tc_precio").value;
//	var opcn="mod";
//	console.log(opcn);
//	var url="procesar_ajax.php";
//	$.ajax({
//		type:"post",
//		url:url,
//		data:{tc_id:idt, tc_nombre:nomb, tc_descripcion:descrp, preciotip:prec, opc:opcn},
//		success:function(datos){
//			$("#mdftipoc").html(datos);
//		}
//	}
//	);
//}
//function algoquefunciona() {
//    $(document).ready(function () {
//        $("#tc_id").change(function (event) {
//            var tc_id = $('#tc_id').val();
//            var opcion = $('#opcion').val();
//            // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
//            $.post('procesardatos.jsp', {
//                tc_id: tc_id,
//                opcion: opcion;
//            }, function (responseText) {
//                $('#mdftipoc').html(responseText);
//            });
//        });
//    });
//}
//
