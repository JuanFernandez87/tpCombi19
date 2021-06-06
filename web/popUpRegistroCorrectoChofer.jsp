<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/sesiones.css" >
        <link rel="stylesheet" type="css/fonts.css" href="">
        <link rel="stylesheet" href="css/lista.css">
    </head>
    
    <body>
            <%@include file="/template/headerSesiones.jsp"%>
    
            <%@include file="/template/aside.jsp"%>
       
            <form action="RegistroChofer" class="formulario-sesiones" method="post">
				<h4>Registrar chofer </h4>
                <label>Nombre</label>
                <input class="controls" type="text" name="nombre" required placeholder="Ingrese nombre">
                <label>Apellido</label>
                <input class="controls" type="text" name="apellido" required placeholder="Ingrese apellido">
                <label>Dni</label>
                <input class="controls" type="tel" name="dni" required placeholder="Ingrese Dni">
                <label>Mail</label>
                <input class="controls" type="mail" name="mail" required placeholder="Ingrese mail">
                <label>Contraseña</label>
                <input class="controls" type="password" name="pass" required placeholder="Ingrese contraseña">
                <label>Telefono de contacto</label>
                <input class="controls" type="tel" name="tel" required placeholder="Ingrese telefono">
                <input class="botons" type="submit" value="Dar de alta ">

            </form>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertRegistroCorrecto.js"></script>

        
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>


    </body>
</html>
        
     
