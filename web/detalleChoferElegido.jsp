
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
           
           int variable1  = Integer.valueOf(request.getParameter("apellido")).intValue();
           int variable2  = Integer.valueOf(request.getParameter("dni")).intValue();
           
           String apellido="",nombre="",dni="",telefono="",mail="",id="";
            int i=0;
            boolean Encontro = false;
            
            if(variable1==-1 && variable2==-1 ){
                response.sendRedirect ("listadoChofer.jsp");
            }
            
            while (i < listaChofer.size() && !Encontro) {
                if(listaChofer.get(i).getIdChofer()==variable2 || listaChofer.get(i).getIdChofer()==variable1){
                    id=String.valueOf(listaChofer.get(i).getIdChofer());
                    apellido=listaChofer.get(i).getApellido();
                    nombre=listaChofer.get(i).getNombre();
                    dni=String.valueOf(listaChofer.get(i).getDni());
                    telefono=String.valueOf(listaChofer.get(i).getDni());
                    mail=String.valueOf(listaChofer.get(i).getMail());
                }
                i++;
            }
                       
            
         %> 
		
            
                             
                         <div class="cajaListado">
                        <h1>Detalles</h1>
                       
                       
                                 
                                

                   
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
                             
                                      
                                 
                                  
                                
                                        <td><%=apellido%></td>
                                        <td><%= nombre %></td>
                                        <td><%= dni %></td>
                                        <td><%= telefono %><td>
                                        <td><%= mail %></td>
                                        <td> <a style="background-color: orange;color: white;padding: 5px;"href="EliminarChofer?idChofer=<%=id%>" >Modificar</a> </td>
                                        <td> <a style="background-color: red;color: white;padding: 5px;"href="EliminarChofer?idChofer=<%=id%>" >Eliminar </a></td>
                                         
                                   
                    </table>
                                        <br>                           
                            <td> <a style="display: inline;color: white;font-weight: bold;margin: 5px;"href="listadoChofer.jsp" >Volver </a></td>  
                    
                     </div>
                        
                         </form>
                    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
      
    

</html>