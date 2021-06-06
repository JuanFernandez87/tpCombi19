<%@page import="Logica.Ruta"%>
<%@page import="Logica.Combi"%>
<%@page import="Logica.Lugar"%>
<%@page import="Logica.Lugar"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" />
    <title>Combi 19</title>      
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
	 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
   <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>

	<aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
            <%
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares();
                    List <Ruta> listaRutas = control.devolverRutas();
                    
                 Integer dia = (Integer)session.getAttribute("dia");                 
                 Integer mes = (Integer)session.getAttribute("mes");
                  Integer anio = (Integer)session.getAttribute("anio");
                 Integer precio = (Integer)session.getAttribute("precio");
                 Integer idRuta = (Integer)session.getAttribute("idRuta");
                
             %>         
		
            <form action="RegistroViaje" class="formulario-sesiones" method="post">
				<h4>Registrar viaje </h4>
                <label>Ruta</label>
                <select class="controls" name="idRuta" required id="selectRuta">
                        <option>Seleccione una ruta</option>
                <%for (Ruta ruta: listaRutas) {
                    if(ruta.getDistancia()>0){%>                        
                        <option value="<%=ruta.getIdRuta()%>">
                            <%for (Lugar lugar:listaOrigen){
                                if(lugar.getIdLugar() == ruta.getOrigen()){%>
                                  <%=lugar.getNombre()%><%}%><%}%>
                                    -
                            <%for (Lugar lugar2:listaDestino){
                                if(lugar2.getIdLugar() == ruta.getDestino()){%>
                                  <%=lugar2.getNombre()%><%}%><%}%>
                                    -
                            <%for (Combi combi:listaCombis){
                                if(combi.getIdCombi() == ruta.getIdCombi()){%>
                                  <%=combi.getPatente()%><%}%><%}%>                                  
                                   
                        </option>               
                              
                 <%}}%> 
                </select> 
                <b for="start">Ingrese la fecha</b>
                <div class="fecha">
                    <input class="controls2" type="number" name="dia" required id="dia" min="1" max="31" placeholder="Dia" value="<%=dia%>">
                    <input class="controls2" type="number" name="mes" required id="mes" min="1" max="12" placeholder="Mes" value="<%=mes%>">
                    <input class="controls2" type="number" name="anio" required id="anio" min="2021" max="2025" placeholder="Año" value="<%=anio%>">
                </div>
                <label>Ingrese el precio</label>
                <input class="controls" type="number" name="precio" required placeholder="0" value="<%=precio%>">                 
                <input class="botons" type="submit" value="Cargar viaje">
            </form>
                
                
                 <script> 
        
        // CON LA SIGUIENTE SECCION SE PONE COMO SELECTED EL CIUDAD QUE SE HAYA ELEGIDO
        
         var sel = document.getElementById("selectRuta"); // se obtiene una lista de las opciones. las opciones son los id de las rutas.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < sel.length; i++) {
             sel[i].value; // este codigo se usa con el alert nada mas, se puede eliminar y no afecta al funcionamiento.
            if(  sel[i].value === "<%=idRuta%>"){
                sel[i].selected = 'selected';
            }
        }
        </script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertViajeRepetido.js"></script>

</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    

</html>
