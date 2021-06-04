package Logica;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Tarjeta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idTarjeta;
    
    @Basic
    String entidad;
    int numero;
    String vencimiento;
    int CCV;

    public Tarjeta() {
    }

    public Tarjeta(int idTarjeta, String entidad, int numero, String vencimiento, int CCV) {
        this.idTarjeta = idTarjeta;
        this.entidad = entidad;
        this.numero = numero;
        this.vencimiento = vencimiento;
        this.CCV = CCV;
    }

    public String getVencimiento() {
        return vencimiento;
    }

    public void setVencimiento(String vencimiento) {
        this.vencimiento = vencimiento;
    }

    public int getCCV() {
        return CCV;
    }

    public void setCCV(int CCV) {
        this.CCV = CCV;
    }

    
    
    public int getIdTarjeta() {
        return idTarjeta;
    }

    public void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getEntidad() {
        return entidad;
    }

    public void setEntidad(String entidad) {
        this.entidad = entidad;
    }
  

    
    
}
