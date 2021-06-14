/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Cliente;
import Logica.Controladora;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "CrearPasaje", urlPatterns = {"/CrearPasaje"})
public class CrearPasaje extends HttpServlet {

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
         int  idViaje = Integer.parseInt(request.getParameter("ideViaje")); //Obtengo el nombre de usuario que se ingreso
        int idCliente = Integer.parseInt(request.getParameter("clienteViaje"));//Obtengo la contraseña que ingresen el usuario
        
        Controladora control = new Controladora();
        request.getSession().setAttribute("idCliente", idCliente);
        request.getSession().setAttribute("idViaje", idViaje);
        
        HttpSession mySession = request.getSession ();
            mySession . setAttribute ( "idViaje" , idViaje);
            mySession . setAttribute ( "idCliente" , idCliente);
            
         List <Cliente> listaClientes= control.devolverListaClientes();
                    for (Cliente cliente:listaClientes){
                        if(cliente.getEnSesion()){
                            control.crearPasaje(idCliente,idViaje);
                            response.sendRedirect ("comprarPasajes.jsp");
                        }else{
                           response.sendRedirect ("popUpErrorDebeIniciarSesion.jsp");
                        }
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
