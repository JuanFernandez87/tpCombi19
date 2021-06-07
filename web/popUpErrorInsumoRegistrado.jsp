<%-- 
    Document   : sesionAdminInsumo
    Created on : 28/04/2021, 18:40:02
    Author     : juanf
--%>

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
                String tipo = (String)session.getAttribute("tipo");
                String nombre = (String)session.getAttribute("nombre");    
                Integer precio = (Integer)session.getAttribute("precio");
                 String tipoInsumo = "Dulce";
                if (tipo.equals("Salado")){
                        tipoInsumo = "Salado";  
                        }
            %>
		
            <form action="RegistroInsumo" class="formulario-sesiones" method="post" name="<%=tipoInsumo%>" id="formularioInsumo">
				<h4>Registrar insumo </h4>
                <label> Nombre</label>
                <input class="controls" type="text" name="nombre" required placeholder="Ingrese nombre" value="<%=nombre%>">
                <label> Tipo</label>
                        <select class="controls" name="tipo" id="selectInsumo" required>
                            <option id="dulce" selected>Dulce</option>
                            <option id="salado" selected >Salado</option>
                        </select>
                <label> Precio</label>
                <input class="controls" type="number" name="precio" required placeholder="Ingrese precio" value="<%=precio%>">
                <input class="botons" type="submit" value="Dar de alta ">
            </form>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>
 
</div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        <script> 
        
        // CON LA SIGUIENTE SECCION SE PONE COMO SELECTED EL CIUDAD QUE SE HAYA ELEGIDO

          var tipoDePlan = document.getElementById("formularioInsumo");
    if (tipoDePlan.name=== "Salado"){
         document.getElementById("dulce").removeAttribute("selected");
    }else{
             document.getElementById("salado").removeAttribute("selected");
        }
        </script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertInsumoRegistrado.js"></script>
        
  </body>
</html>
