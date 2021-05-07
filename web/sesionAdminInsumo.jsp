<%-- 
    Document   : sesionAdminInsumo
    Created on : 28/04/2021, 18:40:02
    Author     : juanf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/aside.jsp"%>
        </aside>

		
            <form action="RegistroInsumo" class="formulario-sesiones" method="post">
				<h4>Registrar insumo </h4>
                <label> Nombre</label>
                <input class="controls" type="text" name="nombre" placeholder="Ingrese nombre">
                <label> Tipo</label><br>
                        <select class="controls" name="tipo">
                            <option>Dulce</option>
                            <option>Salado</option>
                        </select><br/><br/>
                <label> Precio</label>
                <input class="controls" type="tel" name="precio" placeholder="Ingrese precio">
                <input class="boton" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>

  </body>
</html>
