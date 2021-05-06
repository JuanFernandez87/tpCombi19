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
public class Administrador /*extends Persona*/ {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)       
    int idAdministrador;

    //despues borrar
    @Basic
    String nombre;
    String apellido;
    String mail;
    String contra;
    int dni;

    @Temporal(TemporalType.DATE)
    Date fecha_nac;    
    
    public Administrador() {
    }

    public Administrador(int idAdministrador, int dni, String nombre, String apellido, String mail, String contra, Date fecha_nac) {
        //super(dni, nombre, apellido, mail, contra, fecha_nac);
        this.idAdministrador = idAdministrador;
        //despues borrar
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contra = contra;
        this.fecha_nac = fecha_nac;
    }

    public int getIdAdministrador() {
        return idAdministrador;
    }

    public void setIdAdministrador(int idAdministrador) {
        this.idAdministrador = idAdministrador;
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
