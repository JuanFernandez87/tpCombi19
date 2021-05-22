<%-- 
    Document   : listado
    Created on : 29/04/2021, 06:47:34
    Author     : Esteban
--%>
<%@page import="Logica.Viaje"%>
<%@page import="Logica.Ruta"%>
<%@page import="Logica.Lugar"%>
<%@page import="Logica.Combi"%>
<%@page import="Logica.Chofer"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
         
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/sesiones.css" >
        <link rel="stylesheet" type="css/fonts.css" href="">
        <link rel="stylesheet" href="css/lista.css">
    </head>
    
    <body>
            <%@include file="/template/headerSesiones.jsp"%>
    
            <%@include file="/template/aside.jsp"%>
       
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="js/sesion.js"></script>

 
      <%
            int pag=1;
            
            Controladora control = new Controladora();
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Combi> listaCombis = control.devolverListaCombi(); 
            List <Lugar> listaOrigen = control.devolverListaLugares();
            List <Lugar> listaDestino = control.devolverListaLugares();   
            
            int maxPag = (control.devolverListaViajes().size()/10)+1; 
            int i = 0; 
            if (request.getParameter("pg") != null) {
                   pag = Integer.valueOf(request.getParameter("pg"));
               } 
            int regMin = (pag - 1) * 10;
            
            int regMax = pag * 10;
            
            if(pag==maxPag){
                regMax=regMin+control.devolverListaViajes().size()%10;
            }
          
        %> 
      
        <div class="cajaListado">
            <h1>Lista viajes</h1>
        <table>
            <tr>
                <td>Destino</td> 
                <td>Origen</td> 
                <td>Distancia</td> 
                <td>Asientos disponibles</td> 
                <td>Fecha</td> 
                <td>Precio</td> 

                  <td></td>
                <td></td>
                
            </tr>
               <%
                   
                   for (Viaje viaje:listaViajes) {
                       if (viaje.getIdRuta() > 0){
                   %>
                <tr>
                    
                        <td><%for (Ruta ruta:listaRutas) {
                                    if (ruta.getDistancia() > 0){
                                        for (Lugar lugar:listaDestino){
                                            if(lugar.getIdLugar() == ruta.getDestino()){%>
                                                <%=lugar.getNombre()%><%}%><%}}}%></td>
                        <td><%for (Ruta ruta:listaRutas) {
                                    if (ruta.getDistancia() > 0){
                                        for (Lugar lugar:listaOrigen){
                                            if(lugar.getIdLugar() == ruta.getOrigen()){%>
                                                <%=lugar.getNombre()%><%}%><%}}}%></td>
                        <td><%for (Ruta ruta:listaRutas) {
                                    if (ruta.getDistancia() > 0){
                                        for (Lugar lugar:listaOrigen){
                                            if(lugar.getIdLugar() == ruta.getOrigen()){%>
                                                <%=ruta.getDistancia()%><%}%><%}}}%></td>                      
                        <td><%= viaje.getCantAsientos()%></td>
                        <td><%= viaje.getFecha()%></td>
                        <td><%= viaje.getPrecio()%></td>
                        <td> <a style="background-color: orange;color: white;padding: 5px;"href="EliminarViaje?idViaje=<%=listaViajes.get(i).getIdViaje()%>" >Modificar</a> </td>
                        <td> <a style="background-color: red;color: white;padding: 5px;" href="sesionAdminEliminarViaje.jsp?id=<%=listaViajes.get(i).getIdViaje()%>">Eliminar</a></td>

                </tr>
                 
           <%}}%>  
    
        </table>
           <br>
                <%
                    if (maxPag >= 1) {
             
                        if(pag!=1){%>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoViajes.jsp?pg=<%=pag - 1%>">&lt;</a></li>
                        <%}%>
                        <%
                            for ( i = 0; i < maxPag; i++) {
                                if(i+1==pag){
                        %>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><span><%=i+1%></span></li>
                        <%  }
                            else{%>
                                <li  style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoViajes.jsp?pg=<%=i+1%>"><%=i+1%></a></li>
                        <%}}
                        
                        if(pag!=maxPag){%>
                            <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoViajes.jsp?pg=<%=pag + 1%>">&gt;</a></li>
                <%}}
                    else {%>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;" class="active"><span>1</span></li>
                <%}
                %>
                       <br>
           <br>
            
        </div>
        
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>


    </body>
</html>