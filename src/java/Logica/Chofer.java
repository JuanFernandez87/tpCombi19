package Logica;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Chofer /*extends Persona*/{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idChofer;
    
    @Basic
    int telefono;
    String nombre;
    String apellido;
    String mail;
    String contra;
    int dni;
    int idCombi;
    
    @Temporal(TemporalType.DATE)
    Date fecha_nac;    
        
    public Chofer(){
    }

    public Chofer(int idChofer, int telefono, int dni, String nombre, String apellido, String mail, String contra, Date fecha_nac, int idCombi) {
        this.idChofer = idChofer;
        this.telefono = telefono;
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
        this.fecha_nac = fecha_nac;        
        this.idCombi = 0;
    }

    public void setIdChofer(int idChofer) {
        this.idChofer = idChofer;
    }    
    
    public int getIdChofer() {
        return idChofer;
    }

    public void setBorradoLogico() {
        this.dni = -1;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
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

    public int getIdCombi() {
        return idCombi;
    }

    public void setIdCombi(int idCombi) {
        this.idCombi = idCombi;
    }
}