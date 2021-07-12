<%@page import="Logica.Pasaje"%>
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
            String finalizado = "Finalizado";  
            int idViajecito = 0;
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Combi> listaCombis = control.devolverListaCombi();   
            List <Chofer> listaChofer = control.devolverListaChoferes();   
            List <Lugar> listaLugares = control.devolverListaLugares();
            List <Pasaje> listaPasajes = control.devolverListaPasajes();
            int pasajes = 0;
            String username = (String)session.getAttribute("username");
            for (Chofer unChofer:listaChoferes){
                    if (unChofer.getMail().equals(username)){
        
                         idChofer= unChofer.getIdChofer();
                    }
            }
            int cant=0;
            for(Viaje unViaje:listaViajes){
                if(unViaje.getEstado().equals("Iniciado")){
                        int idRuta= unViaje.getIdRuta();
                        for(Ruta unaRuta:listaRutas){
                            if(idRuta == unaRuta.getIdRuta()){
                                 int idCombi= unaRuta.getIdCombi();
                                 for(Combi unaCombi:listaCombis){
                                    if(idCombi == unaCombi.getIdCombi()){
                                         int idC = unaCombi.getUnChofer().getIdChofer();
                                         for(Chofer unChofer:listaChoferes){
                                               if(idC == unChofer.getIdChofer() && idC == idChofer ){
                                                   cant++;
                                               }}}}}}}}

            if(cant > 0){          
        %> 
      
        <div class="cajaListado">
            <h1>Listado de viajes iniciados</h1>
        <table>
            <tr>
                <td style="text-align: center;">Origen</td> 
                <td style="text-align: center;">Destino</td> 
                <td style="text-align: center;">Combi</td>
                <td style="text-align: center;">Cant de pasajeros</td>
                <td style="text-align: center;">Fecha</td> 
                <td style="text-align: center;">Hora</td> 
                         
            </tr>
                     <%for(Viaje unViaje:listaViajes){
                        if(unViaje.getEstado().equals("Iniciado")){
                            idViajecito = unViaje.getIdViaje();
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
                                                            <td style="text-align: center;"><%=unLugar.getNombre()%><%}
                                                    else{
                                                        if(unLugar.getIdLugar() == unaRuta.getDestino()){%>
                                                            <td style="text-align: center;"><%=unLugar.getNombre()%><%}}}%></td>
                                                    <td style="text-align: center;"><%=unaCombi.getPatente()%></td>
                                                    
                                                    <%for(Pasaje unPasaje:listaPasajes){%>
                                                        <%if(unPasaje.getIdViaje() == unViaje.getIdViaje()){  
                                                                pasajes++;
                                                        }
                                                     }%>
                                                        
                                                        <td style="text-align: center;"><%=pasajes%></td>
                                                    
                                                    <td style="text-align: center;"><%=unViaje.getDia()%>/<%= unViaje.getMes()%>/<%= unViaje.getAnio()%></td>
                                                    <td style="text-align: center;"><%=unaRuta.getHora()%>:<%=unaRuta.getMinutos()%>hs</td>
                                                    <td style="text-align: center;"> <a style="background-color: #0fc370;color: white;padding: 5px;" href="sesionChoferListadoPasajeros.jsp?idViaje=<%=unViaje.getIdViaje()%>">Ver Pasajeros</a> </td>
                                                                                                        
                                                    </tr>
                    <%}}}}}}}}}
                    else{%>
                        
                             <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                             <script src="js/sweetAlertNohayViajesIniciados.js"></script>    
                        </div>
            <tr>
                <td>Origen</td> 
                <td>Destino</td> 
                <td>Fecha</td> 
                <td>Hora</td> 
                <td></td>
                         
            </tr>
                     <%}
                    %>  
      </table>
        <br></br>
<div style="display:flex; margin-left: 350px; margin-right: 450px;">
    <form style="width: 0px;background-color: #266aa7;color: white;padding: 0px;" action="ActualizarEstadoViaje?idViaje=<%=idViajecito%>&estado=<%=finalizado%>" method="post">
        <input style="background-color: #ff0000;color: white;padding: 14px;border-radius: 6px" type="submit" value="Finalizar viaje"/>                    
    </form>  
          
</div>
            
        </div>
        
    </body>
    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>