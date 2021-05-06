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
        
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

        
        <link rel="stylesheet" href="css/styles.css" >
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilosRegistro_1.css">
        <title>Combi 19</title>
    </head>
    <body>
        <header>
            <div class="contenidoHeader">
                <div class="logo"><img src="./images/logo.png" alt=""> Combi 19</div>
                
                <nav>
                    <a href="index.jsp"><i class="fas fa-home"></i>Inicio</a>
                    <a href=""><i class="fas fa-user"></i>Mi cuenta</a>
                    <a href="#"><i class="fas fa-address-book"></i>Contacto</a>

                </nav>
            </div>
        </header>
        
        
        <div class="formulario">
                <form action="RegistroCliente" method="post">
               <h4>Formulario Registro</h4>
               <input class="controls" type="text" name="nombre" id="nombres" placeholder="Ingrese su Nombre">
               <input class="controls" type="text" name="apellido" id="apellidos" placeholder="Ingrese su Apellido">
               <input class="controls" type="tel" name="dni" id="dni" placeholder="Ingrese su Dni">
               <input class="controls" type="email" name="mail" id="correo" placeholder="Ingrese su Correo">
               <input class="controls" type="password" name="pass" id="correo" placeholder="Ingrese su Contraseña">
               <b for="start">Ingrese su fecha de nacimiento:</b><br>
               <!--<input class="controls" type="date" id="datepicker" name="date"
                   value="2020-07-22"
                   accept=""min="1960-01-01" max="2040-12-31">
               <form name = "plan">--> 
               <div class="fecha">
                    <input class="controls2" type="number" name="dia" id="dia" min="1" max="31" placeholder="Dia">
                    <input class="controls2" type="number" name="mes" id="mes" min="1" max="12" placeholder="Mes">
                    <input class="controls2" type="number" name="anio" id="anio" min="1960" max="2021" placeholder="Año">
               </div><br>
                <label> Seleccione tipo de plan</label>
                        <select class="controls" name="tipoPlan">
                            <option>Basico</option>
                            <option>Gold</option>
                        </select>
               <input class="botons" type="submit" value="Registrarme">

               <p><a href="login.jsp">Ya tengo Cuenta</a></p>
               
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