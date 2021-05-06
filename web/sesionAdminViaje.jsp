<%-- 
    Document   : sesionAdminLugar
    Created on : 28/04/2021, 18:03:49
    Author     : juanf
--%>

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
   <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>

	<aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
		
            <form action="RegistroViaje" class="formulario-sesiones" method="post">
				<h4>Registrar un viaje </h4>
                <label> Ciudad</label>
                <input class="controls" type="text" name="nombre" placeholder="Nombre de la ciudad">
                <label> Provincia</label>
                <input class="controls" type="text" name="provincia" placeholder="Provincia">  
                 <label> Ciudad</label>
                <input class="controls" type="text" name="nombre" placeholder="Nombre de la ciudad">
                <label> Provincia</label>
                <input class="controls" type="text" name="provincia" placeholder="Provincia">      
                
                <input class="boton" type="submit" value="Cargar lugar">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

	<footer>
		footer &copy
	</footer> 
    

</html>
