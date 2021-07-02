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
        
        <form style="margin-top: 150px" action="RegistrarSintomas" method="post">
            <h4>Información</h4>
            <label>Temperatura</label>
            <input class="controls" type="number" name="temp" min="34" max="42" value="37" required>
            
            <label>¿Tuvo fiebre en la última semana?</label>
                <select class="controls" name="fiebre" required>
                        <option>No</option>
                        <option>Si</option>
                </select>        
                        
            <label>¿Tuvo perdida de olfato en la última semana?</label>
                <select class="controls" name="olfato" required>
                        <option>No</option>
                        <option>Si</option>
                </select>        
            
            <label>¿Tuvo dolor de garganta o dificultad respiratoria?</label>
                <select class="controls" name="garganta" required>
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