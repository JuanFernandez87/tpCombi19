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
import javax.servlet.http.HttpSession;

/**
 *
 * @author juanf
 */
public class LoginUsuarios extends HttpServlet {

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
            out.println("<title>Servlet LoginUsuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginUsuarios at " + request.getContextPath() + "</h1>");
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
        String usuario = request.getParameter("username"); //Obtengo el nombre de usuario que se ingreso
        String contra = request.getParameter("pass"); //Obtengo la contraseña que ingresen el usuario
                
        request.getSession().setAttribute("username", usuario);
        request.getSession().setAttribute("pass", contra);
                     
        Controladora control = new Controladora();
        boolean esAdmin = control.comprobarIngresoAdmin(usuario, contra); //lo que devuelve lo tiene que guardar en estado para ver si la persona ingresa o no
        boolean esChofer = control.comprobarIngresoChofer(usuario, contra);
        boolean esCliente = control.comprobarIngresoCliente(usuario, contra);
        
        if (esAdmin == true){
            HttpSession misession = request.getSession(true);
            request.getSession().setAttribute("tipoUsuario", "Administrador");
            misession.setAttribute("username", usuario);
            misession.setAttribute("pass", contra);
            //cerrar sesion session.invalidate()            
            response.sendRedirect ("sesionAdmin.jsp");            
        }else if(esChofer == true){
            HttpSession misession = request.getSession(true);
            request.getSession().setAttribute("tipoUsuario", "Chofer");
            misession.setAttribute("username", usuario);
            misession.setAttribute("pass", contra);
            //cerrar sesion session.invalidate()
            response.sendRedirect ("sesionChofer.jsp");
        }else if(esCliente == true){
            HttpSession misession = request.getSession(true);
            request.getSession().setAttribute("tipoUsuario", "Cliente");
            misession.setAttribute("username", usuario);
            misession.setAttribute("pass", contra);
            //cerrar sesion session.invalidate()
            response.sendRedirect ("sesionUsuario.jsp");
        }else{   
            
            response.sendRedirect ("popUpErrorContraseniaUsuario.jsp"); // Si la contraseña es incorrecta vuelve a la pantalla de logueo
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
