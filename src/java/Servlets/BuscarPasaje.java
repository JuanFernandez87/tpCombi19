/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Controladora;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caigu
 */
@WebServlet(name = "BuscarPasaje", urlPatterns = {"/BuscarPasaje"})
public class BuscarPasaje extends HttpServlet {

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
          HttpSession misession = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        String destino = request.getParameter("destino");
        String origen = request.getParameter("origen"); 
        int dia = Integer.parseInt(request.getParameter("dia")); 
        int mes = Integer.parseInt(request.getParameter("mes"));
        int anio = Integer.parseInt(request.getParameter("anio"));

       
        request.getSession().setAttribute("destino", destino);
        request.getSession().setAttribute("origen", origen);
        request.getSession().setAttribute("dia", dia);
        request.getSession().setAttribute("mes", mes);
        request.getSession().setAttribute("anio", anio); 

            
        Controladora control = new Controladora();
        // si hay un viaje que cumpla con los datos ingresados 
        // entonces disponible volvera en true.
        boolean disponible = control.verificarPasajeDisp(origen, destino,dia,mes,anio); 
        if (disponible){
            misession.setAttribute("destino", destino);
            misession.setAttribute("origen", origen);
            misession.setAttribute("dia", dia);
            misession.setAttribute("mes", mes);
            misession.setAttribute("anio", anio);
            response.sendRedirect ("ListadoBusquedaViaje.jsp");
        }else{
            response.sendRedirect ("sesionAdmin.jsp");
        }
        
        
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
