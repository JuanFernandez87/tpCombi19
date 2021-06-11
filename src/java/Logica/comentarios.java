/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

/**
 *
 * @author Esteban
 */


public class comentarios {

    private int idCliente;
    private String fecha;
    private String comentario;


    public comentarios() {
    
    }

    public comentarios(int idCliente, String fecha,String comentario) {
        //super(dni, nombre, apellido, mail, contra, fecha_nac);
        this.idCliente = idCliente;
        this.fecha = fecha;
        this.comentario = comentario;
       
    
 
    }
}
