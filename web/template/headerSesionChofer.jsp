<%@page import="Logica.Chofer"%>
<%@page import="Logica.Controladora"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>   
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">      
    </head>
    
    <body>
        <header>
	    <%
                Controladora control = new Controladora();
                String usuario = (String)session.getAttribute("username");
                String tipo = (String)session.getAttribute("tipo");
                List <Chofer> listaChoferes = control.devolverListaChoferes(); 
                for (Chofer unChofer:listaChoferes){
                    if (unChofer.getMail().equals(usuario)){
            %>  

            <a>Bienvenido <%=unChofer.getNombre()%> <%=unChofer.getApellido()%></a> <br>
            <a>(<%=tipo%>)</a>  
            <%}}%>
            <div class="contenidoHeader">
                <div class="logo"><img src="./images/logo.png" alt=""> Combi 19</div>    
                <nav>
                    <a href="index.jsp"><i class="fas fa-home"></i>Inicio</a>
                    <a href="modificarCliente.jsp?usuario=<%=usuario%>"><i class="fas fa-address-book"></i>Mi información</a>                    
                    <a href="sesionAdminCierre.jsp"><i class="icono izquierda fas fa-sign-out-alt"></i>Cerrar sesion</a>
                </nav>
            </div>   
             
        </header>  
    <body>   
</html>
