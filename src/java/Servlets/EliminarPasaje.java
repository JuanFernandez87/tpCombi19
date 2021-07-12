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
@WebServlet(name = "EliminarPasaje", urlPatterns = {"/EliminarPasaje"})
public class EliminarPasaje extends HttpServlet {

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
        int idPasaje = Integer.parseInt(request.getParameter("idPasaje")); 
         request.getSession().setAttribute("idPasaje",idPasaje );
        Controladora control= new Controladora();
        control.cancelarViaje(idPasaje);
        int var =control.verificarDevolucion(idPasaje);
        if (var == 1){
            response.sendRedirect("listadoViajes50.jsp");
        }else{
            response.sendRedirect("listadoViajes100.jsp");
        }
        request.setAttribute("dev", var);
        //request.getRequestDispatcher("listadoViajes.jsp").forward(request, response);
        //var = 1 -> 48hs 
        // var == 2 -> 24hs
         //request.setAttribute("devolucion", var);
         //request.getRequestDispatcher("listadoViajes.jsp").forward(request, response);
         //request.getSession().setAttribute("devolucion",var);
           // String direccion = "listadoViajes.jsp"+"?devolucion="+String.valueOf(var);
            //response.sendRedirect (direccion); 

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
