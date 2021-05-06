<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>      
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <title> Menu lateral </title> 
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/sesiones.css" >
        <link rel="stylesheet" type="css/fonts.css" href="">
        
  </head>
    
    <body>
        <%@include file="/template/header.jsp"%>
        <!--<header>
            <div class="contenidoHeader">
                <div class="logo"><img src="./images/logo.png" alt=""> Combi 19</div>
                 
                <nav>
                    <a href="index.jsp"><i class="fas fa-home"></i>Inicio</a>
                    <a href="login.jsp"><i class="fas fa-user"></i>Mi cuenta</a>
                    <a href="#"><i class="fas fa-address-book"></i>Contacto</a>
        <!-- 
                    <a href="sesionAdmin.jsp"><i class="fas fa-user"></i>A</a>
                    <a href="sesionUsuario.jsp"><i class="fas fa-user"></i>U</a>
                    <a href="sesionChofer.jsp"><i class="fas fa-user"></i>C</a>
                </nav>
            </div>
        </header>-->

     

        
         <!-- 
        <ul class="tab-group">
            <li class="tab active"><a href="registro.jsp">Registrar Usuario</a></li>
            <li class="tab"><a href="registroDeTarjeta.jsp">Registrar tarjeta</a></li>
            <li class="tab active"><a href="sesionAdmin.jsp">Sesion Usuarios</a></li>
            <li class="tab active"><a href="login.jsp">Login</a></li>
        </ul>--> 
        <div class="formulario">
            <form action="">
                <h4>Busca tu pasaje </h4>
                <i class="fas fa-map-marker-alt"></i><label> Destino</label>
                <input class="controls" type="text" placeholder="Ingrese destino">
                <i class="fas fa-map-marker-alt"></i><label> Origen</label>
                <input class="controls" type="text" placeholder="Ingrese origen">
                <i class="fas fa-calendar-alt"></i> <label>Partida</label>
                <input class="controls" type="date" id="start" name="trip-start"
                value="2020-07-22"
                accept=""min="1960-01-01" max="2040-12-31">
                <input class="boton" type="submit" value="Buscar Pasajes">
                <input class="boton" href="login.jsp" type="submit" value="Iniciar sesión">
            </form>
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
         <footer style="background-image: url('images/fondoFooter.jpg');">
            
            <ul>
                <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                <li> <a href="#"><i class="fab fa-tiktok"></i></a> </li>
             
            </ul>

        </footer>  
    
      </body>
</html>