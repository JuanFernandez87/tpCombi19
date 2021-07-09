<%@page import="Logica.Pasaje"%>
<%@page import="Logica.Viaje"%>
<%@page import="Logica.Ruta"%>
<%@page import="Logica.Combi"%>
<%@page import="Logica.Lugar"%>
<%@page import="Logica.Chofer"%>
<%@page import="Logica.Cliente"%>
<%@page import="Logica.Controladora"%>
<%@page import="Logica.Insumo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
         <link rel="stylesheet" href="css/registroDeTarjeta.css">
    </head>
    
    <body style="background-image: url('images/montañaIndex.jpg')">
        <header>
            <%@include file="/template/header.jsp"%>
        </header>
            
        <div>
            <form action="crearPasajeAcompaniante" method="POST"
                style="position: absolute;
    width: 500px;
    padding: 37px;
    margin: auto;
    border-radius: 4px;
    font-family: 'calibri';
    color: white;
    box-shadow: 7px 13px 37px #000;
    margin-left: 512px;
    margin-top: 115px;">
                
                 <input type="hidden" name="idCompraCliente" value="<%= request.getAttribute("idClienteComprado") %>"> </input>
                <input type="hidden" name="idCompraViaje" value="<%= request.getAttribute("idViajeComprado") %>"> </input>
                <input type="hidden" name="cantPasajes" id="precioTotal" value="<%= request.getAttribute("cantPasajes") %>"> </input>
                
                <h1> Ingrese los datos de los acompañantes</h1>                         
                <% for(int i = 1; i <= (Integer)request.getAttribute("cantPasajes"); i++){%>
                <fieldset style="min-width: 0;
    padding: 9px;
    margin: 19px;
    border: double;">
                    <h4 style="display: list-item">Datos para pasaje <%=i%></h4>
                    <label for="nombre<%=i%>"> Nombre</label>
                    <input class="acompañante" type="text" name="nombre<%=i%>" id="nombre<%=i%>" required>
                    <br>
                    <label for="nombre<%=i%>"> Apellido</label>
                    <input class="acompañante" type="text" name="apellido<%=i%>" id="apellido<%=i%>" required>
                    <br>
                    <label for="nombre<%=i%>"> Dni</label>
                    <input class="acompañante" type="text" name="dni<%=i%>" id="dni<%=i%>" required> 
                </fieldset>
                <%}%>
                <input class="botons" type="submit" name="registrar" id="registrar" value="Registrar">
            </form>
        </div>
    </body>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
            swal.fire({
                        title: "Debe ingresar informacion sobre acompañantes.",
                         icon: 'success',
                         cancelButtonColor: '#d33',
                        showConfirmButton:true,
                        confirmButtonText: "Confirmar"
                        });  
    </script>
     <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>