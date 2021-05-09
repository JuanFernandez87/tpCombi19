package Logica;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Lugar implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idLugar;
    
    @Basic
    String nombre;
    String Provincia;

    public Lugar() {
    }

    public Lugar(int idLugar, String nombre, String Provincia) {
        this.idLugar = idLugar;
        this.nombre = nombre;
        this.Provincia = Provincia;
    }

    public int getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(int idLugar) {
        this.idLugar = idLugar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProvincia() {
        return Provincia;
    }

    public void setProvincia(String Provincia) {
        this.Provincia = Provincia;
    }

    void setBorradoLogico() {
        this.idLugar = -1;
    }

}
