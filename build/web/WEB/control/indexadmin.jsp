<%-- 
    Document   : indexadmin
    Created on : 25/01/2017, 02:03:59 PM
    Author     : EDSN-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% if (session.getAttribute("nombre") == null) { 
    response.sendRedirect("../login/login.html");
    
} 
String nombre=String.valueOf(session.getAttribute("nombre"));
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Villa marina | Panel Administrador</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../login/css/alertify.core.css">
        <link rel="stylesheet" href="../login/css/alertify.default.css">
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
        <script>
            $(document).ready(function () {
                $('#gestcab').click(function () {
                    $("#contenido").load("pages/gestioncab.jsp");
                });
                $('#gestserv').click(function () {
                    $("#contenido").load("pages/gestionserv.jsp");
                });
                $('#gestusua').click(function () {
                    $("#contenido").load("pages/gestionusua.jsp");
                });
                $('#gestreserv').click(function () {
                    $("#contenido").load("pages/gestionreservas.jsp");
                });
                $('#gestreportes').click(function () {
                    $("#contenido").load("pages/gestionreportes.jsp");
                });
            });

        </script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <% String rol=String.valueOf(session.getAttribute("idrol"));
        %>
        <div class="wrapper">
            <header class="main-header">
                <!-- Logo -->
                <a href="indexadmin.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>LT</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Gestionar Caba&#241;as</b></span>
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
                            
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs"><%out.print(nombre);%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>
                                            <%out.print(nombre);%> - Web Developer
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat" id="salir" onclick="logOut({opcion: 'logout', url: 'procesardatos.jsp', index:'../login/login.html'});">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
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
                                <p><%out.print(nombre);%></p>
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
                                    <span>Caba&#241;as</span>
                                    <span class="pull-right-container">
                                        <span class="fa fa-angle-left pull-right"></span>
                                    </span>
                                </a>
                                <ul class="treeview-menu" style="display: none;">
                                    <% if(rol.equals("11001")){
                                        out.print("<li><a href='#' id='gestcab'><i class='fa fa-circle-o'></i> Gestionar</a></li>");
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                    }else{
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                        }%>


                                </ul>                </li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-edit"></i>
                                    <span>Servicios</span>
                                    <span class="pull-right-container">
                                        <span class="fa fa-angle-left pull-right"></span>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <% if(rol.equals("11001")){
                                        out.print("<li><a href='#' id='gestserv'><i class='fa fa-circle-o'></i> Gestionar</a></li>");
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                    }else{
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                        }%>
                                </ul>
                            </li>
                            
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-edit"></i>
                                    <span>Usuarios</span>
                                    <span class="pull-right-container">
                                        <span class="fa fa-angle-left pull-right"></span>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <% if(rol.equals("11001")){
                                        out.print("<li><a href='#' id='gestusua'><i class='fa fa-circle-o'></i> Gestionar</a></li>");
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                    }else{
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                        }%>
                                </ul>
                            </li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-edit"></i>
                                    <span>Reservas</span>
                                    <span class="pull-right-container">
                                        <span class="fa fa-angle-left pull-right"></span>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <% if(rol.equals("11001")){
                                        out.print("<li><a href='#' id='gestreserv'><i class='fa fa-circle-o'></i> Gestionar</a></li>");
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                    }else{
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                        }%>
                                </ul>
                            </li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-edit"></i>
                                    <span>Reportes</span>
                                    <span class="pull-right-container">
                                        <span class="fa fa-angle-left pull-right"></span>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <% if(rol.equals("11001")){
                                        out.print("<li><a href='#' id='gestreportes'><i class='fa fa-circle-o'></i> Colsultar</a></li>");
                                        
                                    }else{
                                        out.print("<li><a href='pages/layout/boxed.html'><i class='fa fa-circle-o'></i> Consultar</a></li>");
                                        }%>
                                </ul>
                            </li>
                        </ul>
                    </section>
                    <!-- /.sidebar -->
                </aside>
                <div id="contenido">
                    <h1>Aqui va el contenido de la pagina</h1>
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
            <jsp:include page="modales_1.jsp" />

    </body>
</html>

