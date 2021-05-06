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
    double precio;
    
    @Temporal(TemporalType.DATE)
    Date fecha;

    /*@OneToOne
    Insumo unInsumo;

    @OneToOne
    Ruta unaRuta;

    @OneToMany
    Pasaje unPasaje;*/
    
    public Viaje() {
    }

    public Viaje(int idViaje, int cantAsientos, Date fecha, double precio) {
        this.idViaje = idViaje;
        this.cantAsientos = cantAsientos;
        this.fecha = fecha;
        this.precio = precio;
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

 
}
