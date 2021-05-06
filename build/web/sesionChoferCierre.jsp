<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" />
    <title>Combi 19</title>      
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
    <link rel="stylesheet" type="css/fonts.css" href="">
    <link rel="stylesheet" href="css/cierre.css">
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
			<li><a href="index.jsp"> <i class="icono izquierda fas fa-sign-out-alt"></i>Cerrar sesion</a> </li>
		</ul>
            </div>
                
                <div class="formulario-sesiones">
            <form>
	    <div class="divCierre">
                <h3>Quiere cerrar sesion ?</h3>
                <a href="index.jsp">Aceptar</a>
                <a href="sesionChofer.jsp">Cancelar</a>
            </div> 
            </form>
            </div>
	
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>

  </body>
   
</html>
