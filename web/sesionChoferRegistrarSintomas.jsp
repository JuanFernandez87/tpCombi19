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
            <%@include file="/template/headerSesionChofer.jsp"%>
        </header>   
        
        <aside>
            <%@include file="/template/asideChofer.jsp"%>
        </aside>

        <%
            int idCliente = Integer.valueOf(request.getParameter("idCliente"));
            int idPasaje = Integer.valueOf(request.getParameter("idPasaje"));
        %> 
        
        <form style="margin-top: 150px" action="RegistrarSintomas?idCliente=<%= idCliente %>&idPasaje=<%= idPasaje %>" method="post">
            <h4>Información</h4>
            <label>Temperatura</label>
            <input class="controls" lang="en" type="number" step="0.1" name="temp" min="34.0" max="42.0" value="37.0" required>
            
            <label>¿Tuvo fiebre en la última semana?</label>
                <select class="controls" name="fiebre">
                        <option>No</option>
                        <option>Si</option>
                </select>        
                        
            <label>¿Tuvo perdida de olfato en la última semana?</label>
                <select class="controls" name="olfato">
                        <option>No</option>
                        <option>Si</option>
                </select>        
            
            <label>¿Tuvo dolor de garganta o dificultad respiratoria?</label>
                <select class="controls" name="garganta">
                        <option>No</option>
                        <option>Si</option>
                </select>        
            
            <input class="botons" type="submit" value="Registrar sintomas">       
        </form>        
        
      
    </body>
    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>