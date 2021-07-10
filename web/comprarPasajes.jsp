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
    <link rel="stylesheet" href="css/styles.css" >
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilosRegistro.css">  
</head>

<body style="background-image: url('images/montañaIndex.jpg')">

            <header>
        <div class="contenidoHeader">
            <div class="logo"><img src="./images/logo.png" alt=""> Combi 19</div>    
            <nav>
                <a href="index.jsp"><i class="fas fa-home"></i>Inicio</a>
                <a href="sesionUsuario.jsp"><i class="fas fa-user"></i>Mi cuenta</a>
                <a href="#"><i class="fas fa-address-book"></i>Contacto</a>
            </nav>
        </div>
    </header> 
        <div>
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
                    
                 List <Cliente> listaClientes= control.devolverListaClientes();
                List <Chofer> listaChofer= control.devolverListaChoferes();

                List <Lugar> listaLugar= control.devolverListaLugares(); 

                List <Combi> listaCombi= control.devolverListaCombi(); 

                List <Ruta> listaRuta= control.devolverRutas(); 
                 
          
            List <Viaje> listaViajes = control.devolverListaViajes();
            List <Ruta> listaRutas = control.devolverRutas();
            List <Lugar> listaLugares = control.devolverListaLugares();
            boolean esGold = false;
            for (Cliente cliente: listaClientes){
                if(cliente.getIdCliente() == (Integer)request.getAttribute("idCliente")){
                    if(cliente.getTipoPlan().equals("Gold")){
                        esGold = true;
                    }
                }
            }
            %>
               
            
        <div class="divCompra">
            <form class="formularioCompra" action="ComprarPasaje" method="POST" onSubmit = "return checkForm(event)"> 
                 
                <h1>Compra de pasajes </h1>
                <input type="hidden" name="idCompraCliente" value="<%= request.getAttribute("idCliente") %>"> </input>
                <input type="hidden" name="idCompraViaje" value="<%= request.getAttribute("idViaje") %>"> </input>
                <input type="hidden" name="precioTotal" id="precioTotal" value=""> </input>
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
          
          
          
          
          <div  style="background:#266aa7; display:none " class="checkoutCompra" id="checkoutCompra">
  <div  class="credit-card-box">
    <div class="flip">
      <div class="front">
        <div class="chip"></div>
        <div class="logo">
          <svg version="1.1" id="visa" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="47.834px" height="47.834px" viewBox="0 0 47.834 47.834" style="enable-background:new 0 0 47.834 47.834;">
            <g>
              <g>
                <path d="M44.688,16.814h-3.004c-0.933,0-1.627,0.254-2.037,1.184l-5.773,13.074h4.083c0,0,0.666-1.758,0.817-2.143
                         c0.447,0,4.414,0.006,4.979,0.006c0.116,0.498,0.474,2.137,0.474,2.137h3.607L44.688,16.814z M39.893,26.01
                         c0.32-0.819,1.549-3.987,1.549-3.987c-0.021,0.039,0.317-0.825,0.518-1.362l0.262,1.23c0,0,0.745,3.406,0.901,4.119H39.893z
                         M34.146,26.404c-0.028,2.963-2.684,4.875-6.771,4.875c-1.743-0.018-3.422-0.361-4.332-0.76l0.547-3.193l0.501,0.228
                         c1.277,0.532,2.104,0.747,3.661,0.747c1.117,0,2.313-0.438,2.325-1.393c0.007-0.625-0.501-1.07-2.016-1.77
                         c-1.476-0.683-3.43-1.827-3.405-3.876c0.021-2.773,2.729-4.708,6.571-4.708c1.506,0,2.713,0.31,3.483,0.599l-0.526,3.092
                         l-0.351-0.165c-0.716-0.288-1.638-0.566-2.91-0.546c-1.522,0-2.228,0.634-2.228,1.227c-0.008,0.668,0.824,1.108,2.184,1.77
                         C33.126,23.546,34.163,24.783,34.146,26.404z M0,16.962l0.05-0.286h6.028c0.813,0.031,1.468,0.29,1.694,1.159l1.311,6.304
                         C7.795,20.842,4.691,18.099,0,16.962z M17.581,16.812l-6.123,14.239l-4.114,0.007L3.862,19.161
                         c2.503,1.602,4.635,4.144,5.386,5.914l0.406,1.469l3.808-9.729L17.581,16.812L17.581,16.812z M19.153,16.8h3.89L20.61,31.066
                         h-3.888L19.153,16.8z" />
              </g>
            </g>
          </svg>
        </div>
        <div class="number"></div>
        <div class="card-holder">
            <label style="background: none ">Card holder</label>
          <div></div>
        </div>
        <div class="card-expiration-date">
          <label style="background: none ">Expires</label>
          <div></div>
        </div>
      </div>
      <div class="back">
        <div class="strip"></div>
        <div class="logo">
          <svg version="1.1" id="visa" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="47.834px" height="47.834px" viewBox="0 0 47.834 47.834" style="enable-background:new 0 0 47.834 47.834;">
            <g>
              <g>
                <path d="M44.688,16.814h-3.004c-0.933,0-1.627,0.254-2.037,1.184l-5.773,13.074h4.083c0,0,0.666-1.758,0.817-2.143
                         c0.447,0,4.414,0.006,4.979,0.006c0.116,0.498,0.474,2.137,0.474,2.137h3.607L44.688,16.814z M39.893,26.01
                         c0.32-0.819,1.549-3.987,1.549-3.987c-0.021,0.039,0.317-0.825,0.518-1.362l0.262,1.23c0,0,0.745,3.406,0.901,4.119H39.893z
                         M34.146,26.404c-0.028,2.963-2.684,4.875-6.771,4.875c-1.743-0.018-3.422-0.361-4.332-0.76l0.547-3.193l0.501,0.228
                         c1.277,0.532,2.104,0.747,3.661,0.747c1.117,0,2.313-0.438,2.325-1.393c0.007-0.625-0.501-1.07-2.016-1.77
                         c-1.476-0.683-3.43-1.827-3.405-3.876c0.021-2.773,2.729-4.708,6.571-4.708c1.506,0,2.713,0.31,3.483,0.599l-0.526,3.092
                         l-0.351-0.165c-0.716-0.288-1.638-0.566-2.91-0.546c-1.522,0-2.228,0.634-2.228,1.227c-0.008,0.668,0.824,1.108,2.184,1.77
                         C33.126,23.546,34.163,24.783,34.146,26.404z M0,16.962l0.05-0.286h6.028c0.813,0.031,1.468,0.29,1.694,1.159l1.311,6.304
                         C7.795,20.842,4.691,18.099,0,16.962z M17.581,16.812l-6.123,14.239l-4.114,0.007L3.862,19.161
                         c2.503,1.602,4.635,4.144,5.386,5.914l0.406,1.469l3.808-9.729L17.581,16.812L17.581,16.812z M19.153,16.8h3.89L20.61,31.066
                         h-3.888L19.153,16.8z" />
              </g>
            </g>
          </svg>

        </div>
        <div class="ccv">
          <label style="background: none ">CCV</label>
          <div></div>
        </div>
      </div>
    </div>
        <%String idCliente = request.getParameter("idCliente");%>
  </div>
  <form style="background: #24303c;width: 100%;"  action="javascript:void(0);"  method="GET" class="form" autocomplete="off" novalidate onSubmit = "return cargarTarjeta(event)">
      <h4>Ingrese datos de la tarjeta con la que realizara el pago.</h4>
       <fieldset id="field">
      <label style="color:white"  for="card-number">Numero de tarjeta</label>
      <input style="width: 20% ;border: 1px solid #1f53c5;background: none;color: white" type="num" name="num1" id="card-number" class="input-cart-number" minlength="4" maxlength="4" onkeypress="return solonumeros(event)" requiered/>
      <input style="width: 20% ;border: 1px solid #1f53c5;background: none;color: white" type="num" name="num2" id="card-number-1" class="input-cart-number" minlength="4" maxlength="4" onkeypress="return solonumeros(event)" requiered/>
      <input style="width: 20% ;border: 1px solid #1f53c5;background: none;color: white" type="num" name="num3" id="card-number-2" class="input-cart-number" mixlength="4" maxlength="4" onkeypress="return solonumeros(event)" requiered/>
      <input style="width: 20% ;border: 1px solid #1f53c5;background: none;color: white" type="num" name="num4" id="card-number-3" class="input-cart-number" mixlength="4" maxlength="4" onkeypress="return solonumeros(event)" requiered/>
    </fieldset>
    <fieldset>
      <label  style="color:white" for="card-holder">Titular</label>
      <input style="border: 1px solid #1f53c5;background: none;color: white" type="text" name="nombre" id="card-holder" />
    </fieldset>
    <fieldset class="fieldset-expiration">
      <label  style="color:white" for="card-expiration-month">Fecha de vencimiento</label>
      <div  style="width: 40% ;border: 1px solid #1f53c5;background: none;" class="select">
        <select class= "controls2" id="card-expiration-month" name="mes">
          <option class= "controls2"></option>
          <option class= "controls2">01</option>
          <option class= "controls2">02</option>
          <option class= "controls2">03</option>
          <option class= "controls2">04</option>
          <option class= "controls2">05</option>
          <option class= "controls2">06</option>
          <option class= "controls2">07</option>
          <option class= "controls2">08</option>
          <option class= "controls2">09</option>
          <option class= "controls2">10</option>
          <option class= "controls2">11</option>
          <option class= "controls2">12</option>
        </select>
      </div>
      <div  style="width: 40% ;border: 1px solid #1f53c5;background: none;" class="select">
        <select class= "controls2" id="card-expiration-year" name="anio">
          <option class= "controls2"></option>
          <option class= "controls2">2021</option>
          <option class= "controls2">2022</option>
          <option class= "controls2">2023</option>
          <option class= "controls2">2024</option>
          <option class= "controls2">2025</option>
          <option class= "controls2">2026</option>
        </select>
      </div>
    </fieldset>
    <fieldset class="fieldset-ccv">
      <label  style="color:white" for="card-ccv">CCV</label>
      <input style="border: 1px solid #1f53c5;background: none;color:white;" type="text" name="codigo" id="card-ccv" minlength="3" maxlength="3" requiered/>
    </fieldset>
    <button class="botons"><i style="color:white;background: none;color: white;"  onclick=" return cargarTarjeta(evento)"></i> Aceptar </button>
    <a class="botons" type="submit" value="Cancelar y volver" href="#" style="width: 100%;
    background: #1f53c5;
    border: none;
    padding: 12px;
    color: white;
    margin: 5px 0;
    font-size: 16px;
    text-decoration: none;
    text-transform: uppercase;
    text-align: center;" onclick="cancelarCarga()"> Cancelar</a>
   
  </form>
</div>
    
    
    </div>
     
       
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            let anio = document.getElementById("card-expiration-year").value;
            let mes = document.getElementById("card-expiration-month").value;
            // si al momento de cargar la tarjeta, los datos son validos entonces se oculta el formulario para que se pueda efectuar la compra.
                if((document.getElementById("card-ccv").value.length === 3)&&
                   ((document.getElementById("card-number").value.length === 4) && (document.getElementById("card-number-1").value.length === 4) 
                            && (document.getElementById("card-number-2").value.length === 4) && (document.getElementById("card-number-3").value.length === 4))
                          &&(!document.getElementById("card-holder").value !== "")&& (document.getElementById("card-expiration-year").value >= 2021)){
                      //si la fecha es 2021 verifica que el mes sea mayor al actual. sino informa tarjeta invalida.
                      // si la fecha es menor que la actual entonces informa error. sino acepta la tarjeta como valida.
                      if(anio === "2021"){
                          if(mes < "07"){
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
            function descuentoGold(precioPagar){
                let descuento = 1.0;
                descuento = precioPagar * 0.9;
                if(<%=esGold%> === false){
                     (alert("Se aplicara descuento de 10% por ser usuario Gold. \n\
                            Precio total con descuento:$ "+ descuento));
                }
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
                             descuentoGold.call(this,precioPagar);
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
                
    </body>
     <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
</html>