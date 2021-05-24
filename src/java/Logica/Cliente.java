package Logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Cliente /*extends Persona*/{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idCliente;
    
    @Basic
    String tipoPlan;
    //despues borrar
    String nombre;
    String apellido;
    String mail;
    String contra;
    int dni;
    List <String> listaComentarios = new ArrayList<String>();
    /*@OneToOne
    Tarjeta unaTarjeta;
    
    @OneToMany
    Pasaje unPasaje;*/
    
    @Temporal(TemporalType.DATE)
    Date fecha_nac;
    //hasta aca 
    
    public Cliente() {
    }

    public Cliente(int idCliente, String tipoPlan, int dni, String nombre, String apellido, String mail, String contra, Date fecha_nac) {
        //super(dni, nombre, apellido, mail, contra, fecha_nac);
        this.idCliente = idCliente;
        this.tipoPlan = tipoPlan;
         //despues borrar
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
        this.fecha_nac = fecha_nac;
    }

    public List<String> getListaComentarios() {
        return listaComentarios;
    }

    public void setListaComentarios(List<String> listaComentarios) {
        this.listaComentarios = listaComentarios;
    }
    
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getTipoPlan() {
        return tipoPlan;
    }

    public void setTipoPlan(String tipoPlan) {
        this.tipoPlan = tipoPlan;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

}
