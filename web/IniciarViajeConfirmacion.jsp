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
     <%
   
         int idViaje = Integer.valueOf(request.getParameter("idViaje"));
         String iniciado = "Iniciado";
    %>
        <header>
            <%@include file="/template/headerSesionChofer.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/asideChofer.jsp"%>
        </aside>               
    <div style=" position: absolute;background: #424242;top:50%;left: 50%;margin-top: -100px;margin-left: -100px;padding:20px;font-family: inherit;font-size: 1rem;
        color: #595959;text-align: center;padding: 70px; border: none;border-radius: 5px;">
             
        <h3 style="color: white">Quiere dar inicio al viaje ?</h3><br>
             
        <form style="width: 0px; background-color: rgb (48, 133, 214);color: white;padding: 0px;" action="ActualizarEstadoViaje?idViaje=<%=idViaje%>&estado=<%=iniciado%>" method="post">   
            <input style="float: right; margin-top: -11px; margin-right: 5px; display: inline;color: white; background-color: rgb(48, 133, 214);padding: 10px;border-radius: 5px;" type="submit" value="Aceptar"/>
            
            <a style="display: inline;color: white; background-color: rgb(211, 51, 51);padding: 10px;border-radius: 5px;" href="sesionChoferListadoPasajeros.jsp?idViaje=<%=idViaje%>">Cancelar</a>
        </form>
             
        
        
    </div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 


        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>

  </body>
   
</html>

		

