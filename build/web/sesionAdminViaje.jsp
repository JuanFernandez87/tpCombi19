<%@page import="Logica.Ruta"%>
<%@page import="Logica.Combi"%>
<%@page import="Logica.Lugar"%>
<%@page import="Logica.Lugar"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" />
    <title>Combi 19</title>      
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
	 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
   <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>

	<aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
            <%
                    Controladora control = new Controladora();
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares();
                    List <Ruta> listaRutas = control.devolverRutas();
             %>         
		
            <form action="RegistroViaje" class="formulario-sesiones" method="post">
				<h4>Registrar viaje </h4>
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
                                  <%=combi.getPatente()%><%}%><%}%>                                  
                                   
                        </option>               
                              
                 <%}}%> 
                </select> 
                <label>Cantidad asientos</label>
                <input class="controls" type="number" name="cantAsientos" required placeholder="0">  
                <b for="start">Ingrese la fecha</b>
                <div class="fecha">
                    <input class="controls2" type="number" name="dia" required id="dia" min="1" max="31" placeholder="Dia">
                    <input class="controls2" type="number" name="mes" required id="mes" min="1" max="12" placeholder="Mes">
                    <input class="controls2" type="number" name="anio" required id="anio" min="2021" max="2025" placeholder="Año">
                </div>
                <label>Ingrese el precio</label>
                <input class="controls" type="number" name="precio" required placeholder="0">                 
                <input class="botons" type="submit" value="Cargar viaje">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    

</html>
