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
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
        
        <aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
        
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
                <label>Contraseņa</label>
                <input class="controls" type="password" name="pass" required placeholder="Ingrese contraseņa">
                <label>Telefono de contacto</label>
                <input class="controls" type="tel" name="tel" required placeholder="Ingrese telefono">
                <input class="botons" type="submit" value="Dar de alta ">

            </form>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertContrasenia.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    </body>
</html>