<%-- 
    Document   : sesionAdmin
    Created on : 22/04/2021, 23:14:51
    Author     : Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
			<li><a href="#"><i class="icono izquierda fas fa-home"></i>Gestion de viajes<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">Proximos viajes</a></li>
					<li><a href="#">Cargar sintomas de pasajero</a></li>
					<li><a href="#">Registrar usuario pasajero</a></li>
				</ul>

			</li>
			<li><a href="#"><i class="icono izquierda fas fa-id-badge"></i>Mi perfil<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">Modificar mis datos</a></li>
					<li><a href="#">Ayuda y asistencia</a></li>
				</ul>
		 	</li>
			<li><a href="#"> <i class="icono izquierda fas fa-share-alt"></i>Redes Sociales</a> </li>
			<li><a href="sesionChoferCierre.jsp"> <i class="icono izquierda fas fa-sign-out-alt"></i>Cerrar sesion</a> </li>
		</ul>
	
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

	<footer>
		footer &copy
	</footer>  

  </body>
   
</html>
