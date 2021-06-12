<%-- 
    Document   : listado
    Created on : 29/04/2021, 06:47:34
    Author     : Esteban
--%>
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
            
            int maxPag = (control.devolverListaCombi().size()/10)+1; 
            int i = 0; 
            if (request.getParameter("pg") != null) {
                   pag = Integer.valueOf(request.getParameter("pg"));
               } 
            int regMin = (pag - 1) * 10;
            
            int regMax = pag * 10;
            
            if(pag==maxPag){
                regMax=regMin+control.devolverListaCombi().size()%10;
            }
          
        %> 
      
        <div class="cajaListado">
            <h1>Lista combi</h1>
            <form class="busqueda" action="detalleCombiElegido.jsp" class="formulario-sesiones" method="post">
				
                                                  
                  
                               <select  name="patente">
                                 <option value=-1>Burscar por patente </option>
                                   <%                             

                                for (   Combi combi:listaCombi) {     
                                    

                                %>                              

                                <option value=<%=combi.getIdCombi() %>><%= combi.getPatente() %> </option>
 
                                 <%}%>      
                             </select>
                             
                              
                             <input  type="submit" value="Buscar">
                       </form >   
        <table>
            <tr>
                <td>Patente</td> 
                <td>Modelo</td> 
                <td>Tipo Servicio</td> 
                <td>Cant asientos</td> 
                <td></td> 
                <td></td>
            </tr>
               <%
                   
                   for (  i=regMin ; i < regMax ; ++i) {
                       if(!listaCombi.get(i).getPatente().equals("-1")){
                   %>
                <tr>
                     
                         
                    
                        <td><%= listaCombi.get(i).getPatente()%></td>
                        <td><%= listaCombi.get(i).getModelo() %></td>
                        <td><%= listaCombi.get(i).getTipoServicio() %></td>
                        <td><%= listaCombi.get(i).getCantAsientos() %></td>
                        <td> <a style="background-color: orange;color: white;padding: 5px;"href="modificarCombi.jsp?idCombi=<%=listaCombi.get(i).getIdCombi()%>" >Modificar</a> </td>
                        <td> <a style="background-color: red;color: white;padding: 5px;" href="sesionAdminEliminarCombi.jsp?Combi=<%=listaCombi.get(i).getPatente()%>&id=<%=listaCombi.get(i).getIdCombi()%>">Eliminar</a></td>

                </tr>
                 
           <%}}%>  
    
        </table>
           <br>
                <%
                    if (maxPag >= 1) {
             
                        if(pag!=1){%>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoCombi.jsp?pg=<%=pag - 1%>">&lt;</a></li>
                        <%}%>
                        <%
                            for ( i = 0; i < maxPag; i++) {
                                if(i+1==pag){
                        %>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><span><%=i+1%></span></li>
                        <%  }
                            else{%>
                                <li  style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoCombi.jsp?pg=<%=i+1%>"><%=i+1%></a></li>
                        <%}}
                        
                        if(pag!=maxPag){%>
                            <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoCombi.jsp?pg=<%=pag + 1%>">&gt;</a></li>
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertErrorModificacionCombiAsignada.js"></script> 

    </body>
</html>
