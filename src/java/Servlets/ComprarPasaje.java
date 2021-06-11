/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Controladora;
import Logica.Insumo;
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
        List<Insumo> listaInsumos = control.devolverListaInsumos();
        List cantInsumos = new ArrayList();
        int i = 0;
        String index = "";
        // obtenemos la cantidad elegida de cada insumo.
        // el primer insumo se referencia con el valor 1; el segundo con 2...etc.
        for (Insumo insumo:listaInsumos){
            if(insumo.getPrecio() != -1){
                 i = i+1;
                 index = String.valueOf(i);
                 int valor = Integer.parseInt(request.getParameter(index));
                 cantInsumos.add(valor);
                 request.getSession().setAttribute(insumo.getNombre(),valor );
            }
        }
        String tarjeta = request.getParameter("tarjeta");
        int cantPasajes = Integer.parseInt(request.getParameter("cantPasajes"));    
         //control.modificarViaje(idViaje, idRuta, cantAsientos, dia, mes, anio, precio);
        response.sendRedirect("pasajeComprado.jsp");
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
