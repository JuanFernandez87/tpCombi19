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
    </head>
    
    <body style="background-image: url('images/montañaIndex.jpg')">
        <header>
            <%@include file="/template/header.jsp"%>
        </header>
            <%
                Controladora control = new Controladora();
                List <Insumo> listaInsumos = control.devolverListaInsumos();
                String prueba= "esto es la prueba";
        int tamaño = 0;
        String index = "";
        // obtenemos la cantidad elegida de cada insumo.
        // el primer insumo se referencia con el valor 1; el segundo con 2...etc.
        for (Insumo insumo:listaInsumos){
            if(insumo.getPrecio() != -1){
                 tamaño=tamaño+1;
            }
        }
        
        String[] itemsArray = new String[listaInsumos.size()];
        itemsArray[1]= "1";
        

                 
                 List <Cliente> listaClientes= control.devolverListaClientes();
                List <Chofer> listaChofer= control.devolverListaChoferes();

                List <Lugar> listaLugar= control.devolverListaLugares(); 

                List <Combi> listaCombi= control.devolverListaCombi(); 

                List <Ruta> listaRuta= control.devolverRutas(); 
                 
          
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Lugar> listaLugares = control.devolverListaLugares();
            %>
               
        
        <div class="divCompra">
            <form class="formularioCompra" action="ComprarPasaje" method="POST" onSubmit = "return checkForm(event)"> 
                 
                <h1>Compra de pasajes </h1>
                <input type="hidden" name="idCompraCliente" value="<%= request.getAttribute("idCliente") %>"> </input>
                <input type="hidden" name="idCompraViaje" value="<%= request.getAttribute("idViaje") %>"> </input>
          <h2> <i class="fas fa-apple-alt"></i> Insumos para agregar a su viaje</h2>
                <%
                    String nombreInsumo="vacio";
                    int i=0;
                    for (Insumo insumo: listaInsumos) {
                        if (insumo.getPrecio() != -1){
                            i=i+1;
                            nombreInsumo = insumo.getNombre();%>                        
                        <fieldset><i class="icono far fa-arrow-alt-circle-right"></i> <p> <%=nombreInsumo%></p> 
          <input class="insumoCompra" type="number" name="<%=insumo.getPrecio()%>" id="<%=i%>" required  min="0" value="0" >             
                 <%}%></fieldset><%}%>       
                
          
          <fieldset>
              <p><i class="icono far fa-credit-card"></i> Con que tarjeta desea pagar?</p>
              <select class="insumoCompra" name="tarjeta" id="selectTarjetaPago"> 
              <option> Mi tarjeta registrada </option>
              <option> Otra tarjeta</option>
          </select>
          </fieldset>
          <fieldset>
              <%
                  int maxPasajes = 0;
                  int precio=0;
                  Integer variable = (Integer)request.getAttribute("idViaje");
                 // int idVia = (Integer)request.getAttribute("idViaje");
                  for (Viaje viaje:listaViajes){
                     if(viaje.getIdViaje() == (Integer)request.getAttribute("idViaje")){
                          maxPasajes = viaje.getCantAsientos();
                          precio = viaje.getPrecio();
                      }
                  }
              %>
         <i class="icono far fa-list-alt"></i></i> <p> Cantidad de pasajes a comprar</p> 
          <input class="insumoCompra " type="number" name="cantPasajes" id="cantPasajes" required min="1" max="<%=maxPasajes%>" placemaxPasajes%>  Disponibles:<%=maxPasajes%>
          </fieldset>

          <input class="botons" type="submit" name="cantidadPasajes" value="Comprar" onSubmit = "return checkForm(event)">
           <a class="cyb" type="submit" value="Cancelar y volver" href="ListadoBusquedaViaje.jsp"> Cancelar y volver al listado</a>

        </form>
         </div>
     
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <SCRIPT> 
            function aviso(){
          swal.fire({
                         text: "No quedan mas asientos disponibles.",
                         icon: 'error',
                         cancelButtonColor: '#d33',
                        showConfirmButton:false,
                        footer:`<a class="btn btn-primary" href="index.jsp">Confirmar</a>`
                        });  
        }
function checkForm(e) { 
   
    var fin=<%=tamaño%> +1;
    var total = 0;
    var insumos;
    var totalPasaje;
    var precioPasaje = <%=precio%>;
    var precioPagar= 0;
    for(var i = 1; i < fin; i ++){
        x =document.getElementById(i);
        insumos =(x.value * x.name);
        total = total + insumos;
        x.setAttribute("name",i);
    }
    totalPasaje = precioPasaje * document.getElementById("cantPasajes").value;
    precioPagar = total + totalPasaje;

    var asi=<%=maxPasajes%>;
                    if(asi === 0){
                        aviso.call();
                        e.returnValue = false;
                    }else{
                        if ((window.confirm("Desea realizar la compra por el precio: $"+ precioPagar))){
                         e.returnValue = true;           
                   }else{
                       e.returnValue = false;
                        } 
                        }
 }
        

</SCRIPT>
                
    </body>
</html>