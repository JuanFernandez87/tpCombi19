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
public class RegistroViaje extends HttpServlet {

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
            out.println("<title>Servlet RegistroViaje</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroViaje at " + request.getContextPath() + "</h1>");
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
        
        int idRuta = Integer.parseInt(request.getParameter("idRuta")); 
        //int cantAsientos = Integer.parseInt(request.getParameter("cantAsientos"));
        String dia = request.getParameter("dia");
        String mes = request.getParameter("mes");
        String anio = request.getParameter("anio");        
        int precio = Integer.parseInt(request.getParameter("precio"));

        request.getSession().setAttribute("idRuta", idRuta);
        //request.getSession().setAttribute("cantAsientos", cantAsientos);               
        request.getSession().setAttribute("dia", dia );
        request.getSession().setAttribute("mes", mes );
        request.getSession().setAttribute("anio", anio );
        String fechaViaje = dia + "/" + mes + "/" + anio;        
        request.getSession().setAttribute("precio", precio);
  
        Controladora control = new Controladora();
        boolean existe = false;
        existe = control.verificarViaje(idRuta, fechaViaje);
        
        //boolean hayLugar;
        //hayLugar = control.verificarAsientos(cantAsientos, idRuta);
        
        int cantAsientos = control.capacidadCombi(idRuta);
        
        
        if (!existe){
            control.crearViaje(idRuta, cantAsientos, fechaViaje, precio);
            response.sendRedirect ("popUpRegistroCorrectoViaje.jsp");
            /*}else{
                response.sendRedirect ("popUpErrorNoHayLugar.jsp");
            }*/            
        }else{
            response.sendRedirect ("popUpErrorViajeRepetido.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
