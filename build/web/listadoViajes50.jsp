<%-- 
    Document   : listado
    Created on : 29/04/2021, 06:47:34
    Author     : Esteban
--%>
<%@page import="Logica.Pasaje"%>
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
            <%@include file="/template/headerSesionUsuario.jsp"%>
    
            <%@include file="/template/asideUsuario.jsp"%>
       
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="js/sesion.js"></script>

 
      <%
                
            int pag=1;
            int idCliente=0;
            List <Pasaje> listaPasajes = control.devolverListaPasajes();
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Lugar> listaLugares = control.devolverListaLugares();   
            List <Cliente> listaClientes = control.devolverListaClientes();
            
            String username = (String)session.getAttribute("username");
            for (Cliente unCliente:listaClientes){
                    if (unCliente.getMail().equals(username)){
        
                         idCliente= unCliente.getIdCliente();
                    }
            }
            
            int maxPag = (control.devolverListaPasajes().size()/10)+1; 
            int i = 0; 
            if (request.getParameter("pg") != null) {
                   pag = Integer.valueOf(request.getParameter("pg"));
               } 
            int regMin = (pag - 1) * 10;
            
            int regMax = pag * 10;
            
            if(pag==maxPag){
                regMax=regMin+control.devolverListaPasajes().size()%10;
            }
            int cant =0;
            for (Pasaje unPasaje:listaPasajes){
                            
                     if(unPasaje.getIdCliente() == idCliente){
                        if(unPasaje.getEstado().equals("Pendiente")){  //Pendientes
                            cant++;
                        }
                     }
            }
            
            if(cant > 0){
                        
                            
          
        %> 
      
        <div class="cajaListado">
            <h1>Mis pasajes</h1>
        <table>
            <tr>
                <td>Origen</td> 
                <td>Destino</td> 
                <td>Fecha</td> 
                <td>Hora</td> 
                <td>Precio</td> 
                <td></td>
                
            </tr>
                <%for (Pasaje unPasaje:listaPasajes){
                            
                     if((unPasaje.getIdCliente() == idCliente)&&(unPasaje.getEstado().equals("Pendiente"))){%>
                     <%for (Viaje unViaje:listaViajes){
                     
                            if(unPasaje.getIdViaje() == unViaje.getIdViaje()){%>

                <tr>
                    <%for (Ruta unaRuta:listaRutas){
                        if (unViaje.getIdRuta() == unaRuta.getIdRuta()){%>
                    
                    <%for (Lugar unLugar:listaLugares){%> 

                    <%if(unLugar.getIdLugar() == unaRuta.getOrigen()){%>
                               <td><%=unLugar.getNombre()%><%}
                        else{
                            if(unLugar.getIdLugar() == unaRuta.getDestino()){%>
                               <td><%=unLugar.getNombre()%><%}}%></td>
                    
         
                               
                    <%}%>

                        <td><%=unViaje.getDia()%>/<%= unViaje.getMes()%>/<%= unViaje.getAnio()%></td>
                        <td><%=unaRuta.getHora()%>:<%=unaRuta.getMinutos()%>hs</td>
                        <td><%= unViaje.getPrecio()%>$</td>
                        <td> <a style="background-color: red;color: white;padding: 5px;" href="CancelarPasajeConfirmacion.jsp?id=<%=unPasaje.getIdPasaje()%>">Cancelar pasaje</a></td>
  
                </tr>
                    <%}}}}}}}
                    else{%>
                     <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                     <script src="js/sweetAlertNohayPasajesPendientes.js"></script>  

                   
                     <%}
                    %>   
               

    
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
               
                       <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                       <script>
                           
                           swal.fire({
    title: "Se le devolvera 50% de lo gastado.",
    icon: 'info'
});
                       </script>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        
        

    </body>
</html>