package Logica;

import Persistencia.ControladoraPersistencia;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearCliente(String apellido, String nombre, int dni, String mail, String contra, String tipoPlan, String fechaNac){
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setApellido(apellido);
        nuevoCliente.setNombre(nombre);
        nuevoCliente.setDni(dni);
        nuevoCliente.setMail(mail);
        nuevoCliente.setContra(contra);
        nuevoCliente.setTipoPlan(tipoPlan);
        Date date1;   
        try {
            date1 = new SimpleDateFormat("dd/MM/yyyy").parse(fechaNac);
            nuevoCliente.setFecha_nac(date1);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        controlPersis.crearCliente(nuevoCliente);   
    }
    
    public void crearChofer(String apellido, String nombre,int dni, String mail, String contra, int tel){
        Chofer nuevoChofer = new Chofer();
        nuevoChofer.setApellido(apellido);
        nuevoChofer.setNombre(nombre);
        nuevoChofer.setDni(dni);
        nuevoChofer.setMail(mail);
        nuevoChofer.setContra(contra);
        nuevoChofer.setTelefono(tel);
        nuevoChofer.setLibre();
        controlPersis.crearChofer(nuevoChofer);   
    }
    
    public void crearLugar(String nombre, String provincia) {
        Lugar nuevoLugar = new Lugar();
        nuevoLugar.setNombre(nombre);
        nuevoLugar.setProvincia(provincia);
        controlPersis.crearLugar(nuevoLugar);
    }  
    
    public void crearInsumo(String nombre, int precio, String tipo) {
        Insumo nuevoInsumo = new Insumo();
        nuevoInsumo.setNombre(nombre);
        nuevoInsumo.setPrecio(precio);
        nuevoInsumo.setTipo(tipo);
        controlPersis.crearInsumo(nuevoInsumo);
    }
    
    public void crearCombi(String patente, String modelo, int cantAsientos, String tipoServicio, int idChofer) {
        Combi nuevaCombi = new Combi();
        nuevaCombi.setPatente(patente);
        nuevaCombi.setModelo(modelo);
        nuevaCombi.setCantAsientos(cantAsientos);
        nuevaCombi.setTipoServicio(tipoServicio);
        List <Chofer> listaChoferes = new ArrayList <Chofer>();
        listaChoferes = controlPersis.getChoferes();
        Chofer unChofer = null;
         
        for(Chofer chof:listaChoferes){
            if(chof.getIdChofer() == idChofer){
                chof.setOcupado();
                controlPersis.asignarChofer(chof);
                unChofer = chof;
            }
        }
        nuevaCombi.setUnChofer(unChofer);          
        controlPersis.crearCombi(nuevaCombi);    //mirame juancho dame piernas
            }   
    
       
    public boolean verificarChofer(int idChofer) {
        boolean aux = false;            
        List <Chofer> listaChoferes = new ArrayList <Chofer>();   
        listaChoferes = controlPersis.getChoferes();
        for(Chofer unChofer:listaChoferes){
            if(unChofer.getIdChofer() == idChofer && unChofer.ocupado == 0){
                aux = true;
                return aux;
                
            }
        }
        return aux;
    } 
    
    public boolean comprobarIngresoAdmin(String usuario, String contra) {
        boolean aux = false;        
        
        List <Administrador> listaAdmin = new ArrayList <Administrador>();
        
        listaAdmin = controlPersis.getAdmin();
        
        for(Administrador adm:listaAdmin){
            if(adm.getMail().equals(usuario) && adm.getContra().equals(contra)){
                aux = true;
                return aux;
            }
        }
        return aux;
    }    

    public boolean comprobarIngresoCliente(String usuario, String contra) {
        boolean aux = false;        
        
        List <Cliente> listaClientes = new ArrayList <Cliente>();
        
        listaClientes = controlPersis.getClientes();
        
        for(Cliente cli:listaClientes){
            if(cli.getMail().equals(usuario) && cli.getContra().equals(contra)){
                aux = true;
                return aux;
            }
        }
        return aux;
    }
    
        public boolean comprobarIngresoChofer(String usuario, String contra) {
        boolean aux = false;        
        
        List <Chofer> listaChoferes = new ArrayList <Chofer>();
        
        listaChoferes = controlPersis.getChoferes();
        
        for(Chofer chof:listaChoferes){
            if(chof.getMail().equals(usuario) && chof.getContra().equals(contra)){
                aux = true;
                return aux;
            }
        }
        return aux;
    }

    public boolean verificarCombi(String patente) {
        boolean aux = false;        
        
        List <Combi> listaCombi = new ArrayList <Combi>();
        
        listaCombi = controlPersis.getCombi();
        
        for(Combi comb:listaCombi){
            if(comb.getPatente().equals(patente)){
                aux = true;
                return aux;
            }
        }
        return aux;
    }          

    public boolean verificarLugar(String nombre) {
         boolean aux = false;        
        
        List <Lugar> listaLugares = new ArrayList <Lugar>();
        
        listaLugares = controlPersis.getLugares();
        
        for(Lugar lugar:listaLugares){
            if(lugar.getNombre().equals(nombre)){
                aux = true;
                return aux;
            }
        }
        return aux;
    } 

    public boolean verificarInsumo(String nombre) {
          boolean aux = false;        
        
        List <Insumo> listaInsumos = new ArrayList <Insumo>();
        
        listaInsumos = controlPersis.getInsumos();
        
        for(Insumo insumo:listaInsumos){
            if(insumo.getNombre().equals(nombre)){
                aux = true;
                return aux;
            }
        }
        return aux;
    } 

    public List<Chofer> devolverListaChoferes() {
        List listaChoferes = controlPersis.getChoferes();
        return listaChoferes;
    }

    public List<Combi> devolverListaCombi() {
        List listaCombi = controlPersis.getCombi();
        return listaCombi;
    }
    
    public List<Lugar> devolverListaLugares() {
        List listaLugares = controlPersis.getLugares();
        return listaLugares;
    }
    
    public List<Ruta> devolverRutas(){
        List listaRuta = controlPersis.getRutas();
        return listaRuta;
    }
    
      public List<Viaje> devolverListaViajes() {
        List listaViajes = controlPersis.getViaje();
        return listaViajes;
    }
    
    
    public void crearRuta(String origen, String destino, String patenteCombi, int distancia) {
        Ruta unaRuta = new Ruta();
        int idOrigen = 0;
        int idDestino = 0;
        int unaCombi = 0;   
        
        List <Lugar> listaLugares = new ArrayList <Lugar>();
        listaLugares = controlPersis.getLugares();

        for(Lugar lugar:listaLugares){
            if(lugar.getNombre().equals(origen)){
                idOrigen = lugar.getIdLugar();
            }
            if(lugar.getNombre().equals(destino))
                idDestino = lugar.getIdLugar();
        }
        
        List <Combi> listaCombi = new ArrayList <Combi>();
        listaCombi = controlPersis.getCombi();

        for(Combi combis:listaCombi){
            if(combis.getPatente().equals(patenteCombi)){
                unaCombi = combis.getIdCombi();
            }
        }    
        unaRuta.setOrigen(idOrigen);
        unaRuta.setDestino(idDestino);
        unaRuta.setIdCombi(unaCombi);
        unaRuta.setDistancia(distancia); 
        controlPersis.crearRuta(unaRuta);
    }
    
 }
