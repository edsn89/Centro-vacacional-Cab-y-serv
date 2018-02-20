<%-- 
    Document   : gestionreservas
    Created on : 27/01/2017, 09:49:04 PM
    Author     : Angelica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj"  class="clases.usuario" scope="session" />
<jsp:setProperty name="obj" property="*" /> 
<jsp:useBean id="beantipcab" scope="application" class="clases.tipocab" />
<jsp:setProperty name="beantipcab" property="*" />
<jsp:useBean id="beanserv" scope="application" class="clases.servicio" />
<jsp:setProperty name="beanserv" property="*" />
<jsp:useBean id="usercli"  class="clases.usuario" scope="session" />
<jsp:setProperty name="usercli" property="*" /> 
<% String rol=String.valueOf(session.getAttribute("idrol"));
int ced=obj.getUsua_cedula();
String datostc = beantipcab.listSelecttc();
String datosserv = beanserv.listSelectserv();
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Main Villa marina | Gestionar reservas</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
        folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    </head>
    <body>
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Formularios de gesti&#243;n de reservas y servicios
                <small>Preview</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Realizar reservas de caba&#241;as y servicios </li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- START ACCORDION & CAROUSEL-->
            <h2 class="page-header">Reservar caba&#241;as y servicios</h2>

            <div class="row">
                <div class="col-md-6">

                    <div class="box box-solid">
                        <div class="box-header with-border">
                            Realizar una resrva Villa Marina.
                        </div>

                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                Informacion del usuario
                                            </a> 
                                        </h4>

                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse">

                                        <form accept-charset="utf-8" method="POST">
                                            <div class="form-group">
                                                <label for="sr_fecha">Busqueda de usuarios por cedula</label>
                                            </div>
                                            <div class="form-group">
                                                <% if(rol.equals("11001")){
                                    out.print("<input class='form-control' type='number' onkeyup=\"autocompleta({busqueda: $('#busqueda').val(), opcion: 'busca', div: '#resultadoBusqueda', url: 'procesardatos.jsp'})\" type='text' name='busqueda' id='busqueda' value='' placeholder='Escriba la cedula del cliente...' maxlength='50' autocomplete='off'/>");
                                }else{
                                    out.print("<input type='hidden' class='form-control' name='usua_cedula' id='usua_cedula' value='"+ced+"'>");
                                    out.print("<label for='usua_cedul'>Cedula de usuario</label><input disabled type='number' class='form-control' name='usua_cedul' id='usua_cedul' value='"+ced+"'>");
                                    }%>
                                            </div>
                                        </form>
                                        <div id="resultadoBusqueda">
                                        </div>

                                    </div>
                                </div>

                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" onclick="cargarIdCedUsuario({usua_id: $('input:radio[name=radio_id]:checked').val(), opcion: 'get_idced', div: '#usuaidced'});">
                                                Realizar reserva de caba&#241;a 
                                            </a> 
                                        </h4>

                                    </div>
                                    <div id="collapsetwo" class="panel-collapse collapse">
                                        <form name="cabreserv" id="cabreserv" method="post">
                                            <div class="box-body">
                                                <div id="usuaidced" class="form-group">

                                                </div>
                                                <div class="form-group">
                                                    <label for="cr_fechaentrada">Fecha de entrada</label>
                                                    <input type="date" class="form-control" name="cr_fechaentrada" id="cr_fechaentrada">
                                                </div>
                                                <div class="form-group">
                                                    <label for="cr_fechasalida">Fecha de salida</label>
                                                    <input type="date" class="form-control" name="cr_fechasalida" id="cr_fechasalida" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Seleccione el tipo de caba&#241;a</label>
                                                    <div class="box-body">
                                                        <!-- <div class="input-group input-group-sm"> -->
                                                        <select  class="form-control" name="tc_id" id="tc_id">
                                                            <option value="0">Seleccione</option>
                                                            <%out.print(datostc);%>
                                                        </select>
                                                        <!-- </div> -->
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <span class="input-group-addon">Cantidad</span>
                                                    <input type="number" class="form-control" name="cr_cantidad" id="cr_cantidad" placeholder="ingrese Cantidad">
                                                </div>
                                                <input type="hidden" name="opcion" value="tempcabr">
                                            </div>
                                            <!-- /.box-body -->

                                            <div class="box-footer">
                                                <button type="submit" onclick="obtenerdelform('#cabreserv', '#mejcabreserv', 'pages/gestioncab.jsp');" name="registrartipo" class="btn btn-primary">Registrar</button>
                                            </div>
                                        </form>
                                        <div id="mejcabreserv">

                                        </div>
                                    </div>
                                </div>

                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapsethree" onclick="cargarIdCedUsuario({usua_id: $('input:radio[name=radio_id]:checked').val(), opcion:'get_idced', div: '#usuacedid'});">
                                                Realizar reserva de servicios
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapsethree" class="panel-collapse collapse">

                                        <form name="inserv" id="inserv"  method="post">
                                            <div class="box-body">

                                                <label>Seleccione el servicio</label>
                                                <div class="box-body">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    <select  class="form-control" name="serv_id" id="serv_id">
                                                        <option value="0">Seleccione</option>
                                                        <!-- Colocar aqui las opciones del selct con ajax -->
                                                        <%out.print(datosserv);%>
                                                    </select>
                                                    <!-- </div> -->
                                                </div>
                                            </div>
                                            <div id="usuacedid" class="form-group">

                                            </div>
                                            <div class="form-group">
                                                <label for="sr_fecha">Fecha</label>
                                                <input type="date" class="form-control" name="sr_fecha" id="sr_fecha">
                                            </div>
                                            <div class="form-group">
                                                <label for="sr_cantidad">Cantidad de servicios</label>
                                                <input type="number" class="form-control" name="sr_cantidad" id="sr_cantidad" placeholder="cantidad de servios a reservar">
                                            </div>

                                            <input type="hidden" name="opcion" value="tempservr">

                                            <!-- /.box-body -->

                                            <div class="box-footer">
                                                <input type="submit" href="javascript:; " onclick="obtenerdelform('#inserv', '#insertsmsj', 'pages/gestionreservas.jsp');" name="registrareserva" class="btn btn-primary" value="Registrar">
                                            </div>
                                        </form>
                                        <div id="insertsmsj">

                                        </div>

                                    </div>
                                </div>
                                <form name="formfinreserv">
                                    <div class="box-header with-border">
                                        <input id="btm" type="submit" href="javascript:; " onclick="enviar_datos({usua_id: $('input:radio[name=radio_id]:checked').val(), opcion: 'finreserv', div: '#msjfinreserv'});" name="registrareserva" class="btn btn-primary" value="Finalizar Reserva">
                                    </div>
                                </form>
                                <div id="msjfinreserv">

                                </div>

                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-6">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <h3 class="box-title">Carousel</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="item active left">
                                            <img src="http://placehold.it/900x500/39CCCC/ffffff&amp;text=I+Love+Bootstrap" alt="First slide">

                                            <div class="carousel-caption">
                                                First Slide
                                            </div>
                                        </div>
                                        <div class="item next left">
                                            <img src="http://placehold.it/900x500/3c8dbc/ffffff&amp;text=I+Love+Bootstrap" alt="Second slide">

                                            <div class="carousel-caption">
                                                Second Slide
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img src="http://placehold.it/900x500/f39c12/ffffff&amp;text=I+Love+Bootstrap" alt="Third slide">

                                            <div class="carousel-caption">
                                                Third Slide
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                        <span class="fa fa-angle-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                        <span class="fa fa-angle-right"></span>
                                    </a>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <!-- END ACCORDION & CAROUSEL-->

                <!-- START ACCORDION & CAROUSEL-->
                <h2 class="page-header">Modificar caba&#241;as y Servicios</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="box box-solid">
                            <div class="box-header with-border">

                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="box-group" id="accordion">
                                    <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->





                                    <div class="panel box box-warning">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                                    modificar reserva cabaña
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseFive" class="panel-collapse collapse">

                                            <label>Seleccione codigos de la caba&#241;a</label>
                                            <form method="post">
                                                <div class="box-body">
                                                    <input type="hidden" id="opc" name="opc" value="modcab">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    <select onclick="enviar_datoscab()" class="form-control" name="tipoc" id="selecab">
                                                        <option>Seleccione</option><option value="1000">5</option>
                                                    </select>
                                                    <!-- </div> -->
                                                </div>
                                            </form>
                                            <script type="text/javascript">$("#selecab").change(function(event){}</script> 
                                            <div id="mdfcab">

                                            </div>


                                        </div>
                                    </div>

                                    <div class="panel box box-warning">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                    modificar reserva de caba&#241;a
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">

                                            <div class="form-group">
                                                <label>Seleccione el tipo de cabana</label>
                                                <form method="post">
                                                    <div class="box-body">
                                                        <input type="hidden" id="opc" name="opc" value="busc">
                                                        <!-- <div class="input-group input-group-sm"> -->
                                                        <select onchange="enviar_datostc();" class="form-control" name="tipoc" id="selecctipc">
                                                            <option>Seleccione</option>
                                                            <option value="1">Dual</option>
                                                            <option value="2">Familiar</option>
                                                            <option value="3">Especial</option>
                                                        </select>
                                                        <!-- </div> -->
                                                    </div>
                                                </form>

                                                <script type="text/javascript">$("#selecctipc").change(function(event){}</script> 
                                                <!-- </div>
                                                <p class="margin">Haga una busqueda por ID del tipo de caba&#241;a que desea modificar</p>
                                                <form id="ftipoc" method="post">
                                                    <div class="box-body">
                                                        <div class="input-group input-group-sm">
                                                            <input type="text" class="form-control" id="idbusctip" name="idbusc">
                                                            <span class="input-group-btn">
                                                                <input type="Button" name="busctipoc" value="Buscar" class="btn btn-info btn-flat" onclick="enviar_datos();">
                                                                <input type="hidden" id="opc" name="opc" value="busc">
                                                            </span>
                                                        </div>
                                                    </div>
                                                </form> -->
                                                <div id="mdftipoc">
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-6">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <h3 class="box-title">Carousel</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="item active left">
                                            <img src="http://placehold.it/900x500/39CCCC/ffffff&amp;text=I+Love+Bootstrap" alt="First slide">

                                            <div class="carousel-caption">
                                                First Slide
                                            </div>
                                        </div>
                                        <div class="item next left">
                                            <img src="http://placehold.it/900x500/3c8dbc/ffffff&amp;text=I+Love+Bootstrap" alt="Second slide">

                                            <div class="carousel-caption">
                                                Second Slide
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img src="http://placehold.it/900x500/f39c12/ffffff&amp;text=I+Love+Bootstrap" alt="Third slide">

                                            <div class="carousel-caption">
                                                Third Slide
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                        <span class="fa fa-angle-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                        <span class="fa fa-angle-right"></span>
                                    </a>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <!-- END ACCORDION & CAROUSEL-->

                <!-- /.row -->
            </div></section>

        <!-- /.content -->

        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
       
    </body>
</html>

