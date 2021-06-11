<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">     
    </head>

<body>
        <header>
            <%@include file="/template/headerSesionUsuario.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/asideUsuario.jsp"%>
        </aside>   
        <%
            
             List <Cliente> listaClientes2 = control.devolverListaClientes(); 
                String username = (String)session.getAttribute("username");
                for (Cliente unCliente:listaClientes2){
                    if (unCliente.getMail().equals(username)){%>     
                       
      
            <form action="CrearComentario?idCliente=<%=unCliente.getIdCliente()%>" method="post" style="margin-top: 350px;" >
            <h4>Dejanos un comentario</h4>
            <textarea  class="controls" rows="5" name="comentario" placeholder="Dejanos un comentario....."></textarea>
            <input class="botons" type="submit" value="Publicar">
       <%}}%>  
            </form>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       
         <script src="js/sweetAlertComentarioCorrecto.js"></script>
 <script src="js/sesion.js"></script>
  </body>
   

</html>
