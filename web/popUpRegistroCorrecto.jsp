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
            <form class="form-register" action="LoginUsuarios" method="POST"> 
          <h4>Iniciar Sesion</h4>

          <input class="controls" type="email" name="username" id="correo" placeholder="Ingrese su Correo">
          <input class="controls" type="password" name="pass" id="pas" placeholder="Ingrese su Contrase�a">

          <input class="botons" type="submit" value="Iniciar">

          <p><a href="registro.jsp">�No tenes Cuenta?</a></p>

        </form>
         </div>
     
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
             <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertRegistroCorrecto.js"></script>
        
    </body>
</html>