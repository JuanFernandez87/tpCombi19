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
				<h4>Alta combi </h4>
                <label> Dominio</label>
                <input class="controls" type="text" name="patente" placeholder="AA000AA">
                <label> Modelo</label>
                <input class="controls" type="text" name="modelo" placeholder="Ingrese modelo">
                <label> Cantidad asientos</label>
                <input class="controls" type="mail" name="cantAsientos" placeholder="0">
            <%
                    Controladora control = new Controladora();
                    List <Chofer> listaChoferes = control.devolverListaChoferes(); 
             %> 
                
                <label> Chofer</label>
                <select class="controls" name="id">
                    <option>Seleccione un chofer</option>
                <%
                   for (Chofer chof: listaChoferes) { 
                        if(chof.getOcupado() == 0){%>
                    <option value="<%=chof.getIdChofer()%>"><%=chof.getApellido()%></option>
                 <%}}%>  
                </select>
                
                 <label> Seleccione tipo de servicio</label><br>
                        <select class="controls" name="servicio">
                            <option>Comoda</option>
                            <option>Super comoda</option>
                        </select><br/><br/>
                
                <input class="boton" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

<%@include file="/template/footer.jsp"%>

  </body>
   
</html>
