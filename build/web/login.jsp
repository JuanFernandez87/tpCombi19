<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <!--      
        <ul class="tab-group">
            <li class="tab active"><a href="registro.jsp">Registrar Usuario</a></li>
            <li class="tab"><a href="registroDeTarjeta.jsp">Registrar tarjeta</a></li>
            <li class="tab active"><a href="sesionAdmin.jsp">Sesion Administrador</a></li>
            <li class="tab active"><a href="sesionUsuario.jsp">Sesion Usuarios</a></li>
            <li class="tab active"><a href="sesionChofer.jsp">Sesion Chofer</a></li>
            <li class="tab active"><a href="login.jsp">Login</a></li>
        </ul>
                
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css" >
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilosRegistro.css">
        
    </head>
    <body>
        <%@include file="/template/header.jsp"%>
                
        <div class="formulario">
            <form class="form-register" action="LoginUsuarios" method="POST"> 
          <h4>Iniciar Sesion</h4>

          <input class="controls" type="email" name="username" id="correo" placeholder="Ingrese su Correo">
          <input class="controls" type="password" name="pass" id="pas" placeholder="Ingrese su Contraseña">

          <input class="botons" type="submit" value="Iniciar">

          <p><a href="registro.jsp">¿No tenes Cuenta?</a></p>

        </form>
         </div>

        
         <!--   
        <ul class="tab-group">
            <li class="tab active"><a href="registro.jsp">Registrar Usuario</a></li>
            <li class="tab"><a href="registroDeTarjeta.jsp">Registrar tarjeta</a></li>
            <li class="tab active"><a href="sesionAdmin.jsp">Sesion Usuarios</a></li>
            <li class="tab active"><a href="login.jsp">Login</a></li>
        </ul>--> 
     
         <footer style="background-image: url('images/fondoFooter.jpg');">
            
            <ul>
                <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                <li> <a href="#"><i class="fab fa-tiktok"></i></a> </li>
             
            </ul>

        </footer>  
    
                
    </body>
</html>