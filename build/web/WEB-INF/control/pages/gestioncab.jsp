<%-- 
    Document   : gestioncab
    Created on : 26/01/2017, 05:21:03 PM
    Author     : EDSN-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beantipcab" scope="application" class="clases.tipocab" />
<jsp:setProperty name="beantipcab" property="*" />


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
                Formularios de gesti&#243;n de caba&#241;as
                <small>Preview</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Gestionar Caba&#241;as</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            
            <!-- START ACCORDION & CAROUSEL-->
            <h2 class="page-header">Gesti&#243;nar</h2>

            <div class="row">
                <div class="col-md-6">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">Gestion de caba&#241;as</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                Registrar tipos de caba&#241;as
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse">
                                        <form name="insrtc" id="insrtc"  method="post">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="tc_nombre">Nombre</label>
                                                    <input type="text" class="form-control" name="tc_nombre" id="tc_nombre" placeholder="ingrese Nombre">
                                                </div>
                                                <div class="form-group">
                                                    <label for="tc_descripcion">Descripcion</label>
                                                    <input type="text" class="form-control" name="tc_descripcion" id="tc_descripcion" placeholder="ingrese una descripcion corta">
                                                </div>
                                                <div class="form-group">
                                                    <label for="tc_cant">cantidad de cabañas</label>
                                                    <input type="number" class="form-control" name="tc_cant" id="tc_cant" placeholder="ingrese cantidad de caba&#241;as">
                                                </div>
                                                <div class="form-group">
                                                    <span class="input-group-addon">Precio $</span>
                                                    <input type="number" class="form-control" name="tc_precio" id="tc_precio" placeholder="ingrese Precio">
                                                </div>
                                                <input type="hidden" name="opcion" value="tcinsert">

                                            </div>
                                            <!-- /.box-body -->

                                            <div class="box-footer">
                                                <input type="submit" id="boton"   href="javascript:; " onclick="obtenerdelform('#insrtc', '#inserttcmsj', 'pages/gestioncab.jsp');" name="registrartipo" class="btn btn-primary" value="Registrar">

                                            </div>
                                        </form>
                                        <div id="inserttcmsj">

                                        </div>
                                    </div>
                                </div>
                                <div class="panel box box-warning">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" id="cargartc" onclick="cargarSelTab({opcion: 'get_tipo', select: '#tc_id', tabla: '#tiposc'});" data-parent="#accordion" href="#collapseTwo">
                                                modificar tipo de caba&#241;a
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">

                                        <div class="form-group">
                                            <label>Seleccione el tipo de caba&#241;a</label>
                                            <form method="post">
                                                <div class="box-body">
                                                    <input type="hidden" id="opcion" name="opcion" value="busctc">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    <select onChange="enviar_datos({tc_id: $('#tc_id').val(), opcion: 'busctc', div: '#mdftipoc'});" class="form-control" name="tc_id" id="tc_id">
                                                        <option value="0">Seleccione</option>
                                                    </select>
                                                    <!-- </div> -->
                                                </div>
                                            </form>
                                            <div id="mdftipoc">

                                            </div>

                                        </div>
                                    </div>
                                    <div class="panel box box-danger">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" onclick="cargarSelTab({opcion: 'get_tipo', select: '#tc_id', tabla: '#tiposc'});" data-parent="#accordion" href="#collapseThree">
                                                    Eliminar Tipo de caba&#241;a
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <h3>Eliminar Tipos</h3>
                                            <br>

                                            <table id="tiposc"  class="table table-bordered table-hover">
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
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
            <!-- START ACCORDION & CAROUSEL-->
            <h2 class="page-header">Gesti&#243;n de caba&#241;as</h2>
            <div class="row">
                    <div class="col-md-6">
                        <div class="box box-solid">
                            <div class="box-header with-border">
                                <h3 class="box-title">Caba&#241;as</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="box-group" id="accordion">
                                    <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                    <div class="panel box box-success">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" onclick="enviar_datos({opcion: 'get_tc', div: '#stc'});">
                                                    Registrar caba&#241;a
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseFour" class="panel-collapse collapse">
                                            <form id="insrtcab" name="insrtcab" method="post">
                                                <div class="box-body">
                                                    <input type="hidden" name="opcion" value="regcab">
                                                    <div class="form-group">
                                                        <label>Seleccione el tipo de caba&#241;a</label>
                                                                
                                                            <div id="stc"></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="tc_cant">Cantidad</label>
                                                        <input type="number" class="form-control" name="tc_cant" id="tc_cant" placeholder="ingrese cantidad de cabañas">
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->
                                                <div class="box-footer">
                                                    <button type="submit" href="javascript:; " onclick="obtenerdelform('#insrtcab', '#insrtcabmsj', 'pages/gestioncab.jsp');" name="registrarcabania" class="btn btn-primary">Registrar</button>
                                                </div>
                                            </form>
                                                        <div id="insrtcabmsj">
                                                            
                                                        </div>
                                        </div>
                                    </div>
                                    <div class="panel box box-warning">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" onclick="enviar_datos({opcion: 'get_cab', div: '#scab'});">
                                                    modificar caba&#241;a
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseFive" class="panel-collapse collapse">

                                            <label>Seleccione numero de la caba&#241;a</label>
                                             <form method="post">
                                                <div class="box-body">
                                                    <input type="hidden" id="opcion" name="opcion" value="buscab">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    
                                                    <div id="scab">
                                                        
                                                    </div>
                                                    
                                                    <!-- </div> -->
                                                </div>
                                            </form>
                                            <script type="text/javascript">$("#selecab").change(function(event){}</script> 
                                            <div id="mdfcab">
                                                
                                            </div>


                                        </div>
                                    </div>
                                    <div class="panel box box-danger">
                                        <div class="box-header with-border">
                                            <h4 class="box-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                                    Eliminar Caba&#241;a
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseSix" class="panel-collapse collapse">
                                            <h3>Eliminar</h3>
                                            <br>

                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr><th>Nombre</th>
                                                        <th></th>
                                                    </tr></thead>
                                                <tbody><tr>
                                                        <td>uno de la lista</td>
                                                        <td style="width:80px;"> <a href="" class="btn btn-danger btn-xs">Eliminar</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>otro de la lista</td>
                                                        <td style="width:80px;"> <a href="" class="btn btn-danger btn-xs">Eliminar</a></td>
                                                    </tr>
                                                </tbody></table>
                                        </div>
                                    </div>
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

