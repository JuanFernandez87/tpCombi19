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
                    int i = 0;
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares();
                    List <Ruta> listaRutas = control.devolverRutas();
                    int idRuta = Integer.parseInt(request.getParameter("idRuta"));
                    for (Ruta unaRuta:listaRutas) { 
                        if(unaRuta.getIdRuta() == idRuta){ 
                    
             %> 		
            <form action="ModificarRuta?idRuta=<%=idRuta%>" class="formulario-sesiones" method="post">
				<h4>Modificar ruta</h4>
                <label>Origen</label>
                <select class="controls" name="idOrigen">
                <%
                    for (Lugar origenActual:listaOrigen) {
                        if(origenActual.getIdLugar() == unaRuta.getOrigen()){ %>                       
                        <option value="<%=origenActual.getIdLugar()%>"><%=origenActual.getNombre()%></option>               
                 <%}}%>  
                <%
                    for (Lugar origen: listaOrigen) {
                        if(((origen.getIdLugar() > 0)) && (origen.getIdLugar() != unaRuta.getOrigen())){ %>                        
                        <option value="<%=origen.getIdLugar()%>"><%=origen.getNombre()%></option>               
                 <%}}%>
                </select> 
                
                <label>Destino</label>              
                <select class="controls" name="idDestino">               
                <%
                    for (Lugar destinoActual: listaDestino) {
                        if(destinoActual.getIdLugar() == unaRuta.getDestino()){ %>                        
                        <option value="<%=destinoActual.getIdLugar()%>"><%=destinoActual.getNombre()%></option>               
                 <%}}%>  
                 
                <%
                    for (Lugar destino: listaDestino) {
                        if(((destino.getIdLugar() > 0)) && (destino.getIdLugar() != unaRuta.getDestino())){ %>                        
                        <option value="<%=destino.getIdLugar()%>"><%=destino.getNombre()%></option>               
                 <%}}%>       
                </select>
                
                <label>Combi</label>
                <select class="controls" name="idCombi">
                <% for (Combi unaCombi: listaCombis){
                        if(unaCombi.getIdCombi() == unaRuta.getIdCombi()){%>
                            <option value="<%=unaCombi.getIdCombi()%>"><%=unaCombi.getPatente()%></option>
                <%}}%>    
                        
                <%
                    for (i=0 ; i < listaCombis.size(); ++i) {
                         if((!listaCombis.get(i).getPatente().equals("-1")) && (unaRuta.getIdCombi() != listaCombis.get(i).getIdCombi())) {%>                        
                        <option value="<%=listaCombis.get(i).getIdCombi()%>"><%=listaCombis.get(i).getPatente()%></option>               
                 <%}}%> 
                </select>
                               
                <div style="display: inline;">
                <label>Horario</label>
                <input class="controls2" type="number" name="hora" min="0" max="23" value="<%=unaRuta.getHora()%>">                
                <input class="controls2" type="number" name="minutos" min="0" max="59" value="<%=unaRuta.getMinutos()%>">
               </div>             
                <label>Distancia</label>
                <input class="controls" type="number" name="distancia" value="<%=unaRuta.getDistancia()%>">       
                
                <input class="botons" type="submit" value="Modificar ruta">
                <%}}%> 
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
