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
        
         <div style="border:1px solid red; padding-top: 100px;">

 <form>
     <label>Numero</label><br>
     <input style="width: 20%" class="controls2" type="text" name="" required >
     <input style="width: 20%" class="controls2" type="text" name="" required >
     <input style="width: 20%"class="controls2" type="text" name="" required >
     <input style="width: 20%"class="controls2" type="text" name="" required ><br>
     
      <label for="titular"> Titular</label>
      <input class="controls" type="text" id="titular" />
   

      <label>Vencimiento</label><br>
   
        <select class="controls2 "id="vencimiento">
          <option></option>
          <option>01</option>
          <option>02</option>
          <option>03</option>
          <option>04</option>
          <option>05</option>
          <option>06</option>
          <option>07</option>
          <option>08</option>
          <option>09</option>
          <option>10</option>
          <option>11</option>
          <option>12</option>
        </select>
      
     
        <select class="controls2">
          <option></option>
          <option>2021</option>
          <option>2022</option>
          <option>2023</option>
          <option>2024</option>
          <option>2025</option>
       </select>
      <label for="CSV">CSV</label>
      <input style="width: 20%" class="controls2"  id="CSV"  maxlength="3" />
 
    <button class="botons2"><i class="fa fa-lock"></i> submit</button>
  </form>
 </div>

        <footer>
            <%@include file="/template/footer.jsp"%>
        </footer>
    
                
    </body>
</html>