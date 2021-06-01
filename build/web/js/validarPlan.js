 // con este JS se verifica que elemento del select se selecciono, y se elimina el atributo "selected" del contrario para que se muestre correctamente.               
 var x = document.getElementById("PlanRepetido");
        if (x.name=== "Gold"){
            document.getElementById("Basic").removeAttribute("selected");
        }else{
             document.getElementById("Gold").removeAttribute("selected");
        }
            


