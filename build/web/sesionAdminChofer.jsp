<%-- 
    Document   : sesionAdmin
    Created on : 22/04/2021, 23:14:51
    Author     : Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <title> Menu lateral </title> 
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
     	 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
<body>
	   <header>
		  Combi-19
	  </header>
	
	<div class= "contenedor-menu">

		<a href="#" class="btn-menu">Menu<i class="icono fas fa-bars"></i></a>
		<ul class="menu">
                        
			<li class="logo"><img src="images/logo2.png" alt="Logo Combi19" class="logo"></li>
			<li><a href="../index.jsp"><i class="icono izquierda fas fa-home"></i>Inicio</a></li>
                        <!--<li><a href="sesionAdminInsumo.jsp"><i class="icono izquierda fas fa-home"></i>Insumo</a></li><!--Con este codigo se redirige al registro de Insumo-->
                        <!--<li><a href="ListadoChofer"><i class="icono izquierda fas fa-home"></i>Listar choferes</a></li>  <!--Con este codigo se redirige al registro de Chofer-->                      
                        
                             <li ><a href="#"><i class="icono izquierda fas fa-shuttle-van" ></i>Administrar Combi<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
                                         <li><a href="sesionAdminCombi.jsp">Alta de Combi</a></li><!--Con este codigo se redirige al registro de Combi-->
                                           <li><a href="sesionAdminCombi.jsp">Baja de Combi</a></li>
                                            <li><a href="sesionAdminCombi.jsp">Modificacion de Combi</a></li>
                                            <li><a href="sesionAdminCombi.jsp">Listado de Combi</a></li>
				</ul>

			</li>
                        <!-- boton con menu para Chofer.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-male" ></i>Administrar chofer<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminChofer.jsp">Alta de chofer</a></li>
					<li><a href="sesionAdminChofer.jsp">Baja de chofer</a></li>
					<li><a href="sesionAdminChofer.jsp">Modificacion de chofer</a></li>
                                        <li><a href="sesionAdminChofer.jsp">Listado de chofer</a></li>
				</ul>

			</li>
                        <!-- boton con menu para Viajes.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-book" ></i>Administrar Viajes<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminViaje.jsp">Alta de viaje</a></li>
					<li><a href="sesionAdminViaje.jsp">Baja de viaje</a></li>
					<li><a href="sesionAdminViaje.jsp">Modificacion de viaje</a></li>
                                        <li><a href="sesionAdminViaje.jsp">Listado de viaje</a></li>
				</ul>

			</li>
                        <!-- boton con menu para Rutas.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-globe-americas"" ></i>Administrar Rutas<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminRuta.jsp">Alta de ruta</a></li>
					<li><a href="sesionAdminRuta.jsp">Baja de ruta</a></li>
					<li><a href="sesionAdminRuta.jsp">Modificacion de ruta</a></li>
                                        <li><a href="sesionAdminRuta.jsp">Listado de ruta</a></li>
				</ul>

			</li>
                        <!-- boton con menu para Insumos.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-apple-alt" ></i>Administrar Insumos<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminInsumo.jsp">Alta de insumo</a></li>
					<li><a href="sesionAdminInsumo.jsp">Baja de insumo</a></li>
					<li><a href="sesionAdminInsumo.jsp"></i>Modificacion de insumo</a></li>
                                        <li><a href="sesionAdminInsumo.jsp">Listado de insumo</a></li>
				</ul>

			</li>
                        <li ><a href="#"><i class="icono izquierda fas fa-map-marker-alt" ></i>Administrar lugar<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
                                        <li><a href="sesionAdminLugar.jsp">Alta de lugar</a>
                                          <li><a href="sesionAdminLugar.jsp">Baja de lugar</a>
                                           <li><a href="sesionAdminLugar.jsp">Modificacion de lugar</a>
                                               <li><a href="sesionAdminLugar.jsp">Listado de lugar</a></li>
				</ul>

			</li>
			<li><a href="#"> <i class="icono izquierda fas fa-share-alt"></i>Redes Sociales</a> </li>
			<li><a href="index.jsp"> <i class="icono izquierda fas fa-sign-out-alt"></i>Cerrar sesion</a> </li>
		</ul>
		
        </div>
		
            <form action="RegistroChofer" class="formulario" method="post">
=======
    <link rel="stylesheet" href="css/fonts.css" >
    <link rel="stylesheet" href="css/sesiones.css" >
    </head>
    
    <body>
        <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
        
        <aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
        
            <form action="RegistroChofer" class="formulario-sesiones" method="post">
				<h4>Alta chofer </h4>
                <label> Nombre</label>
                <input class="controls" type="text" name="nombre" placeholder="Ingrese nombre">
                <label> Apellido</label>
                <input class="controls" type="text" name="apellido" placeholder="Ingrese apellido">
                <label> Dni</label>
                <input class="controls" type="tel" name="dni" placeholder="Ingrese Dni">
                <label> Mail</label>
                <input class="controls" type="mail" name="mail" placeholder="Ingrese mail">
                <label> Contraseña</label>
                <input class="controls" type="password" name="pass" placeholder="Ingrese contraseña">
                <label>Telefono de contacto</label>
                <input class="controls" type="text" name="tel" placeholder="Ingrese telefono">
                <input class="boton" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

	<footer>
		footer &copy
	</footer>  

  </body>
   
</html>
