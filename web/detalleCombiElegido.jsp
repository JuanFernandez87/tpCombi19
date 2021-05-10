
<%@page import="Logica.Combi"%>
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
            List <Combi> listaCombi = control.devolverListaCombi();
           
           int variable1  = Integer.valueOf(request.getParameter("patente")).intValue();
           
           
            String id="",patente="",modelo="",cantA="",tipoServicio="";
            int i=0;
            boolean Encontro = false;
            
            if(variable1==-1){
                response.sendRedirect ("listadoCombi.jsp");
            }
            
            while (i < listaCombi.size() && !Encontro) {
                if(listaCombi.get(i).getIdCombi()==variable1){
                    id=String.valueOf( listaCombi.get(i).getIdCombi());
                    patente=String.valueOf( listaCombi.get(i).getPatente());
                    modelo= String.valueOf(listaCombi.get(i).getModelo());
                    cantA= String.valueOf(listaCombi.get(i).getCantAsientos());
                    tipoServicio= String.valueOf(listaCombi.get(i).getTipoServicio());
                }
                i++;
            }
                       
            
         %> 
		
            
                             
                         <div class="cajaListado">
                        <h1>Detalles</h1>
                       
                       
                                 
                                

                   
                    <table>
                        <tr>
                            <td>Patente</td> 
                            <td>Modelo</td> 
                            <td>Tipo servicio</td> 
                            <td>Cantidad Asientos</td> 
                           
                             <td></td> 
                             <td></td>
                            
                        </tr>
                             
                                      
                                 
                                  
                                
                                        <td><%=patente%></td>
                                        <td><%= modelo %></td>
                                        <td><%= tipoServicio %></td>
                                        <td><%= cantA %><td>
                                      
                                        <td> <a style="background-color: orange;color: white;padding: 5px;"href="EliminarCombi?idCombi=<%=id%>" >Modificar</a> </td>
                                        <td> <a style="background-color: red;color: white;padding: 5px;"href="EliminarCombi?idCombi=<%=id%>" >Eliminar </a></td>
                                         
                                   
                    </table>
                                        <br>                           
                            <td> <a style="display: inline;color: white;font-weight: bold;margin: 5px;"href="listadoCombi.jsp" >Volver </a></td>  
                    
                     </div>
                        
                         </form>
                    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sesion.js"></script>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
      
    

</html>