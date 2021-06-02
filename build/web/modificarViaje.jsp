<%@page import="Logica.Viaje"%>
<%@page import="Logica.Ruta"%>
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
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
	 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
<body>
	  <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
	<aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
            <%
                    int idViaje = Integer.parseInt(request.getParameter("idViaje"));
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares();
                    List <Ruta> listaRutas = control.devolverRutas();
                    List <Viaje> listaViajes = control.devolverListaViajes();
                    for (Viaje unViaje:listaViajes) { 
                        if(unViaje.getIdViaje() == idViaje){ 
             %>         
		
             <form action="ModificarViaje?idViaje=<%=idViaje%>" class="formulario-sesiones" method="post">
				<h4>Modificar viaje</h4>
                <label>Ruta</label>
                <select class="controls" name="idRuta" required>
                        <option>Seleccione una ruta</option>
                <%for (Ruta ruta: listaRutas) {
                        if (ruta.getDistancia() > 0){%>                        
                        <option value="<%=ruta.getIdRuta()%>">
                            <%for (Lugar lugar:listaOrigen){
                                if(lugar.getIdLugar() == ruta.getOrigen()){%>
                                  <%=lugar.getNombre()%><%}%><%}%>
                                    -
                            <%for (Lugar lugar2:listaDestino){
                                if(lugar2.getIdLugar() == ruta.getDestino()){%>
                                  <%=lugar2.getNombre()%><%}%><%}%>
                                    -
                            <%for (Combi combi:listaCombis){
                                if(combi.getIdCombi() == ruta.getIdCombi()){%>
                                  <%=combi.getPatente()%>                                  
                                    -
                                  <%=combi.getCantAsientos()%><%}%><%}%> lugares 
                                    -
                            <%=ruta.getHora()%>:<%=ruta.getMinutos()%> hs         
                        </option>               
                              
                 <%}}%> 
                </select> 
                <!--label>Cantidad asientos</label>
                <input class="controls" type="number" name="cantAsientos" required placeholder="0"-->  
                <b for="start">Ingrese la fecha</b>
                <div class="fecha">
                    <input class="controls2" type="number" name="dia" id="dia" min="1" max="31" value="<%=unViaje.getDia()%>">
                    <input class="controls2" type="number" name="mes" id="mes" min="1" max="12" value="<%=unViaje.getMes()%>">
                    <input class="controls2" type="number" name="anio" id="anio" min="2021" max="2025" value="<%=unViaje.getAnio()%>">
                </div>
                <label>Ingrese el precio</label>
                <input class="controls" type="number" name="precio" value="<%=unViaje.getPrecio()%>">                 
                <input class="botons" type="submit" value="Modificar viaje">
            <%}}%>     
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
