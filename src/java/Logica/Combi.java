package Logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Combi implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idCombi;
    
    @Basic
    String modelo;
    String patente;
    int cantAsientos;
    String tipoServicio;
    
    @OneToOne
    Chofer unChofer;
    /*@OneToMany
    Ruta unaRuta;*/
    
    public Combi() {
    }

    public Combi(int idCombi, String modelo, String patente, int cantAsientos, String tipoServicio, Chofer unChofer) {
        this.idCombi = idCombi;
        this.modelo = modelo;
        this.patente = patente;
        this.cantAsientos = cantAsientos;
        this.tipoServicio = tipoServicio;
        this.unChofer = unChofer;
    }

    public int getIdCombi() {
        return idCombi;
    }

    public void setIdCombi(int idCombi) {
        this.idCombi = idCombi;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCantAsientos() {
        return cantAsientos;
    }

    public void setCantAsientos(int cantAsientos) {
        this.cantAsientos = cantAsientos;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public Chofer getUnChofer() {
        return unChofer;
    }

    public void setUnChofer(Chofer unChofer) {
        this.unChofer = unChofer;
    }
 }
