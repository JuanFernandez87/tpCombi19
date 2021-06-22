<%@page import="Logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        
    
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
  

    <link rel="stylesheet" href="css/fonts.css" >
    <link rel="stylesheet" href="css/sesiones.css" >
       
    </head>

<body>
   
        <header>
            <%@include file="/template/headerSesionUsuario.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/asideUsuario.jsp"%>
        </aside>
        
	<%      
                List <Cliente> listaClientes2 = control.devolverListaClientes(); 
                String username = (String)session.getAttribute("username");
                for (Cliente unCliente:listaClientes2){
                    if (unCliente.getMail().equals(username)){%>          


            <form style="margin-top: 150px" action="ModificarCliente?idCliente=<%=unCliente.getIdCliente()%>" method="post">
               <h4>Mi información</h4>
               <label>Nombre</label>
               <input class="controls" type="text" name="nombre" value="<%=unCliente.getNombre()%>" >
               <label>Apellido</label>
               <input class="controls" type="text" name="apellido" value="<%=unCliente.getApellido()%>">
               <label>Dni</label>
               <input class="controls" type="tel" name="dni" id="dni" value="<%=unCliente.getDni()%>">
               <label>E-mail</label>
               <input class="controls" type="email" name="mail" id="correo" value="<%=unCliente.getMail()%>">
               <label>Contraseña</label>
               <input class="controls" type="text" name="pass" id="contra" value="<%=unCliente.getContra()%>">
               <b for="start">Ingrese su fecha de nacimiento:</b><br>
               <div class="fecha">
                    <input class="controls2" type="number" name="dia" id="dia" min="1" max="31" value="<%=unCliente.getDia()%>">
                    <input class="controls2" type="number" name="mes" id="mes" min="1" max="12" value="<%=unCliente.getMes()%>">
                    <input class="controls2" type="number" name="anio" id="anio" min="1960" max="2021" value="<%=unCliente.getAnio()%>">
               </div><br>
                            
               <input class="botons" type="submit" value="Editar datos">
        <%}}%>        
                </form>         
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>              

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
                <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertModificaClienteEdad.js"></script> 


  </body>
   
</html>
