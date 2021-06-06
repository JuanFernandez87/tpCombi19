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
                 
                String patente = (String)session.getAttribute("patente");
                String modelo = (String)session.getAttribute("modelo");    
                Integer cantAsientos = (Integer)session.getAttribute("cantAsientos");    
                //Integer dni = (Integer)session.getAttribute("dni");    
                //Integer telefono = (Integer)session.getAttribute("tel");
                String servicio = (String)session.getAttribute("servicio");
                Integer idChofer = (Integer)session.getAttribute("id");
              
            
                    List <Chofer> listaChoferes = control.devolverListaChoferes();
                      String tipoServicio = "Comoda";
                if (servicio.equals("Super comoda")){
                        tipoServicio = "Super comoda";  
                        }
             %> 
		
             <form action="RegistroCombi" class="formulario-sesiones" method="post" name="<%=tipoServicio%>" id="formularioCombi">
				<h4>Registrar combi </h4>
                <label> Dominio</label>
                <input class="controls" type="text" name="patente" required placeholder="AA000AA" value=<%=patente%>>
                <label> Modelo</label>
                <input class="controls" type="text" name="modelo" required placeholder="Ingrese modelo" value=<%=modelo%>>  
                <label> Cantidad asientos</label>
                <input class="controls" type="number" name="cantAsientos" required placeholder="0" value=<%=cantAsientos%>>
            
                
                <label> Chofer</label>
                <select class="controls" name="id" required id="selectChofer">
                    <option>Seleccione un chofer</option>
                <%
                   for (Chofer chof: listaChoferes) { 
                        if(chof.getIdCombi() == 0 && chof.getDni() >0){%>
                    <option value="<%=chof.getIdChofer()%>"><%=chof.getNombre()%> <%=chof.getApellido()%> - <%=chof.getDni()%></option>
                 <%}}%>  
                </select>
                
                 <label> Seleccione tipo de servicio</label>
                        <select class="controls" id="selectServicio" name="servicio" required >
                            <option selected id="com"  > Comoda</option>
                            <option selected id="sup"   > Super comoda</option>
                        </select>
                
                <input class="botons" type="submit" value="Dar de alta ">
            </form>
                

  src="https://code.jquery.com/jquery-3.6.0.min.js">
    <script src="js/sesion.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="js/sweetAlertPatenteRepetida.js"></script>
    <script> 
        
        // SE PONE COMO SELECTED EL TIPO DE SERVICIO SELECCIONADO
         var tipoDePlan = document.getElementById("formularioCombi");
    if (tipoDePlan.name=== "Super comoda"){
         document.getElementById("com").removeAttribute("selected");
    }else{
             document.getElementById("sup").removeAttribute("selected");
        }
        
        
        // CON LA SIGUIENTE SECCION SE PONE COMO SELECTED EL CHOFER QUE SE HAYA ELEGIDO
         var sel = document.getElementById("selectChofer"); // se obtiene una lista de las opciones. las opciones son los id de los choferes.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < sel.length; i++) {
            if(  sel[i].value === "<%=idChofer%>"){
                sel[i].selected = 'selected';
                break;
            }
        }
 
     </script>

<%@include file="/template/footer.jsp"%>

  </body>
   
</html>
    