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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juanf
 */
public class ModificarViaje extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModificarViaje</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarViaje at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        int idViaje = Integer.parseInt(request.getParameter("idViaje"));
        int idRuta = Integer.parseInt(request.getParameter("idRuta")); 
        int dia = Integer.parseInt(request.getParameter("dia"));
        int mes = Integer.parseInt(request.getParameter("mes"));
        int anio = Integer.parseInt(request.getParameter("anio"));
        int precio = Integer.parseInt(request.getParameter("precio"));

        request.getSession().setAttribute("idViaje", idViaje);      
        request.getSession().setAttribute("idRuta", idRuta);      
        request.getSession().setAttribute("dia", dia );
        request.getSession().setAttribute("mes", mes );
        request.getSession().setAttribute("anio", anio );    
        request.getSession().setAttribute("precio", precio);
  
        Controladora control = new Controladora();
        boolean existe = false;
        //existe = control.verificarViaje(idRuta, dia, mes, anio); //chequea que el viaje no exista
        
        int cantAsientos = control.capacidadCombi(idRuta);
        
        if (!existe){
            control.modificarViaje(idViaje, idRuta, cantAsientos, dia, mes, anio, precio);
            response.sendRedirect ("popUpRegistroCorrectoViaje.jsp");        
        }else{
            response.sendRedirect ("popUpErrorViajeConPasajesVendidos.jsp");
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
