<%@page import="Logica.Viaje"%>
<%@page import="Logica.Combi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Chofer"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="icon" href="images/logoCombi19.png" type="image/png" />
    <title>Combi 19</title>      
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
    <title> Menu lateral </title> 
    <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="css/sesiones.css" >
	 
    <link rel="stylesheet" type="css/fonts.css" href="">
</head>
<body>
        <%@include file="/template/headerSesiones.jsp"%>
	
        <%@include file="/template/aside.jsp"%>
		
            <form action="EliminarChofer" class="formulario-sesiones" method="post">
				<h4>Eliminar</h4>
            <%
                    Controladora control = new Controladora();
                    List <Chofer> listaChoferes = control.devolverListaChoferes();
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    List <Viaje> listaViajes = control.devolverListaViajes(); 
             %> 
                
             <label> Chofer</label>
                <select class="controls" name="idChofer" required>
                    <option>Seleccione un chofer</option>
                <%
                   for (Chofer chof: listaChoferes) { 
                        //if(chof.getIdCombi() == 0){%>
                    <option value="<%=chof.getIdChofer()%>"><%=chof.getNombre()%> <%=chof.getApellido()%> - <%=chof.getDni()%></option>
                 <%}/*}*/%>  
                </select>
                
                <%-- <label>Combi</label>
                <select class="controls" name="idCombi" required>
                        <option>Seleccione una combi</option>
                <%
                    for (Combi comb: listaCombis) {%>                        
                        <option value="<%=comb.getPatente()%>"><%=comb.getPatente()%></option>               
                 <%}%> 
                </select> 
                
                <label>Viaje</label>
                <select class="controls" name="idViaje" required>
                        <option>Seleccione un viaje</option>
                <%
                    for (Viaje viaje: listaViajes) {%>                        
                        <option value="<%=viaje.getIdViaje()%>"><%=viaje.getIdViaje()%></option>               
                 <%}%> 
                </select>     --%>            
                
                <input class="boton" type="submit" value="Dar de baja">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="js/sweetAlertBorrar.js"></script>

<%@include file="/template/footer.jsp"%>

  </body>
   
</html>