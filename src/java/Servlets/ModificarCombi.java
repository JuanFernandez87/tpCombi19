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
public class ModificarCombi extends HttpServlet {

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
            out.println("<title>Servlet ModificarCombi</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarCombi at " + request.getContextPath() + "</h1>");
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
        int idCombi = Integer.parseInt(request.getParameter("idCombi"));
        String patente = request.getParameter("patente"); //Obtengo el nombre de usuario que se ingreso
        String modelo = request.getParameter("modelo"); //Obtengo la contraseña que ingresen el usuario
        int capacidad = Integer.parseInt(request.getParameter("cantAsientos"));    
        String tipoServicio = request.getParameter("servicio");
        int idChofer = Integer.parseInt(request.getParameter("id"));
        
        request.getSession().setAttribute("idCombi", idCombi);
        request.getSession().setAttribute("patente", patente);
        request.getSession().setAttribute("modelo", modelo);
        request.getSession().setAttribute("cantAsientos", capacidad);
        request.getSession().setAttribute("id", idChofer);                      
        request.getSession().setAttribute("servicio", tipoServicio);
            
        Controladora control = new Controladora();
        boolean modificarPantente = control.verificarPatente(idCombi, patente); //si el admin modifica la patente aca controlamos que no este cargada en el sistema
        
        if(modificarPantente){
            control.modificarCombi(idCombi, patente, modelo, capacidad, tipoServicio, idChofer); //si esta todo ok se modifica la informacion
            response.sendRedirect ("listadoCombi.jsp");
<<<<<<< Updated upstream
            }else{
            boolean existe = control.verificarCombi(patente); //verificamos que la combi exista
            if (existe == false){
                control.modificarCombi(idCombi, patente, modelo, capacidad, tipoServicio, idChofer);
                response.sendRedirect ("listadoCombi.jsp");
            }else{
                response.sendRedirect ("popUpErrorPatenteRepetidaCombi.jsp");
=======
        
        }else{
            response.sendRedirect ("popUpErrorCombiPatente.jsp");
>>>>>>> Stashed changes
            }
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
