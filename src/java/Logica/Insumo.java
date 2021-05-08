package Logica;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Insumo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idInsumo;
    
    @Basic
    String nombre;
    String tipo;
    String marca;
    double precio;

    public Insumo() {
    }

    public Insumo(int idInsumo, String nombre, String tipo, String marca, double precio) {
        this.idInsumo = idInsumo;
        this.nombre = nombre;
        this.tipo = tipo;
        this.marca = marca;
        this.precio = precio;
    }

    public int getIdInsumo() {
        return idInsumo;
    }

    public void setIdInsumo(int idInsumo) {
        this.idInsumo = idInsumo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setBorradoLogico() {
        this.idInsumo = -1;
    }
}
