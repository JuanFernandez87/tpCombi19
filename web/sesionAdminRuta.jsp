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
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares(); 
                    int i = 0; 
             %> 		
            <form action="RegistroRuta" class="formulario-sesiones" method="post">
				<h4>Registrar ruta</h4>
                <label>Origen</label>
                <select class="controls" name="origen" required>
                        <option>Seleccione un origen</option>
                <%
                    for (Lugar origen: listaOrigen) {
                        if(origen.getIdLugar() > 0){ %>                        
                        <option value="<%=origen.getNombre()%>"><%=origen.getNombre()%></option>               
                 <%}}%>
                </select> 
                
                <label>Destino</label>              
                <select class="controls" name="destino" required>               
                        <option>Seleccione un destino</option>
                <%
                    for (Lugar destino: listaDestino) {
                        if(destino.getIdLugar() > 0){ %>%>                        
                        <option value="<%=destino.getNombre()%>"><%=destino.getNombre()%></option>               
                 <%}}%>       
                </select>
                
                <label>Combi</label>
                <select class="controls" name="combi" required>
                        <option>Seleccione una combi</option>
                <%
                    for (i=0 ; i < listaCombis.size(); ++i) {
                         if(!listaCombis.get(i).getPatente().equals("-1")){%>                        
                        <option value="<%=listaCombis.get(i).getPatente()%>"><%=listaCombis.get(i).getPatente()%></option>               
                 <%}}%> 
                </select>
                <div style="display: inline;">
                <label>Horario</label>
                <input class="controls2" type="number" name="hora" required min="0" max="23" placeholder="hora">                
                <input class="controls2" type="numer" name="minutos" required min="0" max="59" placeholder="minutos">
               </div>             
                <label>Distancia</label>
                <input class="controls" type="number" name="distancia" required placeholder="Ingrese distancia en Km">       
                
                <input class="botons" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
