<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj"  class="clases.usuario" scope="session" />
<jsp:setProperty name="obj" property="*" /> 
<%
    String datosUsua = obj.listSelectusua();
    String tablaUsua = obj.Tablausua();
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Main Villa marina | Gestionar Usuarios</title>
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
                Formularios de gesti&#243;n de usuarios
                <small>Preview</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Gestionar Usuario</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- START ACCORDION & CAROUSEL-->
            <h2 class="page-header">Gesti&#243;n de usuarios</h2>

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">Usuarios</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                Registrar usuario
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">

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
                                <div class="panel box box-warning">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                Modificar usuario
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">

                                        <div class="form-group">
                                            <label>Seleccione Usuario</label>
                                            <form method="post">
                                                <div class="box-body">
                                                    <input type="hidden" id="opc" name="opc" value="buscusua">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    <select onChange="enviar_datos({usua_cedula: $('#usua_cedula').val(), opcion: 'buscusua', div: '#mdfusua'});" class="form-control" name="tipoc" id="selecctipc">
                                                        <option>Seleccione</option>
                                                        <%
                                                            out.print(datosUsua);
                                                        %>
                                                    </select>
                                                    <!-- </div> -->
                                                </div>
                                            </form>
                                            <div id="mdfusua">

                                            </div>

                                        </div>
                                    </div>
                                    <div class="panel box box-danger">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                    Mostrar tabla de usuarios usuario
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <h3>Listar Usuarios</h3>
                                            <br>

                                            <table class="table table-bordered table-hover">
                                                <%
                                                    out.print(tablaUsua);
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
<script type="text/javascript">$("#selecab").change(function(event){}</script> 
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
