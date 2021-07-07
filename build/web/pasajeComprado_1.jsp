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
                <input type="hidden" name="idCompraCliente" value="<%= request.getAttribute("idClienteComprado") %>"> </input>
                <input type="hidden" name="idCompraViaje" value="<%= request.getAttribute("idViajeComprado") %>"> </input>
          <h2> <i class="fas fa-apple-alt"></i> Insumos para agregar a su viaje</h2>
                <%
                    String nombreInsumo="vacio";
                    int i=0;
                    for (Insumo insumo: listaInsumos) {
                        if (insumo.getPrecio() != -1){
                            i=i+1;
                            nombreInsumo = insumo.getNombre();%>                        
                        <fieldset><i class="icono far fa-arrow-alt-circle-right"></i> <p> <%=nombreInsumo%></p> 
          <input class="insumoCompra" type="number" name="<%=insumo.getPrecio()%>" id="<%=i%>" required min="0" value="0" >             
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
                  int precio = 0;
                 // Integer variable = (Integer)request.getAttribute("idViaje");
                 // int idVia = (Integer)request.getAttribute("idViaje");
                  for (Viaje viaje:listaViajes){
                     if(viaje.getIdViaje() == (Integer)request.getAttribute("idViajeComprado")){
                          maxPasajes = viaje.getCantAsientos();
                          precio = viaje.getPrecio();
                      }
                  }
              %>
         <i class="icono far fa-list-alt"></i></i> <p> Cantidad de pasajes a comprar</p> 
          <input class="insumoCompra " type="number" name="cantPasajes" id="cantPasajes" required min="1" max="<%=maxPasajes%>"  >  Disponibles:<%=maxPasajes%>
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
            function solonumeros(e){
                key = e.keycode || e.which;
                teclado= String.fromCharCode(key);
                numeros= "0123456789";
                especiales = "8-37-38-46";
                teclado_especial = false;
                for (var i in especiales){
                    if (key=== especiales[i]){
                        teclado_especial = true;
                    }
                }
                if (numeros.indexOf(teclado)=== -1 && !teclado_especial){
                    return false;
                }
            }
            function aviso(){
          swal.fire({
                         text: "No quedan mas asientos disponibles.",
                         icon: 'error',
                         cancelButtonColor: '#d33',
                        showConfirmButton:false,
                        footer:`<a class="btn btn-primary" href="index.jsp">Confirmar</a>`
                        });  
        }
        function tarjetaInvalida(){
          swal.fire({
                        title: "Debe ingresar datos de una tarjeta valida.",
                         icon: 'error',
                         cancelButtonColor: '#d33',
                        showConfirmButton:true,
                        confirmButtonText: "Confirmar"
                        });  
        }
        function cargarTarjeta(e){
            // si al momento de cargar la tarjeta, los datos son validos entonces se oculta el formulario para que se pueda efectuar la compra.
                if((document.getElementById("card-ccv").value.length === 3)&&
                   ((document.getElementById("card-number").value.length === 4) && (document.getElementById("card-number-1").value.length === 4) 
                            && (document.getElementById("card-number-2").value.length === 4) && (document.getElementById("card-number-3").value.length === 4))
                          &&(!document.getElementById("card-holder").value !== "")&& (document.getElementById("card-expiration-year").value >= 2021)){
                      //si la fecha es 2021 verifica que el mes sea mayor al actual. sino informa tarjeta invalida.
                      // si la fecha es menor que la actual entonces informa error. sino acepta la tarjeta como valida.
                      if(document.getElementById("card-expiration-year").value === 2021){
                          if(document.getElementById("card-expiration-month").value < 07){
                              tarjetaInvalida.call();
                          }else{
                               $('#checkoutCompra').hide();
                             $('.formularioCompra').removeClass("formularioCompraOculto");
                            // luego de cargado el formulario y presionado el boton "aceptar" se oculta el formulario de tarjeta.
                             $('[type=submit]').trigger('click'); // dsps de ocultar el formulario se acciona el boton "comprar" del formulario de compra para invocar al servlet y efectuar la compra.
                          }
                      }else{
                           $('#checkoutCompra').hide();
                             $('.formularioCompra').removeClass("formularioCompraOculto");
                            // luego de cargado el formulario y presionado el boton "aceptar" se oculta el formulario de tarjeta.
                             $('[type=submit]').trigger('click'); // dsps de ocultar el formulario se acciona el boton "comprar" del formulario de compra para invocar al servlet y efectuar la compra.
                    
                      }
                  }else{
                   tarjetaInvalida.call();
                }
                e.returnValue= false;
        }
        function tarjetaCargada(){
            //comprueba que se haya registrado una tarjeta valida.
            //si la tarjeta no fue ingresada y se selecciono "otra tarjeta" muestra en pantalla el formulario para cargar una nueva
            if( document.getElementById("selectTarjetaPago").value=== "Otra tarjeta" ){
                if(document.getElementById("card-ccv").value.length === 3){
                    return true;
                }else{
                 $('.formularioCompra').addClass("formularioCompraOculto");
                    $('#checkoutCompra').show();
                   return false;
                }
                          
                      }
        }
        function cancelarCarga(){
                 $('#checkoutCompra').hide();
                  $('.formularioCompra').removeClass("formularioCompraOculto");
                  $('.formularioCompra').addClass("formularioCompra");
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
                         document.getElementById("precioTotal").value = precioPagar;
                         //si se cargo una tarjeta nueva para el pago entonces se efectua la compra. Sino se cancela hasta que se cargue la tarjeta.
                         if(document.getElementById("selectTarjetaPago").value === "Mi tarjeta registrada"){
                             e.returnValue= true;
                         }else{
                             if(tarjetaCargada.call()){
                             e.returnValue = true;
                            }else{
                             e.returnValue = false;
                            }        
                        }
                        }else{
                       e.returnValue = false;
                        } 
 }
 }
        

</SCRIPT>
        <script src="js/sweetAlertCompraPasajeExitosa.js"></script>

                
    </body>
</html>