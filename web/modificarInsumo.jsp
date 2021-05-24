<%@page import="Logica.Insumo"%>
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
        <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
        <%
            List <Insumo> listaInsumos = control.devolverListaInsumos(); 
            int idInsumo = Integer.parseInt(request.getParameter("idInsumo"));
            int IntValue;
            
            for (Insumo ins:listaInsumos) { 
                if(ins.getIdInsumo() == idInsumo) {%>
        
                <form action="ModificarInsumo?idInsumo=<%=ins.getIdInsumo()%>" class="formulario-sesiones" method="post">
				
                <h4>Modificar insumo</h4>    
                    
                <label>Nombre</label>
                    <input class="controls" type="text" name="nombre" value="<%=ins.getNombre()%>">
               
                <label>Tipo</label>
                     <select class="controls" name="tipo">
                         <option><%=ins.getTipo()%></option>
                         <option>Dulce</option>
                         <option>Salado</option>
                     </select>                    
                
                <label>Precio</label>
                    <input class="controls" type="number" name="precio" value="<%=IntValue = (int) ins.getPrecio()%>">                
                
                <%}}%>
 
                <input class="botons" type="submit" value="Modificar">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>

  </body>
</html>