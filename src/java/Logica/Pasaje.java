package Logica;

import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
//@Table(name = "pasajes")
public class Pasaje{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idPasaje;
    
    @Basic
    int idCliente;
    int idViaje;
    int Cantidad;
    String origen;
    String destino; 
    int dia;
    int mes;
    int anio;
    int hora;
    int minutos;
    double precio;
    String tipoServicio;
    String estado; //pendiente(si no se inicio), iniciado o finalizado    
    int dni;
    String apellido;
    String nombre;
    
    //@ManyToMany(mappedBy = "pasajes")
    private List <Insumo> insumos;

    public Pasaje() {
    }

    public Pasaje(int idPasaje, int idCliente, int idViaje, int Cantidad, String origen, String destino, int dia, int mes, int anio, int hora, int minutos, double precio, String tipoServicio, String estado, int dni, String apellido, String nombre, List<Insumo> insumos) {
        this.idPasaje = idPasaje;
        this.idCliente = idCliente;
        this.idViaje = idViaje;
        this.Cantidad = Cantidad;
        this.origen = origen;
        this.destino = destino;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
        this.hora = hora;
        this.minutos = minutos;
        this.precio = precio;
        this.tipoServicio = tipoServicio;
        this.estado = estado;
        this.dni = dni;
        this.apellido = apellido;
        this.nombre = nombre;
        this.insumos = insumos;
    }   
    
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }



    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
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

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public void setDestino(String destino) {
        this.destino = destino;
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

    public List<Insumo> getInsumos() {
        return insumos;
    }

    public void setInsumos(List<Insumo> insumos) {
        this.insumos = insumos;
    }
    
    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }
    
    
}
