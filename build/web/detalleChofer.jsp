<%@page import="Logica.Chofer"%>
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
     <link rel="stylesheet" href="css/lista.css">
</head>
        <header>
            <%@include file="/template/headerSesiones.jsp"%>
        </header>

	 <aside>
            <%@include file="/template/aside.jsp"%>
        </aside>
        <%
         
            Controladora control = new Controladora();
            List <Chofer> listaChofer = control.devolverListaChoferes(); 
           
            int variable1=0;
            
        %> 
		
            
                             
                    <div class="cajaListado">
                        <h1>Detalles</h1>
                       
<<<<<<< HEAD
                       <form style="background-color: none;display: inline;padding: 0px;" action="detalleChoferElegido.jsp" class="formulario-sesiones" method="post">
				                                     
                             <select style="width: 30%" class="controls" name="apellido">
                                <option>Seleccione un Chofer  </option>
                                   <%                             
=======
<<<<<<< Updated upstream
				                                     
                             <select class="controls" name="apellido">
                                <option value="" >Seleccione un Chofer  </option>
                                   <%
=======
                       <form class="busqueda" action="detalleChoferElegido.jsp" class="formulario-sesiones" method="post">
				                                     
                             <select  name="apellido">
                                <option>Seleccione un Chofer  </option>
                                   <%                             
>>>>>>> Stashed changes

                                int i=0;

                                for (   i=0 ; i < listaChofer.size() ; ++i) {

                                %>
>>>>>>> Lucho

                                for (  Chofer chofer:listaChofer) {

<<<<<<< HEAD
                                %>                              
=======
<<<<<<< Updated upstream
>>>>>>> Lucho

                                <option value=<%=chofer.getIdChofer() %>><%= chofer.getApellido()%><%= chofer.getNombre()%> </option>

                                 <%}%>          

<<<<<<< HEAD
                             </select>
                              
                             <input style="width: 30%"class="controls" type="submit" value="Buscar">
                       </form >     
                       <br><br>
                          
=======

                                 <%}%>      
                                 
=======
                             </select>
                              
                             <input type="submit" value="Buscar">
                       </form >     
                       <br><br>
                          
>>>>>>> Stashed changes
>>>>>>> Lucho
                              

                   
                    <table>
                        <tr>
                            <td>Apellido</td> 
                            <td>Nombre</td> 
                            <td>Dni</td> 
                            <td>Telefono</td> 
                            <td>Mail</td> 
                            
                        </tr>
     
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><td>
                                        <td></td>
                      
                                  
                    </table>
                           
                    
                     </div>
                        
                         
                    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
      
    

</html>
