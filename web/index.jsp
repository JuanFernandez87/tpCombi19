<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    </head>
    
    <body>
        <header>
            <%@include file="/template/header.jsp"%>
        </header>
        
        <div class="formulario">
            <form action="">
                <h4>Busca tu pasaje </h4>
                <i class="fas fa-map-marker-alt"></i><label> Destino</label>
                <input class="controls" type="text" placeholder="Ingrese destino">
                <i class="fas fa-map-marker-alt"></i><label> Origen</label>
                <input class="controls" type="text" placeholder="Ingrese origen">
                <i class="fas fa-calendar-alt"></i> <label>Partida</label>
                <input class="controls" type="fecha" id="start" name="trip-start"
                value="2020-07-22"
                accept=""min="1960-01-01" max="2040-12-31">
              <div style="display: flex" >  
                <input class="botons" type="submit" value="Buscar Pasajes" style="margin: 7px 20px;">
                <input class="botons" href="login.jsp" type="submit" value="Iniciar sesión" style="margin: 7px 20px;">
            </form>
            </div>
        </div>
            <div class="comentarios">
                <div class="comentario">
                    <h5><img src="./images/mesi.jpg" alt="">Ricardo Bertone</h5>
                    <p>Excelente servicio</p>   
                </div>
                <div class="comentario">
                    <h5><img src="./images/mona.jpg" alt="">Alicia Estevez</h5>
                    <p>Muy recomendable</p>   
                </div>
                <div class="comentario">
                    <h5><img src="./images/barba.jpg" alt="">Alejandro Fernandez(como el músico)</h5>
                    <p>Los mejores!</p>  
                </div>
           
               
            </div>
            
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
      </body>
</html>