<%@page import="Logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" /> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="css/sesionCliente.css" >
    <link rel="stylesheet" href="css/styles.css" >
    <link rel="stylesheet" href="css/estilosRegistro.css" >
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
    <body>
	<div class= "contenedor-menu">
                  <%
                Controladora control = new Controladora();
                String usuario = (String)session.getAttribute("username");
                String tipoUsuario = (String)session.getAttribute("tipoUsuario");
                List <Cliente> listaCliente = control.devolverListaClientes(); 
                for (Cliente unCliente:listaCliente){
                    if (unCliente.getMail().equals(usuario)){
            %>  
           

		<a href="#" class="btn-menu">Menu<i class="icono fas fa-bars"></i></a>
		<ul class="menu">
                         <div style="background-color:#494949;color: white;text-align: center">
                            <h5><i style="border: 1px solid white; padding: 10px; border-radius: 20px;margin-top: 2px;" class="fas fa-user"></i></h5>
                            <h5>Bienvenido <%=unCliente.getNombre()%> <%=unCliente.getApellido()%></h5>
                            <h5><%=tipoUsuario%> | <%=unCliente.getTipoPlan()%></h5> 
                   </div>
            
                        <!-- boton con menu para Chofer.-->
                        <li ><a href="#"><i class="icono izquierda fas fa-globe-americas" ></i>Listado de viajes<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
					<li><a href="listadoViajes.jsp">Pendientes</a></li>
                                        <li><a href="listadoViajesCanceladoUsuario.jsp">Cancelados</a></li>
                                        <li><a href="listadoViajesRechazadoUsuario.jsp">Rechazados</a></li>
                                        <li><a href="listadoViajesFinalizadoUsuario.jsp">Finalizados</a></li>
                                        <li><a href="listadoViajesIniciadoUsuario.jsp">Iniciados</a></li>
				</ul>

			</li>
                        
                        <!-- boton con menu para Combi.-->
                             <li ><a href="#"><i class="icono izquierda fas fa-book" ></i>Comentarios<i class="icono derecha fas fa-chevron-down"></i></a>
				<ul>
                                        <li><a href="Comentario?idCliente=<%=unCliente.getIdCliente()%>">Comentar</a></li><!--Con este codigo se redirige al registro de Combi-->
                                         <li><a href="listadoComentarios?idCliente=<%=unCliente.getIdCliente()%>">Gestionar</a></li><!--Con este codigo se redirige al registro de Combi-->
                                            
				</ul>

			</li>
                        <li><a href="index.jsp"><i class="icono izquierda fas fa-bus"></i>Buscar pasaje</a></li>   
                        
                        <li><a href="sesionUsuarioConfirmacionCambioDePlan.jsp?idCliente=<%=unCliente.getIdCliente()%>&tipoPlan=<%=unCliente.getTipoPlan()%>"><i class="icono izquierda fas fa-retweet"></i>Cambiar plan</a></li>
                  <%}}%>       

		</ul>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
             <script src="../js/sesion.js"></script>
 
        </div>
    </body>
</html>