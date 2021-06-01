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
public class RegistroChofer extends HttpServlet {

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
            out.println("<title>Servlet RegistroChofer</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroChofer at " + request.getContextPath() + "</h1>");
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
        //int idCliente, String tipoPlan, int dni, String nombre, String apellido, String mail, String contra, Date fecha_nac
                
        String apellido = request.getParameter("apellido"); //Obtengo el nombre de usuario que se ingreso
        String nombre = request.getParameter("nombre"); //Obtengo la contraseña que ingresen el usuario
        int dni = Integer.parseInt(request.getParameter("dni"));
        String mail = request.getParameter("mail");
        String contra = request.getParameter("pass");
        int telefono = Integer.parseInt(request.getParameter("tel"));
        
        request.getSession().setAttribute("apellido", apellido);
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("dni", dni);
        request.getSession().setAttribute("mail", mail);
        request.getSession().setAttribute("pass", contra);
        request.getSession().setAttribute("tel", telefono);
        
            
        Controladora control = new Controladora();
        boolean existe = control.verificarChofer(mail); // devuelve si el mail ingresado ya se encuentra registrado.
        boolean bajaLogica = control.verificarBajaLogica(mail);
         if (existe) {
             if (!bajaLogica){ // si no fue eliminado, entonces el mail ingresado se encuentra en uso
                 response.sendRedirect ("popUpErrorMailRepetidoChofer.jsp");
             }else{ // sino, el mail ingresado se encuentra en el sistema pero tiene baja logica.
                 control.crearChofer(apellido, nombre, dni,  mail, contra, telefono);
                response.sendRedirect ("popUpRegistroCorrectoChofer.jsp");  
             }
           
        }   
        else{
            boolean cumpleTamañoMin = control.verificarContraseña(contra);
            if(!cumpleTamañoMin){
               response.sendRedirect ("popUpErrorContraseniaChofer.jsp");
            }
           else{
                control.crearChofer(apellido, nombre, dni,  mail, contra, telefono);
                response.sendRedirect ("popUpRegistroCorrectoChofer.jsp");  
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
