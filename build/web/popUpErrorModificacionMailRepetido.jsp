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


            <form action="ModificarCliente?idCliente=<%=unCliente.getIdCliente()%>" method="post">
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

                <label>Tipo de plan</label>
                        <select class="controls" name="tipoPlan">
                            <option><%=unCliente.getTipoPlan()%></option>
                            <option>Basico</option>
                            <option>Gold</option>
                        </select>
               <input class="botons" type="submit" value="Editar datos">
        <%}}%>        
                </form>         
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script> 
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertMail.js"></script>        

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        


  </body>
   
</html>
