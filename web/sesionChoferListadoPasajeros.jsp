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
            int idViaje = (Integer)session.getAttribute("idViaje");
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Pasaje> listaPasajes = control.devolverListaPasajes();
            List <Cliente> listaClientes = control.devolverListaClientes();
            int i = 0;
        %> 
      
        <div class="cajaListado">
            <h1>Listado de pasajeros</h1>
        <table>
            <tr>
                <td>Dni</td> 
                <td>Apellido</td> 
                <td>Nombre</td> 
                <td>Asistencia</td>
                         
            </tr>
            <tr>
                     <%for(Viaje unViaje:listaViajes){
                        i++;%>
                        
                        <%for(Pasaje unPasaje:listaPasajes){
                            if(unViaje.getIdViaje() == unPasaje.getIdViaje()){%>
                                 <%for(Cliente unCliente:listaClientes){
                                    if(unPasaje.getIdCliente() == unCliente.getIdCliente()){%>
                                        <td><%=unCliente.getDni()%></td>
                                        <td><%=unCliente.getApellido()%></td>
                                        <td><%=unCliente.getNombre()%></td>
                                                                      
                                        <td>
                                            <input type="radio" id="html" name="<%=unCliente.getDni()%>" value="HTML"> 
                                            <label style="background-color:rgba(0, 0, 0, 0);color: black; " for="html">Asistió</label>
                                            <br></br>
                                            <input type="radio" id="html" name="<%=unCliente.getDni()%>" value="HTML" checked>
                                            <label style="background-color:rgba(0, 0, 0, 0);color: black;" for="html">Ausente</label>                                     
                                        </td>
                                        <td><a style="background-color: #0fc370;color: white;padding: 14px;" href="sesionChoferRegistrarSintomas.jsp?idCliente=<%=unCliente.getIdCliente()%>&idPasaje=<%=unPasaje.getIdPasaje()%>">Registrar sintomas</a> 
                                        </td>
                                        

            </tr>
                    <%}}}}}%>  
                    
      </table>
<br></br>
<div style="margin-left: 400px" >
        <a style="background-color: #0fc370;color: white;padding: 14px;" href="ActualizarEstadoViajes?idViaje">Iniciar viaje</a>
        <a style="background-color: #ff0000;color: white;padding: 14px;" href="ActualizarEstadoViajes?idViaje">Finalizar viaje</a>                    
            
    </div>
<br></br>
        
    </body>
    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>