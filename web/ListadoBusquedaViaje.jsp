<%-- 
    Document   : listado
    Created on : 29/04/2021, 06:47:34
    Author     : Esteban
--%>
<%@page import="Logica.Cliente"%>
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
                
                 List <Cliente> listaClientes= control.devolverListaClientes();
                List <Chofer> listaChofer= control.devolverListaChoferes();

                List <Lugar> listaLugar= control.devolverListaLugares(); 

                List <Combi> listaCombi= control.devolverListaCombi(); 

                List <Ruta> listaRuta= control.devolverRutas(); 
          
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Lugar> listaLugares = control.devolverListaLugares(); 
            int idCli = 0; 
            String nomCli = "";
            String apeCli = "";
             for (Cliente cliente:listaClientes){
                        if(cliente.getEnSesion()){
                            idCli = cliente.getIdCliente();
                            nomCli = cliente.getNombre();
                            apeCli = cliente.getApellido();
                        }
                    }
             String oriL,destL="";
             int idV=0;
            for(Viaje unviaje:listaViajes){
            for (Ruta unaruta:listaRutas){
                for (Lugar lugar:listaLugar){ // obtenemos el nombre de origen y destino de cada ruta.
                    if(lugar.getIdLugar()== unaruta.getOrigen()){
                        oriL= lugar.getNombre();
                    } else{
                        if(lugar.getIdLugar() == unaruta.getDestino()){
                            destL= lugar.getNombre();
                        }
                    }
                 // si la ruta actual corresponde al viaje actual-> guardamos el nombre de las ciudades origen y destino.      
                     if(unaruta.getIdRuta() == unviaje.getIdRuta()){
                         idV = unviaje.getIdViaje();
                    }   
                }
            }
            }
            // request.setAttribute("unEntero", new Integer(22));
            //request.getRequestDispatcher("comprarPasajes.jsp").forward(request, response); %>
          
 
        
        <div class="cajaListado">
            <h1> Viajes encontrados: </h1> 
            
            <a style="background-color: #ff0000;color: white;padding: 20px;text-decoration: none;display: table-cell; Border-radius:6px;"href="index.jsp">Volver</a>
        <table>
            <tr>
                <td>Origen</td> 
                <td>Destino</td> 
                <td>Fecha</td> 
                  <td>Hora </td>
                <td>Precio </td> 
                <td>Tipo de Servicio</td>
              
                <td>Asientos <br> disponibles </td> 

                  <td>Comprar pasajes</td>
                <td></td>
                
            </tr>
            
                <%
        String origenRuta= "";
        String destinoRuta= "";
        String origenLugar="";
        String destinoLugar="";
        String tipoServicio = "";
        
        int hora=0;
        int minutos = 0;
        int asientos= -1;
        for(Viaje viaje:listaViajes){%>
                <tr><%
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
            if(viaje.getAnio()== (Integer)session.getAttribute("anio") && viaje.getMes()== (Integer)session.getAttribute("mes") 
                    && viaje.getDia()== (Integer)session.getAttribute("dia")  && origenRuta.equals((String)session.getAttribute("origen")) 
                    && destinoRuta.equals((String)session.getAttribute("destino") )){
                asientos = viaje.getCantAsientos();%>
            <td><%=(String)session.getAttribute("origen")%> </td>
            <td><%=(String)session.getAttribute("destino")%>
                <td><%=(Integer)session.getAttribute("dia")%> / <%=(Integer)session.getAttribute("mes")%> / <%=(Integer)session.getAttribute("anio")%> </td>
                <td><%=hora%>:<%=minutos%>Hs </td>
                <td> $<%=viaje.getPrecio()%> </td>
                <td><%=tipoServicio%> </td>
                <td><%=viaje.getCantAsientos()%> </td>
                <td><form class="inputHide" action="ComprarPasaje" method="POST"onSubmit = "return checkForm(event)">
                    <input  type="hidden" name="clienteViaje" value="<%=idCli%>"> </input> 
            <input type="hidden" name="ideViaje" value="<%=viaje.getIdViaje()%>"></input>
        
        <!--<a style="background-color: orange;color: white;padding: 5px;text-decoration: none;" href="#"; onclick="func()">Comprar </a> -->
                <input class="botons" type="submit" value="Comprar"></form></td><%}}%></tr>
                <% // En esta seccion se comprueba si se inicio sesion. Si hay una sesion Activa de un usuario
                    //Entonces se permite la compra y se redirige al link "comprarPasajes" para usuarios.
                    String linkHref="#";
                    for (Cliente cliente:listaClientes){
                        if(cliente.getEnSesion()){
                            //linkHref = "comprarPasajes.jsp";
                        }else{
                            //linkHref = "popUpErrorDebeIniciarSesion.jsp";
                        }
                    }
                    
                %>
             
            </table> 
                 
                
        </div> 
                 
            
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            
    <script>
        function aviso(){
          swal.fire({
                         text: "No quedan mas asientos disponibles.",
                         icon: 'error',
                         cancelButtonColor: '#d33',
                        showConfirmButton:false,
                        footer:`<a class="btn btn-primary" href="index.jsp">Confirmar</a>`
                        });  
        }
    function checkForm(e) { 
                 var asi=<%=asientos%>;
                    if(asi === 0){
                        aviso.call();
                        e.returnValue = false;
                    }
                        e.returnValue = true;             
                }
    </script>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>


    </body>
</html>