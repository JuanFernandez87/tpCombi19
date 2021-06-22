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
    int idCliente;
    int idViaje;
    int Cantidad;
    int idOrigen;
    int idDestino; 
    String fechaDeViaje;
    int hora;
    int minutos;
    double precio;
    String tipoServicio;
    
    List <Insumo> listaInsumos = new ArrayList<Insumo>();

    public Pasaje() {
    }

    public Pasaje(int idPasaje, int idCliente, int Cantidad, int idOrigen, int idDestino, String fechaDeViaje, int hora, int minutos, double precio, String tipoServicio) {
        this.idPasaje = idPasaje;
        this.idCliente = idCliente;
        this.Cantidad = Cantidad;
        this.idOrigen = idOrigen;
        this.idDestino = idDestino;
        this.fechaDeViaje = fechaDeViaje;
        this.hora = hora;
        this.minutos = minutos;
        this.precio = precio;
        this.tipoServicio = tipoServicio;
    }

    public int getIdPasaje() {
        return idPasaje;
    }

    public void setIdPasaje(int idPasaje) {
        this.idPasaje = idPasaje;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int idCantidad) {
        this.Cantidad = idCantidad;
    }

    public int getIdOrigen() {
        return idOrigen;
    }

    public void setIdOrigen(int idOrigen) {
        this.idOrigen = idOrigen;
    }

    public int getIdDestino() {
        return idDestino;
    }

    public void setIdDestino(int idDestino) {
        this.idDestino = idDestino;
    }

    public String getFechaDeViaje() {
        return fechaDeViaje;
    }

    public void setFechaDeViaje(String fechaDeViaje) {
        this.fechaDeViaje = fechaDeViaje;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public int getMinutos() {
        return minutos;
    }

    public void setMinutos(int minutos) {
        this.minutos = minutos;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public List<Insumo> getListaInsumos() {
        return listaInsumos;
    }

    public void setListaInsumos(List<Insumo> listaInsumos) {
        this.listaInsumos = listaInsumos;
    }

    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }
    
    
}
