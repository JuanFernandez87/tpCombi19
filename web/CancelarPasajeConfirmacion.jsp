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
   
        int id=0;
  
        
        id = Integer.valueOf(request.getParameter("id"));
    %>
        <header>
            <%@include file="/template/headerSesionUsuario.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/asideUsuario.jsp"%>
        </aside>               
        <div style=" position: absolute;background: #fff;top:50%;left: 50%;margin-top: -100px;margin-left: -100px;padding:20px;font-family: inherit;font-size: 1rem;
        color: #595959;text-align: center;padding: 70px; border: none;border-radius: 5px;">
             
        <h3>Quiere cancelar el pasaje ?</h3><br>
             <a style="display: inline;color: white; background-color: rgb(48, 133, 214);padding: 10px;border-radius: 5px;" href="EliminarPasaje?idPasaje=<%= id %>">Aceptar</a>
             <a style="display: inline;color: white; background-color: rgb(211, 51, 51);padding: 10px;border-radius: 5px;" href="listadoViajes.jsp">Cancelar</a>
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

		

