package Logica;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Viaje implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idViaje;
    
    @Basic
    int cantAsientos;
    int precio;
    int idRuta;
    int dia;
    int mes;
    int anio;

    /*@OneToOne
    Insumo unInsumo;

    @OneToOne
    Ruta unaRuta;

    @OneToMany
    Pasaje unPasaje;*/
    
    public Viaje() {
    }

    public Viaje(int idViaje, int idRuta, int cantAsientos, int dia, int mes, int anio, int precio) {
        this.idViaje = idViaje;
        this.idRuta = idRuta;
        this.cantAsientos = cantAsientos;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
        this.precio = precio;
    }
    
    public int getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(int idRuta) {
        this.idRuta = idRuta;
    }

    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    public int getCantAsientos() {
        return cantAsientos;
    }

    public void setCantAsientos(int cantAsientos) {
        this.cantAsientos = cantAsientos;
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

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

     public void setBorradoLogico() {
        this.idRuta = -1;
    }
}
