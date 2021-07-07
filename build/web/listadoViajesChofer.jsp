<%@page import="Logica.Lugar"%>
<%@page import="Logica.Combi"%>
<%@page import="Logica.Viaje"%>
<%@page import="Logica.Ruta"%>
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
            
            
            int idChofer=0;
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Combi> listaCombis = control.devolverListaCombi();   
            List <Chofer> listaChofer = control.devolverListaChoferes();   
            List <Lugar> listaLugares = control.devolverListaLugares();   
            
            String username = (String)session.getAttribute("username");
            for (Chofer unChofer:listaChoferes){
                    if (unChofer.getMail().equals(username)){
        
                         idChofer= unChofer.getIdChofer();
                    }
            }
                      
        %> 
      
        <div class="cajaListado">
            <h1>Lista viajes</h1>
        <table>
            <tr>
                <td>Origen</td> 
                <td>Destino</td> 
                <td>Fecha</td> 
                <td>Hora</td> 
                <td></td>
                         
            </tr>
                     <%for(Viaje unViaje:listaViajes){
                        int idRuta= unViaje.getIdRuta();%>
                        <%for(Ruta unaRuta:listaRutas){
                            if(idRuta == unaRuta.getIdRuta()){
                                 int idCombi= unaRuta.getIdCombi();%>
                                 <%for(Combi unaCombi:listaCombis){
                                    if(idCombi == unaCombi.getIdCombi()){
                                         int idC = unaCombi.getUnChofer().getIdChofer();%>
                                         <%for(Chofer unChofer:listaChoferes){
                                               if(idC == unChofer.getIdChofer() && idC == idChofer ){%>
                                                    <%for (Lugar unLugar:listaLugares){%> 

                                                    <%if(unLugar.getIdLugar() == unaRuta.getOrigen()){%>
                                                            <td><%=unLugar.getNombre()%><%}
                                                    else{
                                                        if(unLugar.getIdLugar() == unaRuta.getDestino()){%>
                                                            <td><%=unLugar.getNombre()%><%}}}%></td>
                                                    <td><%=unViaje.getDia()%>/<%= unViaje.getMes()%>/<%= unViaje.getAnio()%></td>
                                                    <td><%=unaRuta.getHora()%>:<%=unaRuta.getMinutos()%>hs</td>
                                                    <td> <a style="background-color: #0fc370;color: white;padding: 5px;" href="sesionChoferListadoPasajeros.jsp?idViaje=<%=unViaje.getIdViaje()%>">Ver Pasajeros</a> </td>
                                                      </tr>
                    <%}}}}}}}%>  
      </table>

            
        </div>
        
    </body>
    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>