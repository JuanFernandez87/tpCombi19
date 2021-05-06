<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" /> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="css/sesiones.css" >
    <link rel="stylesheet" href="css/styles.css" >
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
    <body>
	<div class= "contenedor-menu">

		<a href="#" class="btn-menu">Menu<i class="icono fas fa-bars"></i></a>
		<ul class="menu">
                        <!-- boton con menu para Chofer.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-male" ></i>Administrar chofer<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminChofer.jsp">Alta de chofer</a></li>
					<li><a href="sesionAdminChofer.jsp">Baja de chofer</a></li>
					<li><a href="sesionAdminChofer.jsp">Modificacion de chofer</a></li>
                                        <li><a href="listado.jsp">Listado de chofer</a></li>
				</ul>

			</li>
                        
                        <!-- boton con menu para Combi.-->
                             <li ><a href="#"><i class="icono izquierda fas fa-shuttle-van" ></i>Administrar Combi<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
                                         <li><a href="sesionAdminCombi.jsp">Alta de Combi</a></li><!--Con este codigo se redirige al registro de Combi-->
                                           <li><a href="sesionAdminCombi.jsp">Baja de Combi</a></li>
                                            <li><a href="sesionAdminCombi.jsp">Modificacion de Combi</a></li>
                                            <li><a href="listadoCombi.jsp">Listado de Combi</a></li>
				</ul>

			</li>
                        
                        <!-- boton con menu para Lugar.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-map-marker-alt" ></i>Administrar lugar<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
                                        <li><a href="sesionAdminLugar.jsp">Alta de lugar</a>
                                          <li><a href="sesionAdminLugar.jsp">Baja de lugar</a>
                                           <li><a href="sesionAdminLugar.jsp">Modificacion de lugar</a>
                                               <li><a href="listadoLugar.jsp">Listado de lugar</a></li>
				</ul>

			</li>                        
                        
                        <!-- boton con menu para Rutas.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-globe-americas"" ></i>Administrar Rutas<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminRuta.jsp">Alta de ruta</a></li>
					<li><a href="sesionAdminRuta.jsp">Baja de ruta</a></li>
					<li><a href="sesionAdminRuta.jsp">Modificacion de ruta</a></li>
                                        <li><a href="listadoRuta.jsp">Listado de ruta</a></li>
				</ul>

			</li>
                        
                        <!-- boton con menu para Viajes.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-book" ></i>Administrar Viajes<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="sesionAdminViaje.jsp">Alta de viaje</a></li>
					<li><a href="sesionAdminViaje.jsp">Baja de viaje</a></li>
					<li><a href="sesionAdminViaje.jsp">Modificacion de viaje</a></li>
                                        <li><a href="listadoViajes.jsp">Listado de viaje</a></li>
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
		</ul>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="js/sesion.js"></script>
 
        </div>
    </body>
</html>
