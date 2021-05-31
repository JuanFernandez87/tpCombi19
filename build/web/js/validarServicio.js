alert(document.getElementById("selectServicio").value);
                    var x = document.getElementById("selectServicio");
                             if (x.value=== "Super comoda"){
                                 alert("se ingreso a supercomoda");
                                 alert(document.getElementById("com").value);
                              document.getElementById("com").removeAttribute("selected");
                }else{
                  document.getElementById("sup").removeAttribute("selected");
                  alert("se ingreso a Comoda");
                  alert(document.getElementById("sup").value);
                  
                  }
     