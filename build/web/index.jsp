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
    </head>
    
    <body>
        <header>
            <%@include file="/template/header.jsp"%>
        </header>

        <%          
                    Controladora control = new Controladora();
                    List <Lugar> listaOrigen = control.devolverListaLugares();
                    List <Lugar> listaDestino = control.devolverListaLugares(); 
        %>         
        
        <div  class="formulario">
            <form action="BuscarPasaje" method="POST">
                <h4>Busca tu pasaje </h4>
                               
                <i class="fas fa-map-marker-alt"><label>Origen</label>
                <select class="controls" name="origen" required>
                        <option>Seleccione un origen</option>
                <%
                    for (Lugar origen: listaOrigen) {
                        if (!origen.getProvincia().equals("-1")){ %>                        
                        <option value="<%=origen.getNombre()%>"><%=origen.getNombre()%></option>               
                 <%}}%>
                </select> 
                
                <i class="fas fa-map-marker-alt"><label>Destino</label>              
                <select class="controls" name="destino" required>               
                        <option>Seleccione un destino</option>
                <%
                    for (Lugar destino: listaDestino) {
                        if (!destino.getProvincia().equals("-1")){ %>%>                        
                        <option value="<%=destino.getNombre()%>"><%=destino.getNombre()%></option>               
                 <%}}%>       
                </select>

                <i class="fas fa-calendar-alt"></i> <label>Partida</label>
                <div class="fecha"> <br>
                    <input class="controls2" type="number" name="dia" required id="dia" min="1" max="31" placeholder="Dia">
                    <input class="controls2" type="number" name="mes" required id="mes" min="1" max="12" placeholder="Mes">
                    <input class="controls2" type="number" name="anio" required id="anio" min="2021" max="2025" placeholder="Año">
               </div><br>
              <div style="display: flex" >  
                <input class="botons" type="submit" value="Buscar Pasajes" style="margin: 7px 20px;">
                <input class="botons" href="login.jsp" type="submit" value="Iniciar sesión" style="margin: 7px 20px;">
              </div>  
            </form>
           
        </div>
            <div style="margin-top: 220px" class="formularioCom">
                <div style="position: inherit" class="formu">
                    <h4 style="color: white; text-align: center">Comentarios</h4>
                
                <div class="comentario">
                    <h5><img src="./images/mesi.jpg" alt="">Ricardo Bertone</h5>
                    <p>Excelente servicio</p>   
                </div>
                <div class="comentario">
                    <h5><img src="./images/mona.jpg" alt="">Alicia Estevez</h5>
                    <p>Muy recomendable</p>   
                </div>
                <div class="comentario">
                    <h5><img src="./images/barba.jpg" alt="">Alejandro Fernandez</h5>
                    <p>Los mejores!</p>  
                </div><br>
               
            </div>
                 
           </div>      
        </div>
       
         
         
            
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
      </body>
</html>