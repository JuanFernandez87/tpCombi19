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
    boolean enSesion;
    //despues borrar
    String nombre;
    String apellido;
    String mail;
    String contra;
    int dni;
    List <String> listaComentarios = new ArrayList<String>();
    int idTarjeta;
    /*@OneToOne
    Tarjeta unaTarjeta;
    
    @OneToMany
    Pasaje unPasaje;*/
    
    int dia;
    int mes;
    int anio;
    //hasta aca 
    
    public Cliente() {
    }

    public Cliente(int idCliente, String tipoPlan, int dni, String nombre, String apellido, String mail, String contra, int dia, int mes, int anio, int idTarjeta,boolean sesion) {
        //super(dni, nombre, apellido, mail, contra, fecha_nac);
        this.idCliente = idCliente;
        this.tipoPlan = tipoPlan;
         //despues borrar
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
        this.idTarjeta = idTarjeta;
        this.enSesion = sesion;
    }

    public boolean getEnSesion() {
        return enSesion;
    }

    public void setEnSesion(boolean enSesion) {
        this.enSesion = enSesion;
    }

    public int getIdTarjeta() {
        return idTarjeta;
    }

    public void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
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

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }



}
