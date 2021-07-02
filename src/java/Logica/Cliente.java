package Logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;

@Entity
public class Cliente{
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
    
    String estado; //habilitado o rechazado
    @Temporal(javax.persistence.TemporalType.DATE)
    Date fechaDeRechazo;

    @OneToMany
    private List <Pasaje> pasajes;
    
    public Cliente() {
    }

    public Cliente(int idCliente, String tipoPlan, boolean enSesion, String nombre, String apellido, String mail, String contra, int dni, int idTarjeta, int dia, int mes, int anio, String estado, Date fechaDeRechazo, List<Pasaje> pasajes) {
        this.idCliente = idCliente;
        this.tipoPlan = tipoPlan;
        this.enSesion = enSesion;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
        this.dni = dni;
        this.idTarjeta = idTarjeta;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
        this.estado = estado;
        this.fechaDeRechazo = fechaDeRechazo;
        this.pasajes = pasajes;
    }   
    
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaDeRechazo() {
        return fechaDeRechazo;
    }

    public void setFechaDeRechazo(Date fechaDeRechazo) {
        this.fechaDeRechazo = fechaDeRechazo;
    }

    public List<Pasaje> getPasajes() {
        return pasajes;
    }

    public void setPasajes(List<Pasaje> pasajes) {
        this.pasajes = pasajes;
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
    
    public void agregarComentario(String comentario) {
        this.listaComentarios.add(comentario);
    }

    public void eliminarComentario(int comentario) {
        this.listaComentarios.remove(comentario);
    }

 



}
