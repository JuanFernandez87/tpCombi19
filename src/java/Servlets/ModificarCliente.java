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
public class ModificarCliente extends HttpServlet {

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
            out.println("<title>Servlet ModificarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarCliente at " + request.getContextPath() + "</h1>");
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
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String apellido = request.getParameter("apellido"); 
        String nombre = request.getParameter("nombre"); 
        int dni = Integer.parseInt(request.getParameter("dni"));
        String mail = request.getParameter("mail");
        String pass = request.getParameter("pass"); 
        int dia = Integer.parseInt(request.getParameter("dia"));
        int mes = Integer.parseInt(request.getParameter("mes"));
        int anio = Integer.parseInt(request.getParameter("anio"));
        //String tipoPlan = request.getParameter("tipoPlan");        
       
        request.getSession().setAttribute("idCliente", idCliente);
        request.getSession().setAttribute("apellido", apellido);
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("dni", dni);
//        request.getSession().setAttribute("mail", mail);
        request.getSession().setAttribute("pass", pass); 
        request.getSession().setAttribute("dia", dia );
        request.getSession().setAttribute("mes", mes );
        request.getSession().setAttribute("anio", anio );      
        //request.getSession().setAttribute("plan", tipoPlan);        
            
        Controladora control = new Controladora();
        int today = 2021;
        int edad = today - anio;
       
        if (edad < 18 ){
           response.sendRedirect("popUpErrorModificarClienteMenorDeEdad.jsp");
        }else{
            boolean cumpleTamañoMin = control.verificarContraseña(pass);
            if(!cumpleTamañoMin){
                response.sendRedirect ("popUpErrorModificacionDeContraseniaInvalida.jsp");
            }else{ 
                boolean modificaMailCliente = control.verificarMailCliente(idCliente, mail); //devuelve verdadero si el cliente modifica el mail
                if(modificaMailCliente){ //entra si no modifica el mail  
                    control.modificarCliente(idCliente, apellido, nombre, dni, pass, mail, dia, mes, anio);
                    response.sendRedirect ("popUpModificacionUsuarioCorrecta.jsp"); 
            /*if(tipoPlan.equals("Gold")){
                request.getSession().setAttribute("idCliente", idCliente);
                response.sendRedirect ("registroDeTarjetaBasico.jsp");
            }else if(tipoPlan.equals("Basico")){
                control.modificarPlan(idCliente);
                response.sendRedirect ("popUpModificacionUsuarioCorrecta.jsp"); 
            }else{*/           
                }else{ //entra a verificar si el mail existe en caso que cambie el mail
                boolean existe = control.verificarUsuario(mail);
                if(existe){
                    response.sendRedirect ("popUpErrorModificacionMailRepetido.jsp");
                }else{    
                    control.modificarCliente(idCliente, apellido, nombre, dni, pass, mail, dia, mes, anio);
                    HttpSession misession = request.getSession(true);
                    misession.setAttribute("username", mail);
                    response.sendRedirect ("popUpModificacionUsuarioCorrecta.jsp");  
                }
                   
            }
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
