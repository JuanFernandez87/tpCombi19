package Logica;

import Persistencia.ControladoraPersistencia;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;


public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearCliente(String apellido, String nombre, int dni, String mail, String contra, String tipoPlan, int dia, int mes, int anio, boolean enSesion){
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setApellido(apellido);
        nuevoCliente.setNombre(nombre);
        nuevoCliente.setDni(dni);
        nuevoCliente.setMail(mail);
        nuevoCliente.setContra(contra);
        nuevoCliente.setTipoPlan(tipoPlan);
        nuevoCliente.setIdTarjeta(0);
        nuevoCliente.setDia(dia);
        nuevoCliente.setMes(mes);
        nuevoCliente.setAnio(anio);
        nuevoCliente.setEnSesion(enSesion);
        nuevoCliente.setEstado("Habilitado");
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
        nuevoChofer.setIdCombi(0);
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
        nuevoInsumo.setCantidad(0);
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
                unChofer = chof;
            }
        }
        
        nuevaCombi.setUnChofer(unChofer);          
        controlPersis.crearCombi(nuevaCombi);  
        unChofer.setIdCombi(nuevaCombi.getIdCombi());
        controlPersis.asignarChofer(unChofer);        
            }   
    
       
    public boolean verificarChofer(int idChofer) {
        boolean aux = false;            
        List <Chofer> listaChoferes = new ArrayList <Chofer>();   
        listaChoferes = controlPersis.getChoferes();
        for(Chofer unChofer:listaChoferes){
            if(unChofer.getIdChofer() == idChofer && unChofer.getIdCombi() == 0){
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
        List <Cliente> listaClientes = controlPersis.getClientes();
        for(Cliente cli:listaClientes){
            if(cli.getMail().equals(usuario) && cli.getContra().equals(contra)){
                aux = true;
                cli.setEnSesion(true);
                 controlPersis.asignarCliente(cli); 
                return aux;
            }
        }
        return aux;
    }
    

    public boolean crearComentario(String comentario, int id) {
            
            List <Cliente> listaClientes = controlPersis.getClientes();
        
            for(Cliente cli:listaClientes){
                 if(id == cli.getIdCliente()){
                     cli.agregarComentario(comentario);
                     controlPersis.asignarCliente(cli); 
        }
            
      }
            return true;
    }
    
    
    public boolean eliminarComentario(int comentario, int id) {
            
            List <Cliente> listaClientes = controlPersis.getClientes();
        
            for(Cliente cli:listaClientes){
                 if(id == cli.getIdCliente()){
                     cli.eliminarComentario(comentario);
                     controlPersis.asignarCliente(cli); 
        }
            
      }
            return true;
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
    
    public List<Cliente> devolverListaClientes() {
        List listaClientes = controlPersis.getClientes();
        return listaClientes;
    }
    public List<Tarjeta> devolverListaTarjetas() {
        List listaTarjeta = controlPersis.getTarjetas();
        return listaTarjeta;
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
    
    public List<Insumo> devolverListaInsumos(){
        List listaInsumos = controlPersis.getInsumo();
        return listaInsumos;
    }
    
    public List<Administrador> devolverListaAdmin(){
        List listaAdmin = controlPersis.getAdmin();
        return listaAdmin;
    }    
    
     public List<Pasaje> devolverListaPasajes() {
       List listaPasaje = controlPersis.getPasaje();
        return listaPasaje;
    }
    
    public void crearRuta(String origen, String destino, String patenteCombi, int distancia, int hora, int minutos) {
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
        unaRuta.setHora(hora);
        unaRuta.setMinutos(minutos);
        unaRuta.setOrigen(idOrigen);
        unaRuta.setDestino(idDestino);
        unaRuta.setIdCombi(unaCombi);
        unaRuta.setDistancia(distancia); 
        controlPersis.crearRuta(unaRuta);
    }
    


    public boolean verificarViaje(int idRuta, int dia, int mes, int anio) {
        boolean aux = false;
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje();
        for(Viaje unViaje:listaViajes){
            if((unViaje.getIdRuta() == idRuta) && (unViaje.getDia() == dia) && (unViaje.getMes() == mes) && (unViaje.getAnio() == anio)){
                aux = true;
            }
        } 
        return aux;
    }
    
    public boolean verificarAsientos(int cantAsientos, int idRuta) {
        boolean aux = false;
        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas();        
        int idCombi = 0;
        for(Ruta unaRuta:listaRutas){
            if(unaRuta.getIdRuta() == idRuta){
                idCombi = unaRuta.getIdCombi();
            }
        }
        List <Combi> listaCombis = new ArrayList <Combi>();
        listaCombis = controlPersis.getCombi();        
        for(Combi unaCombi:listaCombis){
            if(unaCombi.getIdCombi() == idCombi){
                if(unaCombi.getCantAsientos() >= cantAsientos){
                    aux = true;
                }
            }
        }
        
        
        
        return aux;
    }    

    public void crearViaje(int idRuta, int cantAsientos, int dia, int mes, int anio, int precio) {
        Viaje nuevoViaje = new Viaje();
        nuevoViaje.setIdRuta(idRuta);
        nuevoViaje.setCantAsientos(cantAsientos);
        nuevoViaje.setDia(dia);
        nuevoViaje.setMes(mes);
        nuevoViaje.setAnio(anio);
        nuevoViaje.setArregloIdPasajes(cantAsientos);
        nuevoViaje.setEstado("Pendiente");
        /*Date date1;   
        try {
            date1 = new SimpleDateFormat("dd/MM/yyyy").parse(fechaViaje);
            nuevoViaje.setFecha(date1);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }*/
        nuevoViaje.setPrecio(precio);
        controlPersis.crearViaje(nuevoViaje);
    }
   
    public void registrarTarjeta(String numeroTarjeta, int codigo, String fechaVenc, String nombre) {
        Tarjeta nuevaTarjeta = new Tarjeta();
        nuevaTarjeta.setNumero(numeroTarjeta);
        nuevaTarjeta.setCCV(codigo);
        nuevaTarjeta.setVencimiento(fechaVenc);
        nuevaTarjeta.setNombre(nombre);
        controlPersis.crearTarjeta(nuevaTarjeta);
    }    
    
    public void eliminarChofer(int idChofer) {
        List <Chofer> listaChoferes = new ArrayList <Chofer>();
        listaChoferes = controlPersis.getChoferes(); 
        for(Chofer chof:listaChoferes){
            if(chof.getIdChofer() == idChofer){
                chof.setBorradoLogico();
                controlPersis.asignarChofer(chof);
            }
        }
    }
    
    public void eliminarLugar(int idLugar) {
        List <Lugar> listaLugares = new ArrayList <Lugar>();
        listaLugares = controlPersis.getLugares(); 
        for(Lugar lugar:listaLugares){
            if(lugar.getIdLugar() == idLugar){
                lugar.setBorradoLogico();
                controlPersis.asignarLugar(lugar);
            }
        }
    }

    public void eliminarCombi(int idCombi) {
        List <Combi> listaCombis = new ArrayList <Combi>();
        listaCombis = controlPersis.getCombi(); 
        for(Combi comb:listaCombis){
            if(comb.getIdCombi() == idCombi){
                comb.setBorradoLogico();
                controlPersis.asignarCombi(comb);
            }
        }
    }

    public void eliminarInsumo(int idInsumo) {
        List <Insumo> listaInsumo = new ArrayList <Insumo>();
        listaInsumo = controlPersis.getInsumo(); 
        for(Insumo ins:listaInsumo){
            if(ins.getIdInsumo() == idInsumo){
                ins.setBorradoLogico();
                controlPersis.asignarInsumo(ins);
            }
        }
    }

    public void eliminarViaje(int idViaje) {
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdViaje() == idViaje){
                viaje.setBorradoLogico();
                controlPersis.asignarViaje(viaje);
            }
        }
    }
    
    public void eliminarRuta(int idRuta) {
        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas(); 
        for(Ruta ruta:listaRutas){
            if(ruta.getIdRuta() == idRuta){
                ruta.setBorradoLogico();
                controlPersis.asignarRuta(ruta);
            }
        }
    }    

      
    
    public boolean chequearRutaLibre(int idRuta) {
        boolean aux = false;
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdRuta() == idRuta){
                return aux = true;
            }
        }
        return aux;
    }    
    
    public boolean chequearChoferLibre(int idChofer) {
        boolean aux = false;

        List <Chofer> listaChoferes = new ArrayList <Chofer>();
        listaChoferes = controlPersis.getChoferes(); 
        int idCombi = 0;
        for(Chofer chof:listaChoferes){
            if(chof.getIdChofer() == idChofer){
                idCombi = chof.getIdCombi();
            }
        }   
        
        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas();        
        int idRuta = 0;
        for(Ruta unaRuta:listaRutas){
            if(unaRuta.getIdCombi() == idCombi){
                idRuta = unaRuta.getIdRuta();
            }
        }         
        
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdRuta() == idRuta){
                return aux = true;
            }
        }
        return aux;        
        }
    
        public boolean chequearLugarLibre(int idLugar) {
        boolean aux = false;

        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas();        
        int idRuta = 0;
        for(Ruta unaRuta:listaRutas){
            if((unaRuta.getOrigen() == idLugar) || (unaRuta.getDestino() == idLugar)){
                idRuta = unaRuta.getIdRuta();
            }
        }         
        
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdRuta() == idRuta){
                return aux = true;
            }
        }
        return aux;        
}
    
    public boolean verViajeActivo(int idLugar) {
        boolean aux = false;        
        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas();        
        int idRuta = 0;
        for(Ruta unaRuta:listaRutas){
            if((unaRuta.getOrigen() == idLugar) || (unaRuta.getDestino() == idLugar)){
                idRuta = unaRuta.getIdRuta();
            }
        }         
        
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdRuta() == idRuta){
                return aux = true;
            }
        }
        return aux;        
        }
    
    public boolean chequearCombiLibre(int idCombi) {
        // actualmente, el codigo funciona de la siguiente manera ->
        // no te deja eliminar una combi solo si esta asignado a un viaje. 
        //el problema: Que si la combi esta asignado a una ruta se elimina igual. y en listado de ruta se muestra la patente en -1.
        // voy a poner el return true cuando encuentre que la combi esta asignada a una ruta. 
        // con esto se soluciona ese error.
        // para volver el codigo al estado actual eliminar el "return true" y descomentar lo comentado.
        boolean aux = false;
        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas();        
        int idRuta = 0;
        for(Ruta unaRuta:listaRutas){
            if(unaRuta.getIdCombi() == idCombi){
                //idRuta = unaRuta.getIdRuta();
                return aux = true;
            }
        }
        return aux;        
        }
    
    public void desasignarChofer(int idCombi) {
        List <Chofer> listaChoferes = new ArrayList <Chofer>();
        listaChoferes = controlPersis.getChoferes(); 
        for(Chofer chof:listaChoferes){
            if(chof.getIdCombi() == idCombi){
                chof.setIdCombi(0);
                controlPersis.asignarChofer(chof);
            }
        }
    }        

    public int idCliente(String mail) {
        int idCliente = 0;
        List <Cliente> listaClientes = controlPersis.getClientes();
        for (Cliente cli:listaClientes){    
            if(cli.getMail().equals(mail)){
                idCliente = cli.getIdCliente();
            }
        }    
        return idCliente;    
    }
    
    public boolean verificarUsuario(String mail) {
        List <Cliente> listaClientes = controlPersis.getClientes();
        boolean aux= false;
        for (Cliente cli:listaClientes){    
            if(cli.getMail().equals(mail)){
                aux = true;
               return aux;
            }
        }
        return aux;
    }

    public boolean verificarContraseña(String contra) {
        boolean aux = false;
       if (contra.length()>= 6){
           aux = true;
           return aux;
       }
       return aux;
    }

    public boolean verificarChofer(String mail) {
        List <Chofer> listaChoferes = controlPersis.getChoferes();
        boolean aux= false;
        for (Chofer chof:listaChoferes){    
            if(chof.getMail().equals(mail)){
                aux = true;
               return aux;
            }
        }
        return aux;
    }

   
    public void ModificarInsumo(int idInsumo, String nombre, int precio, String tipo) {
        List <Insumo> listaInsumos = controlPersis.getInsumos(); 
        for (Insumo ins:listaInsumos) { 
            if(ins.getIdInsumo() == idInsumo){ 
                ins.setNombre(nombre);
                ins.setPrecio(precio);
                ins.setTipo(tipo);
                controlPersis.asignarInsumo(ins);
            }
        }                     
    }

    public void modificarChofer(int idChofer, String apellido, String nombre, int dni, String mail, String pass, int telefono) {
        List <Chofer> listaChoferes = controlPersis.getChoferes();
        for (Chofer unChofer:listaChoferes) { 
            if(unChofer.getIdChofer() == idChofer){ 
                unChofer.setApellido(apellido);
                unChofer.setNombre(nombre);
                unChofer.setDni(dni);
                unChofer.setMail(mail);
                unChofer.setContra(pass);
                unChofer.setTelefono(telefono);
                controlPersis.asignarChofer(unChofer);
            }
        }         
    }
    
    public void modificarCliente(int idCliente, String apellido, String nombre, int dni , String pass, String mail, int dia, int mes, int anio) {
         List <Cliente> listaClientes = controlPersis.getClientes();
        for (Cliente unCliente:listaClientes) { 
            if(unCliente.getIdCliente() == idCliente){ 
                unCliente.setApellido(apellido);
                unCliente.setNombre(nombre);
                unCliente.setDni(dni);
                unCliente.setContra(pass);
                unCliente.setMail(mail);
                unCliente.setDia(dia);
                unCliente.setMes(mes);
                unCliente.setAnio(anio);
                controlPersis.asignarCliente(unCliente);
            }
        }         
    } 
    
    public void modificarPlan(int idCliente) {
        int idTarjeta = 0;
        List <Cliente> listaClientes = controlPersis.getClientes();
        for (Cliente unCliente:listaClientes) { 
            if(unCliente.getIdCliente() == idCliente){ 
                unCliente.setTipoPlan("Basico");
                unCliente.setIdTarjeta(0);
                idTarjeta = unCliente.getIdTarjeta();
                controlPersis.asignarCliente(unCliente);
            }
        } 
        List <Tarjeta> listaTarjetas = controlPersis.getTarjetas();
        for (Tarjeta unaTarjeta:listaTarjetas) { 
            if(unaTarjeta.getIdTarjeta() == idTarjeta){ 
                unaTarjeta.setNumero("0");
                controlPersis.asignarTarjeta(unaTarjeta);
            }                
        }    
    }   
       
    public void modificarRuta(int idRuta, int idOrigen, int idDestino, int idCombi, int distancia, int hora, int minutos) {
        List <Ruta> listaRuta = controlPersis.getRutas();
        for (Ruta unaRuta:listaRuta){
            if(unaRuta.getIdRuta() == idRuta){
                 unaRuta.setOrigen(idOrigen);
                 unaRuta.setDestino(idDestino);
                 unaRuta.setDistancia(distancia);
                 unaRuta.setHora(hora);
                 unaRuta.setMinutos(minutos);
                 unaRuta.setIdCombi(idCombi);
                 controlPersis.asignarRuta(unaRuta);
            }
        }
        
    }
    
    public void modificarViaje(int idViaje, int idRuta, int cantAsientos, int dia, int mes, int anio, int precio) {
        List <Viaje> listaViaje = controlPersis.getViaje();
        for (Viaje unViaje:listaViaje){
            if(unViaje.getIdViaje() == idViaje){
                unViaje.setIdRuta(idRuta);
                unViaje.setCantAsientos(cantAsientos);
                unViaje.setDia(dia);
                unViaje.setMes(mes);
                unViaje.setAnio(anio);
                unViaje.setPrecio(precio);
                controlPersis.asignarViaje(unViaje);    
            }
        }    
    }        
   
    public void modificarCombi(int idCombi, String patente, String modelo, int capacidad, String tipoServicio, int idChofer) {
        List <Combi> listaCombis = controlPersis.getCombi();
        for (Combi unaCombi:listaCombis) { 
            if(unaCombi.getIdCombi() == idCombi){ 
                unaCombi.setPatente(patente);
                unaCombi.setModelo(modelo);
                unaCombi.setCantAsientos(capacidad);
                unaCombi.setTipoServicio(tipoServicio);
            if(unaCombi.getUnChofer().getIdChofer() != idChofer){
                desasignarChofer(unaCombi.getIdCombi());
                List <Chofer> listaChoferes = controlPersis.getChoferes();
                for (Chofer unChofer:listaChoferes) { 
                    if(unChofer.getIdChofer() == idChofer){
                        unChofer.setIdCombi(unaCombi.getIdCombi());
                        controlPersis.asignarChofer(unChofer);
                        unaCombi.setUnChofer(unChofer);
                    }
                }
            }    
                controlPersis.asignarCombi(unaCombi);
            }
        } 
    }
    
    public void modificarLugar(int idLugar, String nombre, String provincia) {
        List <Lugar> listalugares = controlPersis.getLugares(); 
        for (Lugar unLugar:listalugares) { 
            if(unLugar.getIdLugar() == idLugar){
                unLugar.setNombre(nombre);
                unLugar.setProvincia(provincia);
                controlPersis.asignarLugar(unLugar);
            } 
        }   
    }    

    public boolean verificarNombre(int idInsumo, String nombre) {
        boolean aux = false;
        List <Insumo> listaInsumos = controlPersis.getInsumos(); 
        for (Insumo ins:listaInsumos) { 
            if(ins.getIdInsumo() == idInsumo){ 
                if (ins.getNombre().equals(nombre)){
                    aux = true;
                    return aux;
                }
            }
        } 
        return aux;
    }

    public boolean verificarMailChofer(int idChofer, String mail) {
        boolean aux = false;
        List <Chofer> listaChoferes = controlPersis.getChoferes(); 
        for (Chofer chof:listaChoferes) { 
            if(chof.getIdChofer() == idChofer){ 
                if (chof.getMail().equals(mail)){
                    aux = true;
                    return aux;
                }
            }
        } 
        return aux;
    }
    
    public boolean verificarMailCliente(int idCliente, String mail) {
        boolean aux = false;
        List <Cliente> listaClientes = controlPersis.getClientes(); 
        for (Cliente unCliente:listaClientes) { 
            if(unCliente.getIdCliente() == idCliente){ 
                if (unCliente.getMail().equals(mail)){
                    aux = true;
                    return aux;
                }
            }
        } 
        return aux;    }    

    public boolean verificarPatente(int idCombi, String patente) {
        boolean aux = false;
        List <Combi> listaCombis = controlPersis.getCombi(); 
        for (Combi comb:listaCombis) { 
            if(comb.getIdCombi() == idCombi){ 
                if (comb.getPatente().equals(patente)){
                    aux = true;
                    return aux;
                }
            }
        } 
        return aux;
    }    

    public boolean verificarLugar( String nombre, String provincia) {
        boolean aux = false;
        List <Lugar> listalugares = controlPersis.getLugares(); 
        for (Lugar unLugar:listalugares) { 
                if (unLugar.getNombre().equals(nombre) && (unLugar.getProvincia().equals(provincia))){
                    aux = true;
                    return aux;
                }
        }
        return aux;
    }

    public int capacidadCombi(int idRuta) {
        int capacidad = 0;
        int idCombi = 0;
        List <Ruta> listaRutas = controlPersis.getRutas();        
        for(Ruta unaRuta:listaRutas){
            if(unaRuta.getIdRuta() == idRuta){
                idCombi = unaRuta.getIdCombi();
            }
        }         
        
        List <Combi> listaCombi = controlPersis.getCombi();        
        for(Combi unaCombi:listaCombi){
            if(unaCombi.getIdCombi() == idCombi){
                capacidad = unaCombi.getCantAsientos();
                return capacidad;
            }
        }
        return capacidad;
    }

    public boolean verificarBajaLogica(String mail) {
         List <Chofer> listaChoferes = controlPersis.getChoferes(); 
         // se hacen dos for xq surgia el problema de que cuando el mail estaba cargado en  el sistema
         // y tambien se encontraba con una version vieja de carga con baja logica, no se verificaba correctamente y cargaba los datos igual, aunque el mail este registrado sin baja logica.
         // primer for: si el mail ingresado se encuentra en el sistema, y no tiene baja logica, devuelve false para mostrar correctamente mensaje de mail ya registrado.
          for(Chofer chof:listaChoferes){
              if (chof.getMail().equals(mail)){
                  if(chof.getDni()!= -1){
                    return false;
                    }
              }
            
        }// si el mail ingresado se encuentra en el sistema, pero con baja  logica el siguiente for devuelve true y carga el mail ingresado.
                    for(Chofer chof:listaChoferes){
              if (chof.getMail().equals(mail)){
                  if(chof.getDni()== -1){
                    return true;
                    }
              }
            
        }
        return false;
    }

    public boolean verificarViaje(int idRuta) {
        boolean aux = false;
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdRuta() == idRuta){
                return aux = true;
            }
        }
        return aux;        
        }

    public boolean verificarExistencia(String numeroTarjeta) {
        boolean aux = false;
        List <Tarjeta> listaTarjetas = controlPersis.getTarjeta(); 
        for(Tarjeta unaTarjeta:listaTarjetas){
            if(unaTarjeta.getNumero().equals(numeroTarjeta)){
                return aux = true;
            }
        }
        return aux;        
        }

    public int idTarjeta(String numeroTarjeta) {
        int aux = 0;
        List <Tarjeta> listaTarjetas = controlPersis.getTarjeta(); 
        for(Tarjeta unaTarjeta:listaTarjetas){
            if(unaTarjeta.getNumero() == numeroTarjeta){
                return aux = unaTarjeta.getIdTarjeta();
            }
        }
        return aux;        
        }
 

    public void asignarTarjetaCliente(int idCliente, int idTarjeta) {
        List <Cliente> listaClientes = controlPersis.getClientes();
        for(Cliente cli:listaClientes){
            if(cli.getIdCliente() == idCliente){
                cli.setTipoPlan("Gold");
                cli.setIdTarjeta(idTarjeta);
                controlPersis.asignarCliente(cli);
            }
        }
    }

    public boolean rutaCargada(String origen, String destino, String patenteCombi, int hora, int minutos) {
        List <Lugar> listaLugar = controlPersis.getLugares();
        List <Combi> listaCombis = controlPersis.getCombi();
        //String nomyprov= "";
        int idOrigen = 0;
        int idDestino= 0;
        int idCombi = 0;
        // obtenemos el id de el origen y destino, el cual recibimos como string.
        for(Lugar lug:listaLugar){
            //nomyprov = (lug.getNombre()+lug.getProvincia()); esta variable es necesaria para la comparacion en caso de aplicar el formato " LaPlata-BuenosAires"
             if(lug.getNombre().equals(origen)){
                 idOrigen= lug.getIdLugar();
             }else{
                 if (lug.getNombre().equals(destino)){
                     idDestino=lug.getIdLugar();
                 }
             }
         }
        for(Combi unaCombi:listaCombis){
            if(unaCombi.getPatente().equals(patenteCombi)){
                idCombi=unaCombi.getIdCombi();
            }
        }
        //usamos los id de origen y destino para comprobar si no estan cargados en otras rutas.
        List <Ruta> listaRutas = controlPersis.getRutas();
        boolean cargados = false;
         for(Ruta rut:listaRutas){
             if ((idOrigen == rut.getOrigen()) && (idDestino == rut.getDestino()) && (rut.getIdCombi() == idCombi) && (rut.getDistancia()>0) && (rut.getHora() == hora) && (rut.getMinutos() == minutos)){ // si estan cargados en el sistema entonces....
                 cargados= true;
             }
         }
         return cargados;
    }
    
    public boolean rutaCargada2(int idRuta, int idOrigen, int idDestino, int idCombi, int hora, int minutos) {
        List <Ruta> listaRutas = controlPersis.getRutas();
        boolean cargados = false;
         for(Ruta rut:listaRutas){
             if ((idOrigen == rut.getOrigen()) && (idDestino == rut.getDestino()) && (rut.getIdCombi() == idCombi) && (rut.getDistancia()>0) && (rut.getHora() == hora) && (rut.getMinutos() == minutos)){ // si estan cargados en el sistema entonces....
                 cargados= true;
             }
         }
         return cargados;
    }    

    public boolean verificarPasajeDisp(String origen, String destino, int dia, int mes, int anio) {
        List <Viaje> listaViajes = controlPersis.getViaje();
        List <Ruta> listaRutas = controlPersis.getRutas();
         List <Lugar> listaLugar = controlPersis.getLugares();
         List <Combi> listaCombi = controlPersis.getCombi();
         boolean cumple= false;
        String origenRuta= "";
        String destinoRuta= "";
        String origenLugar="";
        String destinoLugar="";
        String tipoServicio = "";
        int hora=0;
        for(Viaje viaje:listaViajes){
            for (Ruta ruta:listaRutas){
                for (Lugar lugar:listaLugar){ // obtenemos el nombre de origen y destino de cada ruta.
                    if(lugar.getIdLugar()== ruta.getOrigen()){
                        origenLugar= lugar.getNombre();
                    } else{
                        if(lugar.getIdLugar() == ruta.getDestino()){
                            destinoLugar= lugar.getNombre();
                        }
                    }
                 // si la ruta actual corresponde al viaje actual-> guardamos el nombre de las ciudades origen y destino.      
                     if(ruta.getIdRuta() == viaje.getIdRuta()){
                     origenRuta = origenLugar;
                     destinoRuta = destinoLugar;
                     hora= ruta.getHora();
                    }   
                }
                for (Combi combi: listaCombi){
                    if (combi.getIdCombi() == ruta.getIdCombi()){
                        tipoServicio= combi.getTipoServicio();
                    }
                }
                 
            }    
            // preguntamos para cada viaje.> si cumple con los datos que se ingresaron en pantalla.
            if(viaje.getAnio()==anio && viaje.getMes()== mes && viaje.getDia()== dia && origenRuta.equals(origen) && destinoRuta.equals(destino)){
                return cumple = true;
            }
            
        }
        return cumple;
    }

    public void iniciarSesion(boolean b) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void eliminarTarjeta(int idCliente) {
        List <Tarjeta> listaTarjetas = controlPersis.getTarjeta();
        List <Cliente> listaClientes = controlPersis.getClientes();
        int idTarjeta = 0;
        for(Cliente unCliente:listaClientes){
            if(unCliente.getIdCliente() == idCliente)
                idTarjeta = unCliente.getIdTarjeta();
        }        
        for(Tarjeta unaTarjeta:listaTarjetas){
            if(unaTarjeta.getIdTarjeta() == idTarjeta){
                unaTarjeta.setNumero("");
                controlPersis.asignarTarjeta(unaTarjeta);
            }
        }
    }

    public void cambiarPlan(int idCliente) {
        List <Cliente> listaClientes = controlPersis.getClientes();
        for(Cliente unCliente:listaClientes){
            if(unCliente.getIdCliente() == idCliente)
                unCliente.setIdTarjeta(0);
                unCliente.setTipoPlan("Basico");
                controlPersis.asignarCliente(unCliente);
        } 
    }

    public boolean verificarViajeCombi(int idCombi) {
        boolean aux = false;
        List <Ruta> listaRutas = new ArrayList <Ruta>();
        listaRutas = controlPersis.getRutas();        
        int idRuta = 0;
        for(Ruta unaRuta:listaRutas){
            if(unaRuta.getIdCombi() == idCombi){
                idRuta = unaRuta.getIdRuta();
            }
        }         
        
        List <Viaje> listaViajes = new ArrayList <Viaje>();
        listaViajes = controlPersis.getViaje(); 
        for(Viaje viaje:listaViajes){
            if(viaje.getIdRuta() == idRuta){
                return aux = true;
            }
        }
        return aux;        
    }

    public void crearPasaje(int idCliente, int idViaje, int cantPasajes, int precioTotal, List<Insumo> listaInsumos){
        Pasaje nuevoPasaje = new Pasaje();
        List <Viaje> listaViajes = controlPersis.getViaje();
        List <Combi> listaCombi = controlPersis.getCombi();
        List <Lugar> listaLugar = controlPersis.getLugares();
        List <Ruta> listaRuta = controlPersis.getRutas();
        int idRuta = 0;
        int min,hora;
                int idCombi= 0;
                int idDestino = 0;
                int idOrigen= 0;
                int precio = 0;
        String tipoServicio = "";
        for (Viaje viaje: listaViajes){
            if(viaje.getIdViaje() == idViaje){
                 idRuta = viaje.getIdRuta();
                 nuevoPasaje.setDia(viaje.getDia());
                 nuevoPasaje.setMes(viaje.getMes());
                 nuevoPasaje.setAnio(viaje.getAnio());
 
            }
        }
        for (Ruta ruta: listaRuta){
            if (ruta.getIdRuta()== idRuta){
                nuevoPasaje.setHora(ruta.getHora());
                nuevoPasaje.setMinutos(ruta.getMinutos());
                idOrigen = ruta.getOrigen();
                idDestino = ruta.getDestino();
                idCombi = ruta.getIdCombi();
            }
        }
        for (Combi combi: listaCombi){
            if (combi.getIdCombi() == idCombi){
                nuevoPasaje.setTipoServicio(combi.getTipoServicio());
            }
        }
        for (Lugar lugar: listaLugar){
            if (lugar.getIdLugar() == idOrigen){
                nuevoPasaje.setOrigen(lugar.getNombre());
            }else{
                if (lugar.getIdLugar() == idDestino){
                    nuevoPasaje.setDestino(lugar.getNombre());
                }
            }
        }
        List <Cliente> listaClientes = controlPersis.getClientes();
        String nombre = "";
        String apellido = "";
        int dni = 0;
        for (Cliente cliente: listaClientes){
            nombre = cliente.getNombre();
            apellido =cliente.getApellido();
            dni = cliente.getDni();
        }
        
         nuevoPasaje.setEstado("Pendiente");
         nuevoPasaje.setInsumos(listaInsumos);      
         nuevoPasaje.setPrecio(precioTotal);
         nuevoPasaje.setIdViaje(idViaje); 
         nuevoPasaje.setIdCliente(idCliente);
         nuevoPasaje.setCantidad(cantPasajes);
         nuevoPasaje.setDni(dni);
         nuevoPasaje.setApellido(apellido);
         nuevoPasaje.setNombre(nombre);
         controlPersis.crearPasaje(nuevoPasaje);   
     }
 
 public void crearPasajeAcompañante(String nombre, String apellido, int dni,int idViajeComprado){
        Pasaje nuevoPasaje = new Pasaje();     
         nuevoPasaje.setEstado("Pendiente");    
         nuevoPasaje.setApellido(apellido);
         nuevoPasaje.setNombre(nombre);
         nuevoPasaje.setDni(dni);
         nuevoPasaje.setIdViaje(idViajeComprado);
         controlPersis.crearPasaje(nuevoPasaje);   
     }

    public boolean chequearViajeSinPasajes(int idViaje) {
        boolean aux = false;
        List <Pasaje> listaPasajes = controlPersis.getPasajes();
        for(Pasaje unPasaje:listaPasajes){
            if(unPasaje.getIdViaje() == idViaje){
                return aux = true;
            }
        }        
        return aux;
    }

    public boolean chequearInsumoSinPasajes(int idInsumo) {
        boolean aux = false;
        List <Pasaje> listaPasajes = controlPersis.getPasajes();
        List <Insumo> listaInsumos = controlPersis.getInsumos();
        for(Pasaje unPasaje:listaPasajes){
            listaInsumos = unPasaje.getInsumos();
            for(Insumo unInsumo: listaInsumos){
                if(unInsumo.getIdInsumo() == idInsumo){
                    aux = true;
                }
            }
        }
        return aux;
    }

    public boolean tienePasaje(int idCliente) {
        boolean aux = false;
        List <Pasaje> listaPasajes = controlPersis.getPasajes();
        for(Pasaje unPasaje:listaPasajes){
            if(unPasaje.idCliente == idCliente){
                    aux = true;
                }
        }
        return aux;
    }

    public void SuspenderCliente(int idCliente, String estadoActual) {
        List <Cliente> listaClientes = controlPersis.getClientes();
        for(Cliente unCliente:listaClientes){
            if(unCliente.getIdCliente() == idCliente){
                unCliente.setEstado(estadoActual);
                java.util.Date fecha = new Date();
                unCliente.setFechaDeRechazo(fecha);
                controlPersis.asignarCliente(unCliente);
            }
        }
    }

    public void AlmacenarPasajeEnCliente(int idPasaje, int idCliente, String estadoActual) {
        Pasaje nuevoPasaje = new Pasaje();
        List <Pasaje> listaPasajes = controlPersis.getPasajes();
        for(Pasaje unPasaje:listaPasajes){
            if(unPasaje.getIdPasaje() == idPasaje){
                nuevoPasaje = unPasaje;
                nuevoPasaje.setEstado(estadoActual);
                controlPersis.asignarPasaje(unPasaje);
            }
        }

        List <Cliente> listaClientes = controlPersis.getClientes();
        for(Cliente unCliente:listaClientes){
            if(unCliente.getIdCliente() == idCliente){
                List <Pasaje> nuevaListaPasaje = unCliente.getPasajes();
                nuevoPasaje.setEstado(estadoActual);
                nuevaListaPasaje.add(nuevoPasaje);
                unCliente.setPasajes(nuevaListaPasaje);
                if(estadoActual.equals("Rechazado")){
                    java.util.Date fecha = new Date();
                    unCliente.setFechaDeRechazo(fecha);
                    unCliente.setEstado("Rechazado");
                }
                controlPersis.asignarCliente(unCliente);
            }
        }
    }

    public void ActualizarEstadoViaje(int idViaje, String estado) {
        List <Viaje> listaViajes = controlPersis.getViaje();
        for(Viaje unViaje:listaViajes){
            if(unViaje.getIdViaje() == idViaje){
                unViaje.setEstado(estado);
                controlPersis.asignarViaje(unViaje);
            }
        }
    }

    public void ActualizarAcompañante(int idPasaje, int dni, String estado) {
        List <Pasaje> listaPasajes = controlPersis.getPasajes();
        for(Pasaje unPasaje:listaPasajes){
            if((unPasaje.getIdPasaje() == idPasaje) && (unPasaje.getDni() == dni)){
                unPasaje.setEstado(estado);
                controlPersis.asignarPasaje(unPasaje);
            }
        }
    }     

    public void cancelarViaje(int idPasaje) {
        List <Pasaje> listaPasajes = controlPersis.getPasajes();
        for(Pasaje unPasaje:listaPasajes){
            if((unPasaje.getIdPasaje() == idPasaje)){
                unPasaje.setEstado("Cancelado");
                controlPersis.asignarPasaje(unPasaje);
            }
        }
    }

    public int verificarDevolucion(int idPasaje) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
        int horaAct = now.getHour();
        int minAct = now.getMinute();
        int diaAct = now.getDayOfMonth();
        int mesAct = now.getMonthValue();
         List <Pasaje> listaPasajes = controlPersis.getPasajes();
          for(Pasaje unPasaje:listaPasajes){
            if((unPasaje.getIdPasaje() == idPasaje)){
                if((unPasaje.getMes() == mesAct) && ((unPasaje.getDia()- diaAct) <= 2)){
                    return 1; // dentro de las 48hs -> 50%
                }
                }
            }
          return 2; // antes de las 48hs; -> se devuelve 100%
        }
          
    }


