/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Cliente;
import Logica.Controladora;
import Logica.Insumo;
import Logica.Pasaje;
import Logica.Viaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author caigu
 */
@WebServlet(name = "ComprarPasaje", urlPatterns = {"/ComprarPasaje"})
public class ComprarPasaje extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     response.setContentType("text/html;charset=UTF-8");
         Controladora control = new Controladora();
        //List<Insumo> listaInsumos = control.devolverListaInsumos();
        //List<Pasaje> listaPasajes = control.devolverListaPasajes();
        List<Viaje> listaViajes = control.devolverListaViajes();
       // List cantInsumos = new ArrayList();
        int i = 0;
        String index = "";
        // obtenemos la cantidad elegida de cada insumo.
        // el primer insumo se referencia con el valor 1; el segundo con 2...etc.
        //for (Insumo insumo:listaInsumos){
          //  if(insumo.getPrecio() != -1){
            //     i = i+1;
              //   index = String.valueOf(i);
                // int valor = Integer.parseInt(request.getParameter(index));
                 //cantInsumos.add(valor);
                 //request.getSession().setAttribute(insumo.getNombre(),valor );
            //}
        //}
         String tarjeta = "";
                tarjeta = request.getParameter("tarjeta");
                Integer variable = (Integer)request.getAttribute("unEntero");
        boolean enSesion = false;
        List <Cliente> listaClientes= control.devolverListaClientes();
                    for (Cliente cliente:listaClientes){
                        if(cliente.getEnSesion()){
                            enSesion = true;
                        }
                    }
                    if(enSesion){
                        if (tarjeta == null){
             int idViaje = -2;
                idViaje = Integer.parseInt(request.getParameter("ideViaje")); 
             int idCliente = -2;
                idCliente = Integer.parseInt(request.getParameter("clienteViaje"));
             request.getSession().setAttribute("idCliente",idCliente );
             request.getSession().setAttribute("ideViaje", idViaje);
            //response.sendRedirect("comprarPasajes.jsp");
            // con request.setAttribute -> seteamos una variable y podemos recibirlo en el jsp que se indique en el forward.
            //el codigo de arriba de request.getSession.setAttribute no setea los atributos y no se pueden recibir en el jsp.
            request.setAttribute("idViaje", idViaje);
            request.setAttribute("idCliente", idCliente);
            request.getRequestDispatcher("comprarPasajes.jsp").forward(request, response);
           //request.getRequestDispatcher("comprarPasajes.jsp").forward(request, response);
             
        }else{
            Integer idCompraCliente = Integer.parseInt(request.getParameter("idCompraCliente"));
            Integer idCompraViaje = Integer.parseInt(request.getParameter("idCompraViaje"));
            Integer cantPasajes = Integer.parseInt(request.getParameter("cantPasajes"));
            request.getSession().setAttribute("idCompraCliente",idCompraCliente);
            request.getSession().setAttribute("idCompraPasaje",idCompraViaje);
            request.getSession().setAttribute("cantPasajes", cantPasajes);
            for (Viaje viaje: listaViajes){
                if(viaje.getIdViaje() == idCompraViaje){
                        // creamos tantos pasajes como asientos haya elegido.
                        for (int j = 0; j < cantPasajes; j ++){
                          control.crearPasaje(idCompraCliente,idCompraViaje);  
                        }
                        control.modificarViaje(idCompraViaje, viaje.getIdRuta(), (viaje.getCantAsientos()- cantPasajes), viaje.getDia(),viaje.getMes(), viaje.getAnio(), viaje.getPrecio());
                    }
            }
            request.setAttribute("idClienteComprado", idCompraCliente);
            request.setAttribute("idViajeComprado", idCompraViaje);
            request.getRequestDispatcher("pasajeComprado.jsp").forward(request, response);
        }
                    }else{
                        response.sendRedirect ("popUpErrorDebeIniciarSesion.jsp");
                    }
       
        //int cantPasajes = Integer.parseInt(request.getParameter("cantPasajes"));
       
       

        
        //String idCliente = request.getParameter("clienteViaje");
        //int idViaje = Integer.parseInt(request.getParameter("ideViaje"));
        
        //request.getSession().setAttribute("tarjeta", tarjeta);
       // request.getSession().setAttribute("cantPasajes", cantPasajes);
        
         //
       // if (cantPasajes == 0){
        //response.sendRedirect("pasajeComprado.jsp");        
        //}

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
