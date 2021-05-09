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
		
            <form action="RegistroCombi" class="formulario-sesiones" method="post">
				<h4>Registrar combi </h4>
                <label> Dominio</label>
                <input class="controls" type="text" name="patente" required placeholder="AA000AA">
                <label> Modelo</label>
                <input class="controls" type="text" name="modelo" required placeholder="Ingrese modelo">
                <label> Cantidad asientos</label>
                <input class="controls" type="number" name="cantAsientos" required placeholder="0">
            <%
                    Controladora control = new Controladora();
                    List <Chofer> listaChoferes = control.devolverListaChoferes(); 
             %> 
                
                <label> Chofer</label>
                <select class="controls" name="id" required>
                    <option>Seleccione un chofer</option>
                <%
                   for (Chofer chof: listaChoferes) { 
                        if(chof.getIdCombi() == 0){%>
                    <option value="<%=chof.getIdChofer()%>"><%=chof.getNombre()%> <%=chof.getApellido()%> - <%=chof.getDni()%></option>
                 <%}}%>  
                </select>
                
                 <label> Seleccione tipo de servicio</label>
                        <select class="controls" name="servicio" required>
                            <option>Comoda</option>
                            <option>Super comoda</option>
                        </select>
                
                <input class="botons" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertChoferAsignado.js"></script>

<%@include file="/template/footer.jsp"%>

  </body>
   
</html>
