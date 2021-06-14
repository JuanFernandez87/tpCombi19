<%-- 
    Document   : listado
    Created on : 29/04/2021, 06:47:34
    Author     : Esteban
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Insumo"%>
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
    
            <%@include file="/template/asideUsuario.jsp"%>
       
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="js/sesion.js"></script>

      <%
         
            List <Cliente> listaClientes = control.devolverListaClientes(); 
            String username = (String)session.getAttribute("username");
            for (Cliente unCliente:listaClientes){
                if (unCliente.getMail().equals(username)){%>     
                         
          
        %> 
        <div class="cajaListado">
             <h1>Comentarios</h1>
            <table>
        
           <tr>
                <td>Comentario</td> 
                <td>Fecha</td> 
                <td>Hora</td> 
                <td></td> 
                <td></td> 
           </tr>
           
               <%
                   
                 for (int i = 0; i < unCliente.getListaComentarios().size(); i++)       {
                     String fecha=unCliente.getListaComentarios().get(i).substring(0,10);
                     String hora=unCliente.getListaComentarios().get(i).substring(12,19);
                     String comentario=unCliente.getListaComentarios().get(i).substring(19);
                %>
                <tr>
                    <td><%= comentario %></td>
                    <td><%= fecha %></td>
                    <td><%= hora %></td>
                     <td> <a style="background-color: orange;color: white;padding: 5px;" href="sesionUsuarioModificarComentario.jsp?unCliente=<%=unCliente.getNombre()%>&pos=<%=i%>" >Modificar</a> </td>
                    <td> <a style="background-color: red;color: white;padding: 5px;" href="sesionAdminEliminarComentario.jsp?idComentario=<%=i%>&idCliente=<%=unCliente.getIdCliente()%>">Eliminar</a></td>

                </tr>
                 
           <%}}}%>  
           
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       
         <script src="js/sweetAlertComentarioModificado.js"></script>

        
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>


    </body>
</html>