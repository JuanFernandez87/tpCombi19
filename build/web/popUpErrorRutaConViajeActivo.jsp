<%@page import="Logica.Ruta"%>
<%@page import="Logica.Lugar"%>
<%@page import="Logica.Combi"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
	 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
<body>
	  <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
	<aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
            <%
                    int i = 0;
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares();
                    List <Ruta> listaRutas = control.devolverRutas();
                    Integer idOri = (Integer)session.getAttribute("idOrigen");
                    
                 Integer idDes = (Integer)session.getAttribute("idDestino");
                  Integer hora = (Integer)session.getAttribute("hora");
                 Integer minutos = (Integer)session.getAttribute("minutos");
                 Integer distancia = (Integer)session.getAttribute("distancia");
                 Integer idCombi = (Integer)session.getAttribute("idCombi");
                 String combiN= "";
                 String ori = "";
                 String des = "";
                    int idRuta = Integer.parseInt(request.getParameter("idRuta"));
                    for (Combi combi: listaCombi){
                        if(combi.getIdCombi() == idCombi){
                            combiN = combi.getPatente();
                    }
                    }
                    for(Lugar lugar: listaOrigen){
                        if(lugar.getIdLugar() == idOri){
                            ori = lugar.getNombre();
                        }
                            if (lugar.getIdLugar() == idDes){
                                des = lugar.getNombre();
                           
                        }
                    }
                  

             %> 
            <form action="ModificarRuta?idRuta=<%=idRuta%>" class="formulario-sesiones" method="post">
				<h4>Modificar ruta</h4>
                <label>Origen</label>
                <select class="controls" name="idOrigen" required id="selectOrigen">
                        <option>Seleccione un origen</option>
                <%
                    for (Lugar origen: listaOrigen) {
                        if(origen.getIdLugar() > 0){ %>                        
                        <option value="<%=origen.getIdLugar()%>"><%=origen.getNombre()%></option>               
                 <%}}%>
                </select> 
                
                <label>Destino</label>              
                <select class="controls" name="idDestino" required id="selectDestino">               
                        <option>Seleccione un destino</option>
                <%
                    for (Lugar destino: listaDestino) {
                        if(destino.getIdLugar() > 0){ %>%>                        
                        <option value="<%=destino.getIdLugar()%>"><%=destino.getNombre()%></option>               
                 <%}}%>       
                </select>
                
                <label>Combi</label>
                <select class="controls" name="idCombi" required id="selectCombi">
                        <option>Seleccione una combi</option>
                <%
                    for (i=0 ; i < listaCombis.size(); ++i) {
                         if(!listaCombis.get(i).getPatente().equals("-1")){%>                        
                        <option value="<%=listaCombis.get(i).getIdCombi()%>"><%=listaCombis.get(i).getPatente()%></option>               
                 <%}}%> 
                </select>
                <div style="display: inline;">
                <label>Horario</label>
                <input class="controls2" type="number" name="hora" required min="0" max="23" placeholder="hora" value="<%=hora%>">                
                <input class="controls2" type="numer" name="minutos" required min="0" max="59" placeholder="minutos" value="<%=minutos%>">
               </div>             
                <label>Distancia</label>
                <input class="controls" type="number" name="distancia" required placeholder="Ingrese distancia en Km" value="<%=distancia%>">       
                
                <input class="botons" type="submit" value="Modificar ruta ">
            </form>
            
            
            <script> 
        
        // CON LA SIGUIENTE SECCION SE PONE COMO SELECTED EL CIUDAD QUE SE HAYA ELEGIDO
        
         var sel = document.getElementById("selectOrigen"); // se obtiene una lista de las opciones. las opciones son los id de los choferes.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < sel.length; i++) {
             sel[i].value; // este codigo se usa con el alert nada mas, se puede eliminar y no afecta al funcionamiento.
            if(  sel[i].value === "<%=idOri%>"){
                sel[i].selected = 'selected';
            }
        }
        var sel = document.getElementById("selectDestino"); // se obtiene una lista de las opciones. las opciones son los id de los choferes.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < sel.length; i++) {
              sel[i].value;
            if(  sel[i].value === "<%=idDes%>"){
                sel[i].selected = 'selected';
            }
        }
         var sel = document.getElementById("selectCombi"); // se obtiene una lista de las opciones. las opciones son los id de los choferes.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < sel.length; i++) {
              sel[i].value;
            if(  sel[i].value === "<%=idCombi%>"){
                sel[i].selected = 'selected';
            }
        }
 
 
     </script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 <script src="js/sweetAlertRutaConViaje.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
