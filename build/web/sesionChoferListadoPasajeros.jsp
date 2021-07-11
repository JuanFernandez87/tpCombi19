<%@page import="Logica.Viaje"%>
<%@page import="Logica.Pasaje"%>
<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <link rel="stylesheet" href="css/lista.css">
    </head>
    
    <body>
        <header>
            <%@include file="/template/headerSesionChofer.jsp"%>
        </header>
        
        <aside>
            <%@include file="/template/asideChofer.jsp"%>
        </aside>
        
        <%
            //int idViaje = (Integer)session.getAttribute("idViaje");
            int idViaje = Integer.valueOf(request.getParameter("idViaje"));
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Pasaje> listaPasajes = control.devolverListaPasajes();
            List <Cliente> listaClientes = control.devolverListaClientes();
            String iniciado = "Iniciado";
            String finalizado = "Finalizado";
            int cant=0;
            for(Viaje unViaje:listaViajes){
                        
                     for(Pasaje unPasaje:listaPasajes){
                            if((unViaje.getIdViaje() == unPasaje.getIdViaje())&&(unPasaje.getEstado().equals("Pendiente"))){
                                cant++;
                            }
                     }
            }
            if (cant > 0){         
        %> 
      
        <div class="cajaListado" >
            <h1>Listado de pasajeros</h1>
        <table style="line-height: 12px;">
            <tr>
                <td>Dni</td> 
                <td>Apellido</td> 
                <td>Nombre</td> 
                <td>Asistencia</td>
                         
            </tr>
            <tr>
                     <%for(Viaje unViaje:listaViajes){%>
                        
                        <%for(Pasaje unPasaje:listaPasajes){
                            if(unViaje.getIdViaje() == unPasaje.getIdViaje()){%>

                                        <td><%=unPasaje.getDni()%></td>
                                        <td><%=unPasaje.getApellido()%></td>
                                        <td><%=unPasaje.getNombre()%></td>
                                                                      
                                        <td>
                                            <input type="radio" id="html" name="<%=unPasaje.getDni()%>" value="HTML"> 
                                            <label style="background-color:rgba(0, 0, 0, 0);color: black; " for="html">Asistió</label>
                                            <br></br>
                                            <input type="radio" id="html" name="<%=unPasaje.getDni()%>" value="HTML" checked>
                                            <label style="background-color:rgba(0, 0, 0, 0);color: black;" for="html">Ausente</label>                                     
                                        </td>
                                        <td><a style="background-color: #0fc370;color: white;padding: 14px;border-radius: 6px" href="sesionChoferRegistrarSintomas.jsp?idCliente=<%=unPasaje.getIdCliente()%>&idPasaje=<%=unPasaje.getIdPasaje()%>&dni=<%= unPasaje.getDni() %>">Registrar sintomas</a> 
                                        </td>
                                        

            </tr>
                
      </table>
<br></br>
<div style="display:flex; margin-left: 350px; margin-right: 450px;">
    <form style="width: 0px; background-color: #266aa7;color: white;padding: 0px;" action="ActualizarEstadoViaje?idViaje=<%=idViaje%>&estado=<%=iniciado%>" method="post">   
        <input style="background-color: #0fc370;color: white;padding: 14px;border-radius: 6px" type="submit" value="Iniciar viaje" onclick="iniciarViaje()"/>
    </form>
        <br></br>
    <form style="width: 0px;background-color: #266aa7;color: white;padding: 0px;" action="ActualizarEstadoViaje?idViaje=<%=idViaje%>&estado=<%=finalizado%>" method="post">
        <input style="background-color: #ff0000;color: white;padding: 14px;border-radius: 6px" type="submit" value="Finalizar viaje" onclick="finalizarViaje()"/>                    
    </form>        
</div>
            <%}}}}
            else{%>  
                 <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                 <script src="js/sweetAlertViajeSinPasajeros.js"></script>  
                      <%}
                    %>  
<br></br>
        
    </body>
    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script>
            function iniciarViaje(){
                alert("El viaje ha sido iniciado");
            }
            function finalizarViaje(){
                alert("El viaje ha sido finalizado");
            }
        </script>    
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>