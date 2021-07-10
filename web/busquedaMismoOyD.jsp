<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Cliente"%>
<%@page import="Logica.Controladora"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Lugar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">
          <link rel="stylesheet" href="css/lista.css">
    </head>
    <style>
/* width */
::-webkit-scrollbar {
  width: 15px;
  margin: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #24303c; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #1f53c5; 
}
</style>
    
    <body>
        <header>
            <%@include file="/template/header.jsp"%>
        </header>

        <%          
                    Controladora control = new Controladora();
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares(); 
                Integer dia = (Integer)session.getAttribute("dia");
                Integer mes = (Integer)session.getAttribute("mes");    
                Integer anio = (Integer)session.getAttribute("anio"); 
                String origen1 = (String)session.getAttribute("origen");
                String destino1 = (String)session.getAttribute("destino");    
                        %>         
       
        <div  class="formulario" style="margin-top: 200px;margin-right: 100px;">
            <form action="BuscarPasaje" method="POST">
                <h4>Busca tu pasaje </h4>
                               
               
                <select class="controls" name="origen" id="selectOrigen" required>
                        <option>Seleccione un origen</option>
                <%
                    for (Lugar origen: listaOrigen) {
                        if (!origen.getProvincia().equals("-1")){ %>                        
                        <option value="<%=origen.getNombre()%>"><%=origen.getNombre()%></option>               
                 <%}}%>
                </select> 
                          
                <select class="controls" name="destino" required id="selectDestino">               
                        <option>Seleccione un destino</option>
                <%
                    for (Lugar destino: listaDestino) {
                        if (!destino.getProvincia().equals("-1")){ %>                       
                        <option value="<%=destino.getNombre()%>"><%=destino.getNombre()%></option>               
                 <%}}%>       
                </select>

                <i class="fas fa-calendar-alt"></i> <label>Partida</label>
                <div class="fecha"> <br>
                    <input class="controls2" type="number" name="dia" required id="dia" min="1" max="31" placeholder="Dia" value="<%=dia%>">
                    <input class="controls2" type="number" name="mes" required id="mes" min="1" max="12" placeholder="Mes" value="<%=mes%>">
                    <input class="controls2" type="number" name="anio" required id="anio" min="2021" max="2025" placeholder="Año" value="<%=anio%>">
               </div><br>
                <div style="display: flex">  
                <input class="botons" type="submit" value="Buscar Pasajes" style="margin: 7px 20px;">
                <input class="botons" href="login.jsp" type="submit" value="Iniciar sesión" style="margin: 7px 20px;">
              </div>  
            </form>
          </div> 
       
                
        <div style="width: 45%;float:right;margin-top: 200px; ">
          
            <div style="width: 60%;height:530px;overflow-y: scroll;">
            
             
            <%         
            List <Cliente> listaClientes = control.devolverListaClientes(); 
            List<String> lista = new ArrayList<String>();

            for (Cliente unCliente:listaClientes){
                 for (int i = 0; i < unCliente.getListaComentarios().size(); i++) {
                       lista.add(unCliente.getListaComentarios().get(i)+ "|"+ unCliente.getApellido() +" " +unCliente.getNombre());
                }
                Collections.sort(lista);
                Collections.reverse(lista);
            }    
            for (int i = 0; i < lista.size(); i++) {
                if(i < 10){
                    String[] parts = lista.get(i).split("\\|");
                    
                    String fecha=parts[0].substring(0,18);
                    
                    String comentario = parts[0].substring(19);
                    
                     String usuario = parts[1]+":";
                    
             %>      
            
             <div class="comentario" style="width:95%">
                 
                 <div style="margin: 5px;"><img src="./images/imgperfil.jpg"><%=usuario%> <%=comentario%> </div>
                 <div style="padding: 5px;font-size: 12px;text-align: right;"><%= fecha%> </div>    
             </div>          
            <%}}%>  
            </div>

        </div>
            <script>
                
        var sel = document.getElementById("selectOrigen"); // se obtiene una lista de las opciones. las opciones son los id de los choferes.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < sel.length; i++) {
              sel[i].value;
            if(  sel[i].value ==="<%=origen1%>"){
                sel[i].selected = 'selected';
            }
        } 
        var dest = document.getElementById("selectDestino"); // se obtiene una lista de las opciones. las opciones son los id de los choferes.
         //recorremos la lista preguntando si el id actual "i" es igual al id que se selecciono en la carga del formulario.
         for (var i = 0; i < dest.length; i++) {
              dest[i].value;
            if(  dest[i].value ==="<%=destino1%>"){
                dest[i].selected = 'selected';
            }
        }
                    </script>         
          
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertMismoOyD.js"></script>  
         
            
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
      </body>
</html>                
