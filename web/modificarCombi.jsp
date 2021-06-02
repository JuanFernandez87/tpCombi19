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
	        <%
                    List <Chofer> listaChoferes = control.devolverListaChoferes(); 
                    List <Combi> listaCombis = control.devolverListaCombi(); 
                    int idCombi = Integer.parseInt(request.getParameter("idCombi"));
                    for (Combi unaCombi:listaCombis) { 
                        if(unaCombi.getIdCombi() == idCombi){ 
             %> 
             
             <form action="ModificarCombi?idCombi=<%=unaCombi.getIdCombi()%>" class="formulario-sesiones" method="post">
				<h4>Modificar combi </h4>
                <label>Dominio</label>
                <input class="controls" type="text" name="patente" value="<%=unaCombi.getPatente()%>">
                <label>Modelo</label>
                <input class="controls" type="text" name="modelo" value="<%=unaCombi.getModelo()%>">
                <label>Cantidad asientos</label>
                <input class="controls" type="number" name="cantAsientos" value="<%=unaCombi.getCantAsientos()%>">
                
                <label>Chofer</label>
                <select class="controls" name="id">
                    <option value="<%=unaCombi.getUnChofer().getIdChofer()%>"><%=unaCombi.getUnChofer().getNombre()%> <%=unaCombi.getUnChofer().getApellido()%> - <%=unaCombi.getUnChofer().getDni()%></option>
                <%
                   for (Chofer chof:listaChoferes) { 
                        if(chof.getIdCombi() == 0 && chof.getDni() >0){%>
                    <option value="<%=chof.getIdChofer()%>"><%=chof.getNombre()%> <%=chof.getApellido()%> - <%=chof.getDni()%></option>
                 <%}}%>  
                </select>
                
                 <label>Seleccione tipo de servicio</label>                 
                 <select class="controls" name="servicio">
                     <option><%=unaCombi.getTipoServicio()%></option>
                     <option>Comoda</option>
                     <option>Super comoda</option>
                 </select>
         
                
                <input class="botons" type="submit" value="Modificar">
                <%}}%> 
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

<%@include file="/template/footer.jsp"%>

  </body>
   
</html>
