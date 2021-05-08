package Persistencia;

import Logica.Administrador;
import Logica.Chofer;
import Logica.Cliente;
import Logica.Combi;
import Logica.Insumo;
import Logica.Lugar;
import Logica.Pasaje;
import Logica.Ruta;
import Logica.Tarjeta;
import Logica.Viaje;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    AdministradorJpaController adminJpa = new AdministradorJpaController();
    ChoferJpaController choferJpa = new ChoferJpaController();
    ClienteJpaController clienteJpa = new ClienteJpaController();
    CombiJpaController combiJpa = new CombiJpaController();
    InsumoJpaController insumoJpa = new InsumoJpaController();
    LugarJpaController lugarJpa = new LugarJpaController();
    PasajeJpaController pasajeJpa = new PasajeJpaController();
    RutaJpaController rutaJpa = new RutaJpaController();
    TarjetaJpaController tarjetaJpa = new TarjetaJpaController();
    ViajeJpaController viajeJpa = new ViajeJpaController();
    
    public void crearCliente(Cliente nuevoC){  
        clienteJpa.create(nuevoC);
    }
    
    public void crearViaje(Viaje nuevoV){  
        viajeJpa.create(nuevoV);
    } 
    
    public void crearChofer(Chofer nuevoChofer) {
        choferJpa.create(nuevoChofer);
    } 
    
    public void asignarChofer(Chofer unChofer){
        try {
            choferJpa.edit(unChofer);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }

    public void asignarCombi(Combi unaCombi){
        try {
            combiJpa.edit(unaCombi);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
    
    public void asignarInsumo(Insumo unInsumo){
        try {
            insumoJpa.edit(unInsumo);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }

    public void asignarViaje(Viaje unViaje){
        try {
            viajeJpa.edit(unViaje);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
    
    public void crearCombi(Combi nuevaCombi) {
        combiJpa.create(nuevaCombi);
    }    
    
    public void crearLugar(Lugar nuevoLugar) {
        lugarJpa.create(nuevoLugar);
    }
    
    public void crearInsumo(Insumo nuevoInsumo) {
        insumoJpa.create(nuevoInsumo);
    }    
    
    public List<Administrador> getAdmin() {
        return adminJpa.findAdministradorEntities();
    }
    
    public List<Combi> getCombi() {
        return combiJpa.findCombiEntities();
    }    

    public List<Cliente> getClientes() {
        return clienteJpa.findClienteEntities();
    }

    public List<Chofer> getChoferes() {
        return choferJpa.findChoferEntities();
    }

    public List<Lugar> getLugares() {
        return lugarJpa.findLugarEntities();
    }

    public List<Insumo> getInsumos() {
        return insumoJpa.findInsumoEntities();
    }

    public void crearRuta(Ruta nuevaRuta) {
        rutaJpa.create(nuevaRuta);
    }

    public List getRutas() {
         return rutaJpa.findRutaEntities();
    }

    public List getViaje() {
        return viajeJpa.findViajeEntities();
    }

    public List getInsumo() {
        return insumoJpa.findInsumoEntities();
    }







    
                
}

