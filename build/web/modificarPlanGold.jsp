<%@page import="Logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/registroDeTarjeta.css" >
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
    </head>

<body>
   
        <header>
            <%@include file="/template/headerSesionUsuario.jsp"%>
        </header>
	
       
        <aside>
            <%@include file="/template/asideUsuario.jsp"%>
        </aside>  
        
          
            
 <div style="padding-top: 90px;"></div>
 <div style="background:#266aa7;" class="checkout">
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
     <form style="background: #24303c;width: 100%;" action="RegistroTarjetaBasico?idCliente=<%=idCliente%>" class="form" autocomplete="off" novalidate  method="post" onSubmit = "return cargarTarjeta(event)">
    <fieldset>
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
    <button class="botons" onclick=" return cargarTarjeta(evento)"><i style="color:white;background: none;color: white;" class="fa fa-lock" ></i> Enviar</button>
  </form>
</div>

<a class="the-most" target="_blank">
  <link rel="icon" href="images/logoCombi19" />
</a>
    
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
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
            let anio = document.getElementById("card-expiration-year").value;
            let mes = document.getElementById("card-expiration-month").value;
                if((document.getElementById("card-ccv").value.length === 3)&&
                   ((document.getElementById("card-number").value.length === 4) && (document.getElementById("card-number-1").value.length === 4) 
                            && (document.getElementById("card-number-2").value.length === 4) && (document.getElementById("card-number-3").value.length === 4))
                          &&(!document.getElementById("card-holder").value !== "")&& (document.getElementById("card-expiration-year").value >= 2021)){
                      //si la fecha es 2021 verifica que el mes sea mayor al actual. sino informa tarjeta invalida.
                      // si la fecha es menor que la actual entonces informa error. sino acepta la tarjeta como valida.
                      if(anio === "2021"){
                          if( mes < "07"){
                              tarjetaInvalida.call();
                              e.returnValue = false;
                          }else{
                               $('#checkoutCompra').hide();
                             $('.formularioCompra').removeClass("formularioCompraOculto");
                            // luego de cargado el formulario y presionado el boton "aceptar" se oculta el formulario de tarjeta.
                             $('[type=submit]').trigger('click'); // dsps de ocultar el formulario se acciona el boton "comprar" del formulario de compra para invocar al servlet y efectuar la compra.
                             e.returnValue = true;
                }
                      }else{
                           $('#checkoutCompra').hide();
                             $('.formularioCompra').removeClass("formularioCompraOculto");
                             
                            // luego de cargado el formulario y presionado el boton "aceptar" se oculta el formulario de tarjeta.
                             $('[type=submit]').trigger('click'); // dsps de ocultar el formulario se acciona el boton "comprar" del formulario de compra para invocar al servlet y efectuar la compra.
                             e.returnValue = true;
                      }
                  }else{
                     
                   tarjetaInvalida.call();
                   e.returnValue = false;
                   
                }
        }
       </script>   
    <script src="js/registroDeTarjeta.js"></script>  
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        


  </body>
   
</html>
