
<%@page import="clases.metodos" %>
<%@page import="clases.factura" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto de Prueba 1</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" href="../login/css/alertify.core.css">
        <link rel="stylesheet" href="../login/css/alertify.default.css">
        <script src="../js/scriptvm.js"></script>
        <script src="../js/jquery.min.js"></script>
    </head>
    <body>
        <jsp:useBean id="obj"  class="clases.usuario" scope="session" />
        <jsp:setProperty name="obj" property="*" /> 
        <jsp:useBean id="usercli"  class="clases.usuario" scope="application" />
        <jsp:setProperty name="usercli" property="*" /> 
        <jsp:useBean id="obju"  class="clases.usuariorol" scope="session" />
        <jsp:setProperty name="obju" property="*" /> 
        <jsp:useBean id="beanserv" scope="application" class="clases.servicio" />
        <jsp:setProperty name="beanserv" property="*" />
        <jsp:useBean id="beancab" scope="application" class="clases.cabania" />
        <jsp:setProperty name="beancab" property="*" />
        <jsp:useBean id="beantipcab" scope="application" class="clases.tipocab" />
        <jsp:setProperty name="beantipcab" property="*" />
        <jsp:useBean id="beantemcabr"  class="clases.temporal_cabania_r" scope="session" />
        <jsp:setProperty name="beantemcabr" property="*" /> 
        <jsp:useBean id="beantemservr"  class="clases.temporal_servicio_r" scope="session" />
        <jsp:setProperty name="beantemservr" property="*" /> 
        <jsp:useBean id="beanservr"  class="clases.servicio_r" scope="session" />
        <jsp:setProperty name="beantemservr" property="*" /> 
        <jsp:useBean id="beancabr"  class="clases.cabania_r" scope="session" />
        <jsp:setProperty name="beantemservr" property="*" /> 
        <jsp:useBean id="beanreservc"  class="clases.reserva_c" scope="session" />
        <jsp:setProperty name="beantemservr" property="*" /> 
        <jsp:useBean id="beanreservs"  class="clases.reserva_s" scope="session" />
        <jsp:setProperty name="beantemservr" property="*" /> 
        <jsp:useBean id="cab_r"  class="clases.cabania_r" scope="session" />
        <jsp:setProperty name="cab_r" property="*" />
        <jsp:useBean id="beanfact"  class="clases.factura" scope="session" />
        <jsp:setProperty name="beanfact" property="*" /> 
        <%
            //String cade=objeto.pruebaa();
            //out.print("<div class='respuesta'>"+cade+"</div>");
            String opcion =request.getParameter("opcion");
            String cade="";
            String datostc="";
            String tablatc="";
            String tablare="";
            String tablarc="";
            String tablacd="";
            String tablafac="";
            String tabladt="";
            Object[] datos=null;
            int cant=0;
            int idrs=0;
            int idusua=0;
            int idrc=0;
            //out.print("<h2>la opcion es "+opcion+" "+beantipcab.getTc_id()+" "+" "+beantipcab.getTc_nombre()+" "+beantipcab.getTc_descripcion()+" "+beantipcab.getTc_precio()+"<h2>");
            switch(opcion){
                case "servinsert":
                    if(beanserv.registraserv()){
        %>
        <script>
            alertify.success('El servicio ha sido registrado con exito.');
        </script>
        <%
                    }else{
        %>
        <script>
            alertify.error('Ya existe un servicio con ese nombre.');
        </script>
                        <%
                    }
                    break;
                case "buscserv": 
                    datos=beanserv.buscar();
                    out.print("<p class='margin'>Formulario de modificar Servicios</p>"
                            + "<form class='' name='mserv' id='mserv' method='post'>"
                            + "<div class='box-body'>"
                            + "<div class='form-group'>"
                            + "<label for='serv_id'>ID de tipo de cabaña</label>"
                            + "<input disabled type='text' class='form-control' id='serv_id' name='serv_id' value='"+datos[0]+"'>"
                            + "</div>"
                            + "<div class='form-group'>"
                            + "<label for='serv_nombre'>Nombre</label>"
                            + "<input type='text' class='form-control' id='serv_nombre' name='serv_nombre' value='"+datos[1]+"'>"
                            + "</div>"
                            + "<div class='form-group'>"
                            + "<label for='serv_descripcion'>Descripcion</label>"
                            + "<input type='text' class='form-control' id='serv_descripcion' name='serv_descripcion' value='"+datos[2]+"'>"
                            + "</div>"
                            + "<div class='form-group'>"
                            + "<span class='input-group-addon'>Precio $</span>"
                            + "<input type='text' class='form-control' id='serv_precio' name='serv_precio' value='"+datos[3]+"'>"
                            + "</div>"
                            + "</div>"
                            + "<input type='hidden' id='opcion' name='opcion' value='servmodif'>"
                            + "<!-- /.box-body -->"
                            + "<div class='box-footer'>"
                            + "<input type='submit' name='modificar' href='javascript:;' "
                            + "onclick=\"obtenerdelform('#mserv', '#mdfserv', 'pages/gestionserv.jsp');\" value='Actualizar' class='btn btn-primary'>"
                            + "</div>"
                            + "</form>");
                    break;
                case "servmodif": 
                    if(beanserv.modificar()){
                        %>
                        <script>
                            alertify.success('El servicio ha sido modificado con exito.');
                        </script>
                        <%
                           }else{
                        %>
                        <script>
                            alertify.error('El servicio no ha sido modificado con exito.');
                        </script>
                        <%

                       }
                       break;
                   case "tcinsert":
                       if(beantipcab.registratipoc()){
                        %>
                        <script>
                            alertify.success('El tipo de cabaña ha sido registrado con exito.');
                        </script>
                        <%
                           beancab.setTc_id(Integer.valueOf(beantipcab.getTc_id()));
                           if(beancab.registracabBlque(Integer.valueOf(request.getParameter("tc_cant")))){
                        %>
                        <script>
                            alertify.success('El numero indicado de cabañas de este tipo han sido registradas con exito.');
                        </script>
                        <%
                           }else{
                        %>
                        <script>
                            alertify.error('No se ha insertado la cantidad de cabañas especificada.');
                        </script>
                        <%
                           }
                              }else{
                        %>
                        <script>
                            alertify.error('No se ha insertado el tipo cabaña.');
                        </script>
                        <%
                               }
                       break;
                   case "busctc":
                       datos=beantipcab.buscar();
                       //cant=beancab.obtenercantidad(Integer.valueOf(beantipcab.getTc_id()));
                       out.print("<p class='margin'>Formulario de modificar tipo de cabaña</p>"
                               + "<form class='' name='mtc' id='mtc' method='post'>"
                               + "<div class='box-body'>"
                               + "<div class='form-group'>"
                               + "<label for='tc_id'>ID de tipo de cabaña</label>"
                               + "<input disabled type='text' class='form-control' id='tc_id' name='tc_id' value='"+datos[0]+"'>"
                               + "</div>"
                               + "<div class='form-group'>"
                               + "<label for='tc_nombre'>Nombre</label>"
                               + "<input type='text' class='form-control' id='tc_nombre' name='tc_nombre' value='"+datos[1]+"'>"
                               + "</div>"
                               + "<div class='form-group'>"
                               + "<label for='tc_descripcion'>Descripcion</label>"
                               + "<input type='text' class='form-control' id='tc_descripcion' name='tc_descripcion' value='"+datos[2]+"'>"
                               + "</div>"
                               + "<div class='form-group'>"
                               + "<span class='input-group-addon'>Precio $</span>"
                               + "<input type='text' class='form-control' id='tc_precio' name='tc_precio' value='"+datos[3]+"'>"
                               + "</div>"
                               + "</div>"
                               + "<input type='hidden' id='opcion' name='opcion' value='modtpc'>"
                               + "<!-- /.box-body -->"
                               + "<div class='box-footer'>"
                               + "<input type='submit' name='modificar' href='javascript:;' "
                               + "onclick=\"obtenerdelform('#mtc', '#mdftipoc', 'pages/gestioncab.jsp');\" value='Actualizar' class='btn btn-primary'>"
                               + "</div>"
                               + "</form>");
                       break;
                   case "modtpc":
                       if(beantipcab.modificar()){
                        %>
                        <script>
                            alertify.success(" El tipo de cabaña ha sido actualizado con exito.");
                        </script>
                        <%
                      }else{
                        %>
                        <script>
                            alertify.error(" El tipo de cabaña no ha sido actualizado con exito.");
                        </script>

                        <%
                            }
                   break;

                   case "login":
                          session.setMaxInactiveInterval(1800);  // 30 minute time out 
                          obj.login();
                          if (obj.isLoggedIn()) {
                              String nomC=obj.getUsua_primernombre()+" "+obj.getUsua_primerapellido();
                              int id_rol=obju.obtenerRol(obj.getUsua_id());
                              session.setAttribute("idrol",id_rol);
                              session.setAttribute("nombre",nomC);
                              out.println("usuario logueado");
                          } else {
                              out.println("login invalido");
                          }
                          break; 

                   case "logout":
                              session.removeAttribute("nombre");
                              if(session.getAttribute("nombre") == null){
                                  out.println("salio");
                          }
                              else{
                                  out.println("se quedo");
                          }
                   break; 
                   case "usuainsert":
                          cade=obj.getUsua_primernombre();
                          if(obj.registrausua()){
                        %>
                        <script>
                            alertify.success("El usuario ha sido registrado con exito.");
                        </script>
                        <%
                    }else{
                        %>
                        <script>
                            alertify.error("El usuario ya existe, no ha registrado con exito.");
                        </script>
                        <%
                    }
                    break;
                    case "buscusua":
                    datos=obj.buscar();
                    out.print("<p class='margin'>Formulario de modificar usuario</p>"
                    + "<form name='modusua' id='modusua' method='post'>"
                     + "<div class='box-body'>"
                         + "<div class='form-group'>"
                             + "<label for='usua_id'>Id de usuario</label>"
                             + "<input disabled type='text' class='form-control' id='usua_id' name='usua_id' value='"+datos[0]+"'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_cedula'>Cedula</label>"
                             + "<input disabled type='number' class='form-control' name='usua_cedula' id='usua_cedula' value='"+datos[1]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_primernombre'>Primer nombre</label>"
                             + "<input type='text' class='form-control' name='usua_primernombre' id='usua_primernombre' value='"+datos[2]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_segundonombre'>Segundo nombre</label>"
                             + "<input type='text' class='form-control' name='usua_segundonombre' id='usua_segundonombre' value='"+datos[3]+"'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_primerapellido'>Primer Apellido: </label>"
                             + "<input type='text' class='form-control' name='usua_primerapellido' id='usua_primerapellido' value='"+datos[4]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_segundoapellido'>Segundo Apellido: </label>"
                             + "<input type='text' class='form-control' name='usua_segundoapellido' id='usua_segundoapellido' value='"+datos[5]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_telefono'>Telefono: </label>"
                             + "<input type='text' class='form-control' name='usua_telefono' id='usua_telefono' value='"+datos[6]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_direccion'>Direccion: </label>"
                             + "<input type='text' class='form-control'  name='usua_direccion' id='usua_direccion' value='"+datos[7]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_fechanacimiento'>Fecha de Nacimiento: </label>"
                             + "<input type='date' class='form-control' name='usua_fechanacimiento' id='usua_fechanacimiento' value='"+datos[8]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_usuario'>Usuario: </label>"
                             + "<input type='text' class='form-control' name='usua_usuario' id='usua_usuario' value='"+datos[9]+"' required='required'>"
                             + "</div>"
                         + "<div class='form-group'>"
                             + "<label for='usua_clave'>Clave: </label>"
                             + "<input type='password' class='form-control' name='usua_clave' id='usua_clave' value='"+datos[10]+"' required='required'>"
                             + "</div>"
                         + "</div>"
                     + "<input type='hidden' name='opcion' value='usuamodif'>"
                     + "<!-- /.box-body -->"
                     + "<div class='box-footer'>"
                         + "<input type='submit' name='modificar' href='javascript:;' "
                                   + "onclick=\"obtenerdelform('#modusua', '#mdfusua', 'pages/gestionusua.jsp');\" value='Actualizar' class='btn btn-primary'>"
                                   + "</div>"
                     + "</form>");

                    break;


                    case "usuamodif": 
                    if(obj.modificar()){
                        %>
                        <script>
                            alertify.success("El usuario ha sido actulizado con exito.");
                        </script>
                        <%
                    }else{
                        %>
                        <script>
                            alertify.success("El usuario no ha sido actualizado con exito.");
                        </script>
                        <%
                    }
                    break;
                    case "get_tipo":
                    datostc=beantipcab.listSelecttc();
                    tablatc=beantipcab.Tablatc();
                    out.println("@"+datostc+"&");
                    out.println("°"+tablatc+"|");
                    break;
                    case "get_tc":
                    datostc=beantipcab.listSelecttc();
                    out.println("<select class='form-control' name='tc_id' id='tc_id'>"
                        + "<option value='0'>Seleccione</option>"+datostc+"</select>");
                    break;
                    case "get_cab":
                    datostc=beancab.listSelectcab();
                    out.println("<select onChange=\"enviar_datos({cab_id: $('#cab_id').val(), opcion: 'buscab', div: '#mdfcab'});\" class='form-control' name='cab_id' id='cab_id'>"
                        + "<option value='0'>Seleccione</option>"+datostc+"</select>");
                    break;
                    case "get_idced":
                    datos=usercli.buscarid();
                    out.print("<input type='hidden' name='usua_id' id='usua_id' value='"+usercli.getUsua_id()+"'>"
                    + "<input type='hidden' name='usua_cedula' id='usua_cedula' value='"+usercli.getUsua_cedula()+"'>");
                    break;
                    case "get_reserva":
                    tablare=metodos.ListarResSer();
                    out.println("°"+tablare+"|");
                    break;
                case "get_reserv":
                    tablarc=metodos.ListarResCab();
                    out.println("°"+tablarc+"|");
                    break;
                case "get_cabdisp":
                    tablacd=metodos.ListarCabDis();
                    out.println("°"+tablacd+"|");
                    break;
                case "get_facturas":
                    tablafac=cab_r.llamartabla();
                //metodos.ListarFacturas();
                    out.println("°"+tablafac+"|");
                    break;

                case "get_tipo2":
                    datostc=beantipcab.listSelecttc();
                    //tablatc=beantipcab.Tablatc();
                    out.println("@"+datostc+"&");
                    //out.println("°"+tablatc+"|");
                    break;
                case "get_disptipo":
                        //tabladt=beancab.llamartabla();
                        //metodos.ListarFacturas();
                        //out.println("°"+tablafac+"|");
                        //break;
                    //datostc=beantipcab.listSelecttc();
                    tabladt=beancab.llamartabla();
                    //out.println("@"+datostc+"&");
                    out.println("°"+tabladt+"|");
                    break;
                    case "regcab":
                                if(beancab.registracabBlque(Integer.valueOf(request.getParameter("tc_cant")))){
                    %>
                    <script>
                        alertify.success('las cabañas han sido registradas con exito.');
                    </script>
                    <%
                                }else{
                    %>
                    <script>
                        alertify.error('No s ha podido registrar.');
                    </script>
                                    <%
                                }
                        break;                        
                    case "buscab":
                                        datostc = beantipcab.listSelecttc();
                                        datos=beancab.buscar();
                                        out.print("<p class='margin'>Formulario de modificar cabaña</p>"
                                            + "<form class='' name='mdcab' id='mdcab' method='post'>"
                                            + "<div class='box-body'>"
                                            + "<div class='form-group'>"
                                            + "<label for='cab_id'>Id de cabaña</label>"
                                            + "<input disabled type='text' class='form-control' id='cab_id' name='cab_id' value='"+datos[0]+"'>"
                                            + "</div>"
                                            + "<div class='form-group'>"
                                            + "<label for='cab_numero'>Numero</label>"
                                            + "<input type='text' class='form-control' id='cab_numero' name='cab_numero' value='"+datos[1]+"'>"
                                            + "</div>"
                                            + "<div class='form-group'>"
                                            + "<label for='cab_estado'>Estado</label>"
                                            + "<input type='text' class='form-control' id='cab_estado' name='cab_estado' value='"+datos[2]+"'>"
                                            + "</div>"
                                            + "<div class='form-group'>"
                                            + "<label>Seleccione el tipo de caba&#241;a</label>"
                                            + "<select class='form-control' name='tc_id' id='tc_id'>"
                                            + "<option >Seleccione</option>                                                                "
                                            + ""+datostc+""
                                            +"</select>"
                                            + "</div>"
                                            + "</div>"
                                            + "<input type='hidden' id='opcion' name='opcion' value='modifcab'>"
                                            + "<!-- /.box-body -->"
                                            + "<div class='box-footer'>"
                                            + "<input type='submit' name='modificar' href='javascript:;' "
                                            + "onclick=\"obtenerdelform('#mdcab', '#mdfcab', 'pages/gestioncab.jsp');\" value='Actualizar' class='btn btn-primary'>"
                                            + "</div>"
                                            + "</form>");
                                        break;

                                    case "modifcab": 
                                    if(beancab.modificar()){
                        %>
                        <script>
                            alertify.success('Se han realizado las modificaciones correctamente');
                        </script>
                        <%
                                    }else{
                        %>
                        <script>
                            alertify.error('No se ha realizado la modificacion.');
                        </script>
                                        <%
                                    }
                                    break;
                                    case "tempcabr":
                                        if(beantemcabr.registratempcab_r()){
                        %>
                        <script>
                            alertify.success('Se ha añadido con exito a su lista');
                        </script>
                        <%
                                    }else{
                        %>
                        <script>
                            alertify.error('No se ha guardado los datos.');
                        </script>
                                        <%
                                    }
                                    break;
                                    case "tempservr":
                                        if(beantemservr.registratempserv_r()){
                        %>
                        <script>
                            alertify.success('Se ha añadido con exito a su lista');
                        </script>
                        <%
                                    }else{
                        %>
                        <script>
                            alertify.error('No se ha guardado los datos.');
                        </script>
                                        <%
                                    }
                                    break;
                                    case "finreserv":
                                        boolean ss=false;            
                                        ss=beanreservc.registrareserva_c(Integer.valueOf(request.getParameter("usua_id")));
                                        idrc=beanreservc.getRc_id();
                                        idusua=Integer.valueOf(request.getParameter("usua_id"));
                                        ss=beanreservs.registrareserva_s(idusua);
                                        idrs=beanreservs.getRs_id();
                                        ss=beancabr.registracab_r(idusua, idrc);
                                        ss=beanservr.registraserv_r(idusua, idrs);
                                        if(ss){
                        %>
                        <script>
                            alertify.success('Se ha realizado la reserva con exito');
                        </script>
                        <%
                                    }else{
                        %>
                        <script>
                            alertify.error('No se ha podido realizar la reserva');
                        </script>
                                        <%
                                    }
                                    break;
                                    case "busca":
                                        int buscando=Integer.valueOf(request.getParameter("busqueda"));
                                        //String campo=request.getParameter("busqueda");
                                        String busca=usercli.Construyebusqueda(buscando);
                                        out.print(busca);
                                        break;
                                    case "factura":
                                            String funcion=beanfact.factura(idusua,idrs,idrc);
                                            out.print(funcion);
                                            if(funcion.equals("factura guardada")){
                                            out.println("exito");
                                            String [] array=new String[5];
                                            array[0]=""+beanfact.getFac_id();
                                            array[1]=""+beanfact.getSubTotalc();
                                            array[2]=""+beanfact.getSubTotals();
                                            array[3]=""+beanfact.getFac_precio();
                                            array[4]=""+beanfact.getFac_fecha();  
                                            /*out.println(beanfact.getFac_id());  
                                            out.println(beanfact.getSubTotals());  
                                            out.println(beanfact.getSubTotalc());  
                                            out.println(beanfact.getFac_precio());  
                                            out.println(beanfact.getFac_fecha()); 
                                            out.println(array[0]);  
                                            out.println(array[1]);
                                            out.println(array[2]);
                                            out.println(array[3]);
                                            out.println(array[4]);*/
                                            out.print(array[0]+","+array[1]+","+array[2]+","+array[3]+","+array[4]+",");

                                        }else {
                                            out.println("invalido");
                                        }

                    }
                        %>

        <script src="../login/js/alertify.min.js"></script>
    </body>

</html>
