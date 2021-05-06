<%-- 
    Document   : sesionAdminRuta
    Created on : 03/05/2021, 19:33:07
    Author     : juanf
--%>

<%@page import="Logica.Lugar"%>
<%@page import="Logica.Combi"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
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
            <%
                    Controladora control = new Controladora();
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares(); 
             %> 		
            <form action="RegistroRuta" class="formulario" method="post">
				<h4>Registrar ruta</h4>
                <label>Origen</label>
                <select class="controls" type="text" name="origen" placeholder="Ingrese el origen">
                        <option>Seleccione un origen</option>
                <%
                    for (Lugar origen: listaOrigen) {%>                        
                        <option value="<%=origen.getIdLugar()%>"><%=origen.getNombre()%></option>               
                 <%}%>
                </select> 
                
                <label>Destino</label><br>              
                <select class="controls" type="text" name="destino" placeholder="Ingrese el destino">               
                        <option>Seleccione un destino</option>
                <%
                    for (Lugar destino: listaDestino) {%>                        
                        <option value="<%=destino.getIdLugar()%>"><%=destino.getNombre()%></option>               
                 <%}%>       
                </select>
                
                <label>Combi</label>
                <select class="controls" type="text" name="combi">
                        <option>Seleccione una combi</option>
                <%
                    for (Combi comb: listaCombis) {%>                        
                        <option value="<%=comb.getIdCombi()%>"><%=comb.getPatente()%></option>               
                 <%}%> 
                </select>
                
                <label>Distancia</label>
                <input class="controls" type="number" name="distancia" placeholder="Ingrese distancia en Km">                
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
