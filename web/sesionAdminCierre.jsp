<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
	<link rel="stylesheet" href="css/cierre.css" > 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
<body>
        <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
        <aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
		
        <div class="formulario">
            <form>
	    <div class="divCierre">
                <h3>Quiere cerrar sesion ?</h3>
                <a href="index.jsp">Aceptar</a>
                <a href="sesionAdmin.jsp">Cancelar</a>
            </div> 
            </form>
            </div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
