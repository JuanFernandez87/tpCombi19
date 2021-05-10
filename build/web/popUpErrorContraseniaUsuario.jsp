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
                <form action="RegistroCliente" method="post">
               <h4>Formulario Registro</h4>
               <input class="controls" type="text" name="nombre" required id="nombres" placeholder="Ingrese su Nombre">
               <input class="controls" type="text" name="apellido" required id="apellidos" placeholder="Ingrese su Apellido">
               <input class="controls" type="tel" name="dni" required id="dni" placeholder="Ingrese su Dni">
               <input class="controls" type="email" name="mail" required id="correo" placeholder="Ingrese su Correo">
               <input class="controls" type="password" name="pass" required id="contra" placeholder="Ingrese su Contraseña">
               <b for="start">Ingrese su fecha de nacimiento:</b><br>
               <div class="fecha">
                    <input class="controls2" type="number" name="dia" required id="dia" min="1" max="31" placeholder="Dia">
                    <input class="controls2" type="number" name="mes" required id="mes" min="1" max="12" placeholder="Mes">
                    <input class="controls2" type="number" name="anio" required id="anio" min="1960" max="2021" placeholder="Año">
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

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    

 

                <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweerAlertContraseniaIncorrecta.js"></script>
    </body>
</html>