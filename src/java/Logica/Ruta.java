package Logica;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Time;
import javax.persistence.Basic;

@Entity
public class Ruta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    int idRuta;
    
    @Basic
    int hora;
    int minutos;
    int distancia;
        
    int origen;    
    int destino;
    int idCombi;

    public Ruta() {
    }

    public Ruta(int idRuta, int origen, int destino, int hora, int minutos, int idCombi, int distancia) {
        this.idRuta = idRuta;
        this.origen = origen;
        this.destino = destino;
        this.hora = hora;
        this.minutos = minutos;
        this.distancia = distancia;
        this.idCombi = idCombi;
    }

    public int getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(int idRuta) {
        this.idRuta = idRuta;
    }

    public int getOrigen() {
        return origen;
    }

    public void setOrigen(int origen) {
        this.origen = origen;
    }

    public int getDestino() {
        return destino;
    }

    public void setDestino(int destino) {
        this.destino = destino;
    }

    public int getIdCombi() {
        return idCombi;
    }

    public void setIdCombi(int idCombi) {
        this.idCombi = idCombi;
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

    public int getDistancia() {
        return distancia;
    }

    public void setDistancia(int distancia) {
        this.distancia = distancia;
    }

    void setBorradoLogico() {
        this.distancia = -1;
    }

 
}
