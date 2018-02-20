// Easy way to wait for all videos to load before start playing
$("#logf").submit(function (e) {
      //console.log("llego ac");
    e.preventDefault();
    var url = '../control/procesardatos.jsp';
    $.ajax({
        type: "POST",
        url: url,
        data: {
            usua_usuario: $("#user").val()
            , usua_clave: $("#pass").val()
            , opcion: $("#boton").val()
        }, // serializes the form's elements.
        success: function (data)
        {
            if (data.includes("usuario logueado")) {
                window.location.href = "../control/indexadmin.jsp";
                //console.log("llego aca");
            } else {
                alertify.error("Usuario o contraseña erroneo");
            }
        }
    });
});
$("#btm").click(function (e) {
    var url = '../control/procesardatos.jsp';
    $.ajax({
        type: "POST",
        url: url,
        data: {opcion: "factura"
        }, // serializes the form's elements.
        success: function (data)
        {
            if (data.includes("exito")) {
                console.log(data);
                //var campos = data.substring(data.indexof('&')+1, data.indexof('&') );
                var campos=data;
                campos = campos.split(",");
                $("#stc").val(campos[1]);
                $("#str").val(campos[2]);
                $("#st").val(campos[3]);
                $("#fec").val(campos[4]);
                $('#myModal').modal('show');
                   
            } else {
                alertify.error("Generacion de factura cancelada");
            }
        }
    });
    });
//function loginn(arrayvalores) {
////onclick="loginn({form: '#logf', usua_usuario: $('#user').val(), usua_clave: $('#pass').val(), opcion: 'login', url: '../control/procesardatos.jsp', index:'../control/indexadmin.jsp'});"
//    $(""+arrayvalores['form']+"").submit(function (e) {
//
//        //console.log("llego ac");
//        e.preventDefault();
//        console.log("entra login url: " + arrayvalores['url'] + "");
//        console.log("entra login index: " + arrayvalores['index'] + "");
//        console.log("entra login opcion: " + arrayvalores['opcion'] + "");
//        console.log("entra login usuario: " + arrayvalores['usua_usuario'] + "");
//        console.log("entra login contraseña: " + arrayvalores['usua_clave'] + "");
//        var url = arrayvalores['url'];
//        $.ajax({
//            type: "POST",
//            url: url,
//            data: arrayvalores, // serializes the form's elements.
//            success: function (datos)
//            {
//                console.log("ejecuta function");
//                if (datos.includes("usuario logueado")) {
//                    window.location.href = "" + arrayvalores['index'] + "";
//                    //console.log("llego aca");
//                } else {
//                    alertify.error("Usuario o contraseña erroneo");
//                }
//            }
//        });
//    });
//}

function logOut(arrayvalores) {
    var url = arrayvalores['url'];
    $.ajax({
        type: "POST",
        url: url,
        data: arrayvalores,
        success: function (data)
        {
            if (data.includes("salio")) {
                window.location.href = "" + arrayvalores['index'] + "";
            } else {
                alertify.error("Usuario o contraseña erroneo");
            }
        }
    });

}
//$("#salir").click(function () {
//
//    var url = "procesardatos.jsp";
//    $.ajax({
//        type: "POST",
//        url: url,
//        data: {opcion: "logout"},
//        success: function (data)
//        {
//            if (data.includes("salio")) {
//                window.location.href = "../login/login.html";
//            } else {
//                alertify.error("Usuario o contraseña erroneo");
//            }
//        }
//    });
//
//});
