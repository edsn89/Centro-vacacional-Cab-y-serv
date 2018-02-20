<%-- 
    Document   : gestionserv
    Created on : 29/01/2017, 10:16:25 PM
    Author     : EDSN-PC
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanserv" scope="application" class="clases.servicio" />
<jsp:setProperty name="beantipcab" property="*" />

<%
    String datosServ = beanserv.listSelectserv();
    String tablaServ = beanserv.Tablaserv();
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Main Villa marina | Gestionar Caba&#241;as</title>
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
        <script src="../js/scriptvm.js"></script>
        <script src="../js/jquery.min.js"></script>

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
                Formularios de gesti&#243;n de Servicios
                <small>Preview</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Gestionar Servicios</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- START ACCORDION & CAROUSEL-->
            <h2 class="page-header">Gesti&#243;nar</h2>

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">Gestion de Servicios</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                Registrar Servicios
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <form name="insrserv" id="insrserv"  method="post">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="serv_nombre">Nombre</label>
                                                    <input type="text" class="form-control" name="serv_nombre" id="serv_nombre" placeholder="ingrese Nombre">
                                                </div>
                                                <div class="form-group">
                                                    <label for="serv_descripcion">Descripccion</label>
                                                    <input type="text" class="form-control" name="serv_descripcion" id="serv_descripcion" placeholder="ingrese una descripcion corta">
                                                </div>
                                                <div class="form-group">
                                                    <span class="input-group-addon">Precio $</span>
                                                    <input type="number" class="form-control" name="serv_precio" id="serv_precio" placeholder="ingrese Precio">
                                                </div>
                                                <input type="hidden" name="opcion" value="servinsert">

                                            </div>
                                            <!-- /.box-body -->

                                            <div class="box-footer">
                                                <input type="submit" href="javascript:; " onclick="obtenerdelform('#insrserv', '#insertservmsj', 'pages/gestionserv.jsp');" name="registraserv" class="btn btn-primary" value="Registrar">
                                            </div>
                                        </form>
                                        <div id="insertservmsj">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="panel box box-warning">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                modificar Servicios
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">

                                        <div class="form-group">
                                            <label>Seleccione Servicios</label>
                                            <form method="post">
                                                <div class="box-body">
                                                    <input type="hidden" id="opcion" name="opcion" value="buscserv">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    <select onChange="enviar_datos({serv_id: $('#serv_id').val(), opcion: 'buscserv', div: '#mdfserv'});" class="form-control" name="serv_id" id="serv_id">
                                                        <option value="0">Seleccione</option>
                                                        <%
                                                            out.print(datosServ);
                                                        %>
                                                    </select>
                                                    <!-- </div> -->
                                                </div>
                                            </form>
                                            <div id="mdfserv">

                                            </div>

                                        </div>
                                    </div>
                                    <div class="panel box box-danger">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                    Eliminar Servicios
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <h3>Eliminar Tipos</h3>
                                            <br>

                                            <table class="table table-bordered table-hover">
                                                <%
                                                    out.print(tablaServ);
                                                %></table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                    
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <!-- END ACCORDION & CAROUSEL-->
                <script type="text/javascript">$("#selecab").change(function(event){}</script> 
                
                
            </div>
            <!-- /.row -->
        </section>
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

