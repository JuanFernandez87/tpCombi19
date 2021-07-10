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

/**
 *
 * @author Matias
 */
@WebServlet(name = "crearPasajeAcompaniante", urlPatterns = {"/crearPasajeAcompaniante"})
public class crearPasajeAcompaniante extends HttpServlet {

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
       Integer idClienteComprado = Integer.parseInt(request.getParameter("idCompraCliente"));
       Integer idViajeComprado = Integer.parseInt(request.getParameter("idCompraViaje"));
       Integer cantPasajes = Integer.parseInt(request.getParameter("cantPasajes"));
        for (int i= 1; i <= cantPasajes-1; i++ ){
            //String str = "Demo" + val;
            String nombre = (request.getParameter("nombre"+i));
            String apellido = (request.getParameter("apellido"+i));
            Integer dni = Integer.parseInt(request.getParameter("dni"+i));
            control.crearPasajeAcompañante(nombre, apellido, dni,idViajeComprado);
        }
        request.setAttribute("idClienteComprado", idClienteComprado);
        request.setAttribute("idViajeComprado", idViajeComprado);
        request.getRequestDispatcher("pasajeComprado.jsp").forward(request, response);
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
