<%@page import="Logica.Lugar"%>
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
                    List <Lugar> listaLugares = control.devolverListaLugares(); 
                    int idLugar = Integer.parseInt(request.getParameter("idLugar"));
                    for (Lugar unLugar:listaLugares) { 
                        if(unLugar.getIdLugar() == idLugar){ 
                    
                %>         
		
            <form action="ModificarLugar?idLugar=<%=unLugar.getIdLugar()%>" class="formulario-sesiones" method="post">
				<h4>Modificar lugar </h4>
                <label> Ciudad</label>
                <input class="controls" type="text" name="nombre" value="<%=unLugar.getNombre()%>">
                <label> Provincia</label>     
                <select class="controls" name="provincia">
                            <option><%=unLugar.getProvincia()%></option>
                            <option>Buenos Aires</option>
                            <option>Catamarca</option>
                            <option>Chaco</option>
                            <option>Chubut</option>
                            <option>Córdoba</option>
                            <option>Corrientes</option>
                            <option>Entre Ríos</option>
                            <option>Formosa</option>
                            <option>Jujuy</option>
                            <option>La Pampa</option>
                            <option>La Rioja</option>
                            <option>Mendoza</option>
                            <option>Misiones</option>
                            <option>Neuquén</option>
                            <option>Río Negro</option>
                            <option>Salta</option>
                            <option>San Juan</option>
                            <option>San Luis</option>
                            <option>Santa Cruz</option>
                            <option>Santa Fe</option>
                            <option>Santiago del Estero</option>
                            <option>Tierra del Fuego</option>
                            <option>Tucumán</option>
                        </select>
                <input class="botons" type="submit" value="Modificar">
            </form>
                             <%}}%> 
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
    </body>
</html>
