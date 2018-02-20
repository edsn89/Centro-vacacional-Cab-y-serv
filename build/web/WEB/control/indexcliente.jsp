<%-- 
    Document   : indexadmin
    Created on : 25/01/2017, 02:03:59 PM
    Author     : EDSN-PC
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
int idusua=obj.getUsua_id();
String datostc = beantipcab.listSelecttc();
String datosserv = beanserv.listSelectserv();
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="stylesheet" href="../login/css/alertify.core.css">
        <link rel="stylesheet" href="../login/css/alertify.default.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Villa marina | Bienvenido</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
        folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script src="../js/scriptvm.js"></script>
        <script src="../js/jquery.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <!-- Logo -->
                <a href="indexcliente.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>V</b>M</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Registrar Usuario VM</b></span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown user user-menu">
                                <a href="../login/login.html" >
                                   <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">Login</span>
                                </a>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <div class="content-wrapper" style="min-height: 880px;">
                <aside class="main-sidebar">
                    <!-- sidebar: style can be found in sidebar.less -->
                    <section class="sidebar">
                        <!-- Sidebar user panel -->
                        <div class="user-panel">
                            <div class="pull-left image">
                                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                            </div>
                            <div class="pull-left info">
                                <p>Usuario VM</p>
                                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                            </div>
                        </div>
                        <!-- search form -->
                        <form action="#" method="get" class="sidebar-form">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                        <!-- /.search form -->
                        <!-- sidebar menu: : style can be found in sidebar.less -->
                        <ul class="sidebar-menu">
                            <li class="header">MAIN NAVIGATION</li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-edit"></i>
                                    <span>Usuarios</span>
                                    <span class="pull-right-container">
                                        <span class="fa fa-angle-left pull-right"></span>
                                    </span>
                                </a>
                                <ul class="treeview-menu">

                                    <li><a href='#' id='gestusua'><i class='fa fa-circle-o'></i> Gestionar</a></li>

                                </ul>
                            </li>
                        </ul>
                    </section>
                    <!-- /.sidebar -->
                </aside>
                <div id="contenido">
                    <div class="box-body" style="padding: 50px">
                        <div class="box-group" id="acordion">
                            <div class="panel box box-success">
                                <div class="box-header with-border">
                                    <h4 class="box-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                            Registrar usuario
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse">

                                    <form name="fusua" id="fusua" method="post">
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label for="usua_cedula">Cedula</label>
                                                <input type="number" class="form-control" name="usua_cedula" id="usua_cedula" placeholder="ingrese la cedula"required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_primernombre">Primer nombre</label>
                                                <input type="text" class="form-control" name="usua_primernombre" id="usua_primernombre" placeholder="ingrese primer nombre"required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_segundonombre">Segundo nombre</label>
                                                <input type="text" class="form-control" name="usua_segundonombre" id="usua_segundonombre" placeholder="ingrese segundo nombre">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_primerapellido">Primer Apellido: </label>
                                                <input type="text" class="form-control" name="usua_primerapellido" id="usua_primerapellido" placeholder="Escriba  el primer apellido" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_segundoapellido">Segundo Apellido: </label>
                                                <input type="text" class="form-control" name="usua_segundoapellido" id="usua_segundoapellido" placeholder="Escriba el segundo apellido" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_telefono">Telefono: </label>
                                                <input type="text" class="form-control" name="usua_telefono" id="usua_telefono" placeholder="Escriba telefono" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_direccion">Direccion: </label>
                                                <input type="text" class="form-control"  name="usua_direccion" id="usua_direccion" placeholder="Escriba direccion" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_fechanacimiento">Fecha de Nacimiento: </label>
                                                <input type="date" class="form-control" name="usua_fechanacimiento" id="usua_fechanacimiento" placeholder="Escriba fecha nac" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="usua_usuario">Usuario: </label>
                                                <input type="text" class="form-control" name="usua_usuario" id="usua_usuario" placeholder="Escriba usuario" required="required">
                                            </div>
                                            <input type="hidden" name="opcion" value="usuainsert">
                                            <div class="form-group">
                                                <label for="usua_clave">Clave: </label>
                                                <input type="password" class="form-control" name="usua_clave" id="usua_clave" placeholder="Escriba clave" required="required">
                                            </div>                    
                                        </div>
                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <button type="submit" href="javascript:; " onclick="obtenerdelformU('#fusua', '#regusuamsj');" name="registrarusuario" class="btn btn-primary">Registrar</button>
                                        </div>
                                    </form>
                                    <div id="regusuamsj">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                Informacion del usuario
                                            </a> 
                                        </h4>

                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">

                                        <form accept-charset="utf-8" method="POST">
                                            <div class="form-group">
                                                <label for="sr_fecha">Busqueda de usuarios por cedula</label>
                                            <div class="form-group">
                                                <% if(rol.equals("11001")){
                                    out.print("<input class='form-control' type='number' onkeyup=\"autocompleta({busqueda: $('#busqueda').val(), opcion: 'busca', div: '#resultadoBusqueda', url: 'procesardatos.jsp'})\" type='text' name='busqueda' id='busqueda' value='' placeholder='Escriba la cedula del cliente...' maxlength='50' autocomplete='off'/>");
                                }else{
                                    out.print("<input type='radio' class='form-control' name='radio_id' id='radio_id' value='"+idusua+"' checked='checked'>");
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
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" onclick="cargarIdCedUsuario({usua_id: $('input:radio[name=radio_id]:checked').val(), opcion: 'get_idced', div: '#usuaidced'});">
                                                Realizar reserva de caba&#241;a 
                                            </a> 
                                        </h4>

                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
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
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" onclick="cargarIdCedUsuario({usua_id: $('input:radio[name=radio_id]:checked').val(), opcion:'get_idced', div: '#usuacedid'});">
                                                Realizar reserva de servicios
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse">

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
                                        <input type="submit" href="javascript:; " onclick="enviar_datos({usua_id: $('input:radio[name=radio_id]:checked').val(), opcion: 'finreserv', div: '#msjfinreserv'});" name="registrareserva" class="btn btn-primary" value="Finalizar Reserva">
                                    </div>
                                </form>
                                <div id="msjfinreserv">

                                </div>

                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
                <footer class="main-footer">
                    <div class="pull-right hidden-xs">
                        <b>Version</b> 3.6.1
                    </div>
                    <strong>Copyright © 2017 --E. Hernandez, L. Acu&#241;a, A. Angarita</strong> All rights
                    reserved.
                </footer>

                <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
                <!-- Bootstrap 3.3.6 -->
                <script src="bootstrap/js/bootstrap.min.js"></script>
                <!-- FastClick -->
                <script src="plugins/fastclick/fastclick.js"></script>
                <!-- AdminLTE App -->
                <script src="dist/js/app.min.js"></script>
                <!-- AdminLTE for demo purposes -->
                <script src="dist/js/demo.js"></script>
                <script src="../login/js/alertify.min.js"></script>
                <script src="../login/js/index.js"></script>

                </body>
                </html>

