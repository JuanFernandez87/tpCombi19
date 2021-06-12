<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logoCombi19.png" type="image/png" />
        <title>Combi 19</title>  
        <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1.0, maximum-scale=1.0, maximum-scale=1.0">     
    </head>

<body>
        <%
        //int idCliente = (Integer)session.getAttribute("idCliente");
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String tipoPlan = request.getParameter("tipoPlan");
        String notTipoCliente;
        if(tipoPlan.equals("Basico"))
        {
           notTipoCliente = "Gold";
        }else{
        notTipoCliente = "Basico";
            } 
        %>
    
        <header>
            <%@include file="/template/headerSesionUsuario.jsp"%>
        </header>
	
        <aside>
            <%@include file="/template/asideUsuario.jsp"%>
        </aside>               
        
                <div class="formulario-sesiones">
	    <div class="divCierre" style=" position: absolute;background: #424242;top:45%;left: 35%;margin-top: -100px;margin-left: -100px;padding:20px;font-family: inherit;font-size: 1rem;
        color: white;text-align: center;padding: 70px; border: none;border-radius: 5px;">
                
                <br>
                <h3>¿Esta seguro que quiere cambiar del plan <%=tipoPlan%> al plan <%=notTipoCliente%>?</h3>
                <%if(tipoPlan.equals("Basico")){%>
                    <h3>Deberá registrar una tarjeta de crédito</h3>
                    <br>
                    <a style="display: inline;color: white; background-color: rgb(48, 133, 214);padding: 10px;border-radius: 5px;"href=modificarPlanGold.jsp?idCliente=<%=idCliente%>">Aceptar</a>
                <%}else{%>
                    <h3>Perderá los beneficios del plan gold</h3>
                    <br>
                    
                   <a style="display: inline;color: white; background-color: rgb(48, 133, 214);padding: 10px;border-radius: 5px;" href="ModificarPlan?idCliente=<%=idCliente%>">Aceptar</a>

                <%}%>          
                <a style="display: inline;color: white; background-color: rgb(211, 51, 51);padding: 10px;border-radius: 5px;" href="sesionUsuario.jsp">Cancelar</a>

            </div> 
        </div> 
        
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/sesion.js"></script>

  </body>
   
</html>
