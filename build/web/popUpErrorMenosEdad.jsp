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
            <%@include file="template/header.jsp"%>
        </header>
        
        <div class="formulario">
                
              
               <%
                String email = (String)session.getAttribute("mail");
                String nombre = (String)session.getAttribute("nombre");    
                String apellido = (String)session.getAttribute("apellido");    
                int dia = (Integer)session.getAttribute("dia");    
                int mes = (Integer)session.getAttribute("mes");    
                int anio = (Integer)session.getAttribute("anio");   
                Integer dni = (Integer)session.getAttribute("dni");
                String plan = (String)session.getAttribute("plan");
                String valorPlan = "Basico";
                String pass = (String)session.getAttribute("pass");
                if (plan.equals("Gold")){
                        valorPlan = "Gold";  
                        }
            %>
           <form action="RegistroCliente"  id= "formularioRegistro" method="post" name="<%=valorPlan%>">
                <h4>Formulario Registro</h4>
               <input class="controls" type="text" name="nombre" required id="nombres" placeholder="Ingrese su Nombre" value="<%=nombre%>">
               <input class="controls" type="text" name="apellido" required id="apellidos" placeholder="Ingrese su Apellido" value="<%=apellido%>">
               <input class="controls" type="tel" name="dni" required id="dni" placeholder="Ingrese su Dni" value="<%=dni%>">
               
               <input class="controls" type="email" name="mail" required id="correo" placeholder="Ingrese su Correo" value="<%=email%>">
               <input class="controls" type="password" name="pass" required id="contra" placeholder="Ingrese su Contraseña" value="<%=pass%>">
               <b for="start">Ingrese su fecha de nacimiento:</b><br>
               <div class="fecha">
                    <input class="controls2" type="number" name="dia" required id="dia" min="1" max="31" placeholder="Dia" value="<%=dia%>">
                    <input class="controls2" type="number" name="mes" required id="mes" min="1" max="12" placeholder="Mes" value="<%=mes%>">
                    <input class="controls2" type="number" name="anio" required id="anio" min="1960" max="2021" placeholder="Año" value="<%=anio%>">
               </div><br>
                <label> Seleccione tipo de plan</label>
                        <select class="controls" id= "PlanRepetido" name="tipoPlan" >
                            <option selected id="Basic">Basico</option>
                            <option  selected id="Gold" >Gold</option>
                        </select>
               <input class="botons" type="submit" value="Registrarme">

               <p><a href="login.jsp">Ya tengo Cuenta</a></p>
               
                </form>                                  
         </div>
                 <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="js/sweetAlertEdad.js"></script>
      
        <script>     
             // pregunta el tipo de plan elegido, se guarda el tipo de plan en la variable "name" de formulario.
            var tipoDePlan = document.getElementById("formularioRegistro");
             if (tipoDePlan.name=== "Gold"){
                  document.getElementById("Basic").removeAttribute("selected");
             }else{
                      document.getElementById("Gold").removeAttribute("selected");
                 }
        </script>         
        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
       
    
                
    </body>
</html>