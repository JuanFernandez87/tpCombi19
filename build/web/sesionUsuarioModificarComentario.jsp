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
                       
        <%
                int pos= Integer.valueOf(request.getParameter("pos"));
                String comentarioViejo = unCliente.getListaComentarios().get(pos);
                String fecha=comentarioViejo.substring(0,19);

        %> 
            <form action="ModificarComentario?idCliente=<%=unCliente.getIdCliente()%>&comentarioViejo=<%=pos%>&fecha=<%=fecha%>" method="post" style="margin-top: 350px;" >
           
            <textarea  class="controls" rows="5" name="comentario" placeholder=""><%=comentarioViejo.substring(19)%></textarea>
            <input class="botons" type="submit" value="Modificar">
       <%}}%>  
            </form>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>

  </body>
   
</html>
