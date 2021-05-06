<%-- 
    Document   : entradaInvalida
    Created on : 28/04/2021, 18:21:16
    Author     : juanf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" />
    <title>Combi 19</title>      
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
			<li><a href="index.jsp"><i class="icono izquierda fas fa-home"></i>Inicio</a></li>
                        <li><a href="sesionAdminChofer.jsp"><i class="icono izquierda fas fa-home"></i>Chofer</a></li>
                        <li><a href="sesionAdminCombi.jsp"><i class="icono izquierda fas fa-home"></i>Combi</a></li>
                        <li><a href="sesionAdminLugar.jsp"><i class="icono izquierda fas fa-home"></i>Lugar</a></li>
                        <li><a href="sesionAdminRuta.jsp"><i class="icono izquierda fas fa-home"></i>Ruta</a></li>
                        <li><a href="sesionAdminViaje.jsp"><i class="icono izquierda fas fa-home"></i>Viaje</a></li>
                        <li><a href="sesionAdminInsumo.jsp"><i class="icono izquierda fas fa-home"></i>Insumo</a></li>                        
			<li><a href="#"><i class="icono izquierda fas fa-home"></i>Administración<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">Combi</a></li>
					<li><a href="#">Viajes</a></li>
					<li><a href="#">Rutas</a></li>
					<li><a href="#">Insumos</a></li>
				</ul>

			</li>
			<li><a href="#"><i class="icono izquierda fas fa-star"></i>productos<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">item1</a></li>
					<li><a href="#">item2</a></li>
					<li><a href="#">item3</a></li>
					<li><a href="#">item4</a></li>
				</ul>
		 	</li>
			<li><a href="#"> <i class="icono izquierda fas fa-share-alt"></i>Redes Sociales</a> </li>
			<li><a href="index.jsp"> <i class="icono izquierda fas fa-sign-out-alt"></i>Cerrar sesion</a> </li>
		</ul>
	
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>
    
            <form class="formulario">
				<h4>El chofer ya tiene una combi asignada</h4>         
            </form>

	<footer>
		footer &copy
	</footer>  

  </body>
</html>
