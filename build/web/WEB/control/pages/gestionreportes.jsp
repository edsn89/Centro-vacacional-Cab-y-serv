<%-- 
    Document   : gestionreportes
    Created on : 27/01/2017, 09:49:04 PM
    Author     : Angelica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Main Villa marina | Gestionar reportes</title>
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
                Tablas de reportes Villa Marina
                <small>Preview</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Forms</a></li>
                <li class="active">Seleccione el reporte que desea visualizar </li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- START ACCORDION & CAROUSEL-->
            <h2 class="page-header">Seleccione el reporte que desea visualizar</h2>

            <div class="row">
                <div class="col-md-6">

                    <div class="box box-solid">
                        <div class="box-header with-border">

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                <!--opcion de primer reporte -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" onclick="cargarSelTab2({opcion: 'get_reserva', select: '#rs_id', tabla: '#tiposrs'});" data-parent="#accordion" href="#collapseOne">
                                                Reservas de servicios pendientes
                                            </a>
                                        </h4>

                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse">
                                        <h3>Listado de reservas de servicios pendientes</h3>
                                        <br>
                                        <table id="tiposrs"  class="table table-bordered table-hover">
                                        </table>
                                    </div>
                                </div>
                                <!--fin de la opcion de primer reporte -->

                                <!--opcion de segundo reporte -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" onclick="cargarSelTab2({opcion: 'get_reserv', select: '#rc_id', tabla: '#tiposrc'});" data-parent="#accordion" href="#collapseTwo">
                                                Reservas de caba&#241;as pendientes
                                            </a>
                                        </h4>

                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <h3>Listado de reservas de caba&#241;as pendientes</h3>
                                        <br>
                                        <table id="tiposrc"  class="table table-bordered table-hover">
                                        </table>
                                    </div>

                                </div>
                                <!--fin de la opcion de segundo reporte -->

                                <!--opcion de tercer reporte -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" onclick="cargarSelTab2({opcion: 'get_cabdisp', select: '#cab_id', tabla: '#tiposcd'});" data-parent="#accordion" href="#collapseThree">
                                                Caba&#241;as disponibles 
                                            </a>
                                        </h4>

                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <h3>Listado de caba&#241;as disponibles para reservar</h3>
                                        <br>
                                        <table id="tiposcd"  class="table table-bordered table-hover">
                                        </table>
                                    </div>

                                </div>
                                <!--fin de la opcion de tercer reporte -->


                                <!--opcion de cuarto reporte -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse"  data-parent="#accordion" href="#collapseFour">
                                                Facturas por fecha
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse">
                                        <h3>Listado de facturas dado un rango de fechas</h3>
                                        <br>
                                        <div class="form-group">
                                            <label>Seleccione el rango de fechas</label>
                                            <div class="form-group">
                                                <label for="cr_fechaentrada">Fecha de inicio: </label>
                                                <input type="date" class="form-control" name="cr_fechaentrada" id="cr_fechaentrada" placeholder="Escriba fecha inicio" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label for="cr_fechasalida">Fecha final: </label>
                                                <input type="date" class="form-control" name="cr_fechasalida" id="cr_fechasalida" placeholder="Escriba fecha final" required="required">
                                            </div>

                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" href="javascript:; " onclick="enviar_datos({opcion: 'get_facturas', cr_fechaentrada: $('#cr_fechaentrada').val(), cr_fechasalida: $('#cr_fechasalida').val()});cargarSelTab2({opcion: 'get_facturas', tabla: '#facturas'});" name="consultar" class="btn btn-primary">Consultar</button>
                                        </div>
                                        <table id="facturas"  class="table table-bordered table-hover">
                                        </table>
                                    </div>
                                </div>
                                <!--fin de la opcion de cuarto reporte -->

                                <!--opcion de quinto reporte -->
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" onclick="cargarSelTab({opcion: 'get_tipo2', select: '#tc_id'});" data-parent="#accordion" href="#collapseFive">
                                                Caba&#241;as disponibles segun tipo
                                            </a>
                                        </h4>

                                    </div>
                                    <div id="collapseFive" class="panel-collapse collapse">
                                        <h3>Listado de caba&#241;as disponibles segun el tipo</h3>
                                        <br>
                                        <div class="form-group">
                                            <label>Seleccione el tipo de caba&#241;a</label>
                                            <form method="post">
                                                <div class="box-body">
                                                    <input type="hidden" id="opcion" name="opcion" value="busdistipo">
                                                    <!-- <div class="input-group input-group-sm"> -->
                                                    <select onChange="enviar_datos({ opcion: 'get_disptipo',tc_id: $('#tc_id').val()}); cargarSelTab2({opcion: 'get_disptipo',select: '#tc_id', tabla: '#tiposcd'});" class="form-control" name="tc_id" id="tc_id">
                                                        <option>Seleccione</option>
                                                    </select>
                                                    <!-- </div> -->
                                                </div>
                                            </form>

                                            <table id="tiposcd"  class="table table-bordered table-hover">
                                            </table>
                                        </div>

                                    </div>

                                </div>
                                <!--fin de la opcion de quinto reporte -->

                               

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

