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
            int pag=0;
            if (request.getParameter("apellido") == null) {
                   pag = Integer.valueOf(request.getParameter("apellido"));
               } 
          
        %> 
		
            
                             
                    <div class="cajaListado">
                        <h1>Detalles</h1>
                       
				                                     
                             <select class="controls" name="apellido">
                                <option value="" >Seleccione un Chofer  </option>
                                   <%

                                int i=0;

                                for (   i=0 ; i < listaChofer.size() ; ++i) {

                                %>



                                <option value=<%=listaChofer.get(i).getIdChofer() %>><%= listaChofer.get(i).getApellido() %> </option>



                                 <%}%>      
                                 
                              

                             </select>
                                 <button> <a href="detalleChofer.jsp?pg=<%=pag %>">Buscar&lt;</a></button>
                   
                    <table>
                        <tr>
                            <td>Apellido</td> 
                            <td>Nombre</td> 
                            <td>Dni</td> 
                            <td>Telefono</td> 
                            <td>Mail</td> 
                        </tr>

             
                

                        <td><%= listaChofer.get(pag).getApellido() %></td>
                        <td><%= listaChofer.get(pag).getApellido() %></td>
                        <td><%= listaChofer.get(pag).getApellido() %></td>
                        <td><%= listaChofer.get(pag).getApellido() %></td>
                         
                
                    </table>
                           
                    
                     </div>
                        
                         </form>
                    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        
      
    

</html>
