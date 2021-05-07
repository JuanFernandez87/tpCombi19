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
                    Controladora control = new Controladora();
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares(); 
             %> 		
            <form action="RegistroRuta" class="formulario-sesiones" method="post">
				<h4>Registrar ruta</h4>
                <label>Origen</label>
                <select class="controls" type="text" name="origen" placeholder="Ingrese el origen">
                        <option>Seleccione un origen</option>
                <%
                    for (Lugar origen: listaOrigen) {%>                        
                        <option value="<%=origen.getIdLugar()%>"><%=origen.getNombre()%></option>               
                 <%}%>
                </select> 
                
                <label>Destino</label><br>              
                <select class="controls" type="text" name="destino" placeholder="Ingrese el destino">               
                        <option>Seleccione un destino</option>
                <%
                    for (Lugar destino: listaDestino) {%>                        
                        <option value="<%=destino.getIdLugar()%>"><%=destino.getNombre()%></option>               
                 <%}%>       
                </select>
                
                <label>Combi</label>
                <select class="controls" type="text" name="combi">
                        <option>Seleccione una combi</option>
                <%
                    for (Combi comb: listaCombis) {%>                        
                        <option value="<%=comb.getIdCombi()%>"><%=comb.getPatente()%></option>               
                 <%}%> 
                </select>
                
                <label>Distancia</label>
                <input class="controls" type="number" name="distancia" placeholder="Ingrese distancia en Km">                
                <input class="boton" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer> 

  </body>
</html>
