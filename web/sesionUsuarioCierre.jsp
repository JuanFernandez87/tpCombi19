<%@page import="Persistencia.ControladoraPersistencia"%>
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
            <%@include file="/template/headerSesionUsuario.jsp"%>
        </header>
        <aside>
            <%@include file="/template/asideUsuario.jsp"%>
        </aside>
        <%
        ControladoraPersistencia controlPersis = new ControladoraPersistencia();
        List <Cliente> listaClientes= control.devolverListaClientes();
        for (Cliente cliente:listaClientes){
                        if(cliente.getEnSesion()){
                            cliente.setEnSesion(false);
                            controlPersis.asignarCliente(cliente);
                        }
                        
                    }%>
        <div class="formulario-sesiones">
	    <div class="divCierre" style=" position: absolute;background: #424242;top:50%;left: 50%;margin-top: -100px;margin-left: -100px;padding:20px;font-family: inherit;font-size: 1rem;
        color: white;text-align: center;padding: 70px; border: none;border-radius: 5px;">
                <h3>Quiere cerrar sesion ?</h3>
                <br>
                <a style="display: inline;color: white; background-color: rgb(48, 133, 214);padding: 10px;border-radius: 5px;"href="index.jsp">Aceptar</a>
                <a style="display: inline;color: white; background-color: rgb(211, 51, 51);padding: 10px;border-radius: 5px;" href="sesionUsuario.jsp">Cancelar</a>
            </div> 
        </div> 
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
