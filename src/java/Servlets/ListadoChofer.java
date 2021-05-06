/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Chofer;
import Logica.Controladora;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juanf
 */
public class ListadoChofer extends HttpServlet {

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
            out.println("<title>Servlet ListadoChofer</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListadoChofer at " + request.getContextPath() + "</h1>");
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

        Controladora control = new Controladora();
        List <Chofer> listaChoferes = control.devolverListaChoferes(); 
        String nombre ,apellido,mail,telefono,dni;

        int tamaño = listaChoferes.size();
        for(Chofer chof:listaChoferes){
            nombre = chof.getNombre(); 
            apellido = chof.getApellido();
            dni= Integer.toString(chof.getDni());
            mail=chof.getMail();
            telefono = Integer.toString(chof.getTelefono());
            request.setAttribute("unNombre", nombre);
            request.setAttribute("unApellido", apellido);
            request.setAttribute("unDni", dni);
            request.setAttribute("unMail", mail);
            request.setAttribute("unTelefono", telefono);

      
      
       
        
        RequestDispatcher rd = request.getRequestDispatcher("listado.jsp");
        rd.forward(request, response);
        /*response.setContentType("text/html/charset=UTF-8");
        PrintWriter out = response.getWriter();
        //try{
            
            Controladora control = new Controladora();
            List <Chofer> listaChoferes = new ArrayList <Chofer>();
            control.devolverListaChoferes(listaChoferes);
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Listado choferes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<teble aling=center width=300 border=1>");
            out.println("<tr><td>Listado de choferes</td></tr>");
            out.println("<tr><td>ID</td><td>Nombre</td></tr>");
             

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");*/
        /*}catch(Exception ex){
            Logger.getLogger(SrvChofer.class.getName()).log(Level.SEVERE, null,ex);
        }*/        
        }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
