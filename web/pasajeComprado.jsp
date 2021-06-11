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
    </head>
    
    <body style="background-image: url('images/montañaIndex.jpg')">
        <header>
            <%@include file="/template/header.jsp"%>
        </header>
            <%
                Controladora control = new Controladora();
                List <Insumo> listaInsumos = control.devolverListaInsumos();
                %>
        
        <div class="divCompra">
            <form class="formularioCompra" action="ComprarPasaje" method="POST"> 
          <h1>Compra de pasajes </h1>
          <h2> <i class="fas fa-apple-alt"></i> Insumos para agregar a su viaje</h2>
                <%
                    String nombreInsumo="vacio";
                    int i=0;
                    for (Insumo insumo: listaInsumos) {
                        if (insumo.getPrecio() != -1){
                            i=i+1;
                            nombreInsumo = insumo.getNombre();%>                        
                        <fieldset><i class="icono far fa-arrow-alt-circle-right"></i> <p> <%=nombreInsumo%></p> 
          <input class="insumoCompra " type="number" name="<%=i%>" required min="0" placeholder="0">             
                 <%}%></fieldset><%}%>       
                
          
          <fieldset>
              <p><i class="icono far fa-credit-card"></i> Con que tarjeta desea pagar? </p>
              <select class="insumoCompra" name="tarjeta" id="selectTarjetaPago"> 
              <option> Mi tarjeta registrada </option>
              <option> Otra tarjeta</option>
          </select>
          </fieldset>
          <fieldset>
         <i class="icono far fa-list-alt"></i></i> <p> Cantidad de pasajes a comprar</p> 
          <input class="insumoCompra " type="number" name="cantPasajes" required min="0" placeholder="0">
          </fieldset>

          <input class="botons" type="submit" value="Comprar">

        </form>
         </div>
     
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertCompraPasajeExitosa.js"></script>
                
    </body>
</html>