package Logica;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Pasaje implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idPasaje;
    
    @Basic
    int idViaje; 
    int idCliente;
    List <Insumo> listaInsumos = new ArrayList<Insumo>();

    public Pasaje() {
    }

    public Pasaje(int idPasaje, int idViaje, int idCliente) {
        this.idPasaje = idPasaje;
        this.idViaje = idViaje;
        this.idCliente = idCliente;
    }
    
    public int getIdPasaje() {
        return idPasaje;
    }

    public void setIdPasaje(int idPasaje) {
        this.idPasaje = idPasaje;
    }

    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public List<Insumo> getListaInsumos() {
        return listaInsumos;
    }

    public void setListaInsumos(List<Insumo> listaInsumos) {
        this.listaInsumos = listaInsumos;
    }
    
}
