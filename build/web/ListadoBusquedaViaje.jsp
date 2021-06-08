<%-- 
    Document   : listado
    Created on : 29/04/2021, 06:47:34
    Author     : Esteban
--%>
<%@page import="Logica.Administrador"%>
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
            <%@include file="/template/header.jsp"%>
       
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="js/sesion.js"></script>

 
      <%
            Controladora control = new Controladora();

                List <Chofer> listaChofer= control.devolverListaChoferes();

                List <Lugar> listaLugar= control.devolverListaLugares(); 

                List <Combi> listaCombi= control.devolverListaCombi(); 

                List <Ruta> listaRuta= control.devolverRutas(); 
          
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Lugar> listaLugares = control.devolverListaLugares();   
            
            
          
        %> 
      
        <div class="cajaListado">
            <h1> Viajes encontrados: </h1> 
            <a style="background-color: #ff0000;color: white;padding: 20px;text-decoration: none;display: table-cell;"href="index.jsp">Volver</a>
        <table>
            <tr>
                <td>Origen</td> 
                <td>Destino</td> 
                <td>Fecha</td> 
                  <td>Hora </td>
                <td>Precio </td> 
                <td>Tipo de Servicio</td>
              
                <td>Asientos <br> disponibles </td> 

                  <td></td>
                <td></td>
                
            </tr>
            <tr>
                <%
        String origenRuta= "";
        String destinoRuta= "";
        String origenLugar="";
        String destinoLugar="";
        String tipoServicio = "";
        int hora=0;
        int minutos = 0;
        for(Viaje viaje:listaViajes){
            for (Ruta ruta:listaRutas){
                for (Lugar lugar:listaLugar){ // obtenemos el nombre de origen y destino de cada ruta.
                    if(lugar.getIdLugar()== ruta.getOrigen()){
                        origenLugar= lugar.getNombre();
                    } else{
                        if(lugar.getIdLugar() == ruta.getDestino()){
                            destinoLugar= lugar.getNombre();
                        }
                    }
                 // si la ruta actual corresponde al viaje actual-> guardamos el nombre de las ciudades origen y destino.      
                     if(ruta.getIdRuta() == viaje.getIdRuta()){
                     origenRuta = origenLugar;
                     destinoRuta = destinoLugar;
                     hora= ruta.getHora();
                     minutos= ruta.getMinutos();
                    }   
                }
                for (Combi combi: listaCombi){
                    if (combi.getIdCombi() == ruta.getIdCombi()){
                        tipoServicio= combi.getTipoServicio();
                    }
                }
                 
            }    
            // preguntamos para cada viaje.> si cumple con los datos que se ingresaron en pantalla.
            if(viaje.getAnio()== (Integer)session.getAttribute("anio") && viaje.getMes()== (Integer)session.getAttribute("mes") && viaje.getDia()== (Integer)session.getAttribute("dia")  && origenRuta.equals((String)session.getAttribute("origen")) && destinoRuta.equals((String)session.getAttribute("destino") )){%>
            <td><%=(String)session.getAttribute("origen")%> </td>
            <td><%=(String)session.getAttribute("destino")%>
                <td><%=(Integer)session.getAttribute("dia")%> / <%=(Integer)session.getAttribute("mes")%> / <%=(Integer)session.getAttribute("anio")%> </td>
                <td><%=hora%>:<%=minutos%>Hs </td>
                <td> $<%=viaje.getPrecio()%> </td>
                <td><%=tipoServicio%> </td>
                <td><%=viaje.getCantAsientos()%> </td><%}}%> 
                 <td> <td> <a style="background-color: orange;color: white;padding: 5px;text-decoration: none;"href="#">Comprar </a></td></td>
            </tr>
        
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>


    </body>
</html>