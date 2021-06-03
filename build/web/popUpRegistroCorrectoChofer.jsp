<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
        <script src="https://kit.fontawesome.com/a23516ec0a.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/sesiones.css" >
        <link rel="stylesheet" type="css/fonts.css" href="">
        <link rel="stylesheet" href="css/lista.css">
    </head>
    
    <body>
            <%@include file="/template/headerSesiones.jsp"%>
    
            <%@include file="/template/aside.jsp"%>
       
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="js/sesion.js"></script>

 
      <%
            int pag=1;
            
            List <Chofer> listaChoferes = control.devolverListaChoferes(); 
            int maxPag = (control.devolverListaChoferes().size()/10)+1; 
            int i = 0; 
            if (request.getParameter("pg") != null) {
                   pag = Integer.valueOf(request.getParameter("pg"));
               } 
            int regMin = (pag - 1) * 10;
            
            int regMax = pag * 10;
            
            if(pag==maxPag){
                regMax=regMin+control.devolverListaChoferes().size()%10;
            }
          
        %> 
        
        
      
        <div class="cajaListado">
            <h1>Lista choferes</h1>
                     <form class="busqueda" action="detalleChoferElegido.jsp" class="formulario-sesiones" method="post">
				
                             <select  name="apellido" id="apellido">
                                 <option value=-1>Apellido y nombre </option>
                                   <%                             

                                for (  Chofer chofer:listaChoferes) {     
                                    

                                %>                              

                                <option value=<%=chofer.getIdChofer() %>><%= chofer.getApellido()%>  <%= chofer.getNombre() %></option>
 
                                 <%}%>      
                             </select>
                             
                  
                               <select  name="dni">
                                 <option value=-1>Burscar por Dni </option>
                                   <%                             

                                for (  Chofer chofer:listaChoferes) {     
                                    if(chofer.getDni()>0){

                                %>                              

                                <option value=<%=chofer.getIdChofer() %>><%= chofer.getDni() %> </option>
 
                                 <%}}%>      
                             </select>
                             
                              
                             <input  type="submit" value="Buscar">
                       </form >    
        <table>
            <tr>
                <td>Apellido</td> 
                <td>Nombre</td> 
                <td>Dni</td> 
                <td>Telefono</td> 
                <td>Mail</td> 
                <td></td> 
                <td></td> 
            </tr>
               <%
                   
                   for (  i=regMin ; i < regMax ; ++i) {
                       if (listaChoferes.get(i).getDni() > 0){
                   %>
                <tr>   
                        <td><%= listaChoferes.get(i).getApellido() %></td>
                        <td><%= listaChoferes.get(i).getNombre() %></td>
                        <td><%= listaChoferes.get(i).getDni() %></td>
                        <td><%= listaChoferes.get(i).getTelefono()%></td>
                        <td><%= listaChoferes.get(i).getMail()%></td>
                        <td> <a style="background-color: orange;color: white;padding: 5px;"href="modificarChofer.jsp?idChofer=<%=listaChoferes.get(i).getIdChofer()%>" >Modificar</a> </td>
                         <td> <a style="background-color: red;color: white;padding: 5px;" href="sesionAdminEliminarChofer.jsp?Chofer=<%=listaChoferes.get(i).getApellido()%>&id=<%=listaChoferes.get(i).getIdChofer()%>">Eliminar</a></td>
                </tr>
                 
           <%}}%>  
        </table>
           <br>
                <%
                    if (maxPag >= 1) {
             
                        if(pag!=1){%>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoChofer.jsp?pg=<%=pag - 1%>">&lt;</a></li>
                        <%}%>
                        <%
                            for ( i = 0; i < maxPag; i++) {
                                if(i+1==pag){
                        %>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><span><%=i+1%></span></li>
                        <%  }
                            else{%>
                                <li  style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoChofer.jsp?pg=<%=i+1%>"><%=i+1%></a></li>
                        <%}}
                        
                        if(pag!=maxPag){%>
                            <li style="display: inline;color: white;font-weight: bold;margin: 5px;"><a href="listadoChofer.jsp?pg=<%=pag + 1%>">&gt;</a></li>
                <%}}
                    else {%>
                        <li style="display: inline;color: white;font-weight: bold;margin: 5px;" class="active"><span>1</span></li>
                <%}
                %>
                       <br>
           <br>
            
        </div>
                        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertRegistroCorrecto.js"></script>

        
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>


    </body>
</html>
        
     
