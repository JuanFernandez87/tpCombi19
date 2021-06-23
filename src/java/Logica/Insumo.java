package Logica;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
//@Table (name = "insumos")
public class Insumo {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idInsumo;
    
    @Basic
    String nombre;
    String tipo;
    String marca;
    double precio;
    int cantidad;
    
    /*@JoinTable(
        name = "rel_insumos_pasajes",
        joinColumns = @JoinColumn(name = "idInsumo", nullable = false),
        inverseJoinColumns = @JoinColumn(name="idPasaje", nullable = false)
    )

    @ManyToMany(cascade = CascadeType.ALL)*/
    //private List<Pasaje> pasajes;
            
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
        this.precio = -1;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
