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
public class RegistroTarjeta extends HttpServlet {

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
            out.println("<title>Servlet RegistroTarjeta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroTarjeta at " + request.getContextPath() + "</h1>");
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
        //int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        int num3 = Integer.parseInt(request.getParameter("num3"));
        int num4 = Integer.parseInt(request.getParameter("num4"));
        String nombre = request.getParameter("nombre");
        int mesVenc = Integer.parseInt(request.getParameter("mes"));
        int anioVenc = Integer.parseInt(request.getParameter("anio"));
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String s1 = String.valueOf(num1);
        String s2 = String.valueOf(num2);
        String s3 = String.valueOf(num3);
        String s4 = String.valueOf(num4);
        String nro = s1+s2+s3+s4; //concateno los 16 numeros de la tarjeta
        int numeroTarjeta = Integer.parseInt(nro); //paso de string a int los 16 numeros
        
        //request.getSession().setAttribute("idCliente", idCliente);
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("numeroTarjeta", numeroTarjeta);
        String fechaVenc = mesVenc + "/" + anioVenc;
        request.getSession().setAttribute("fechaVenc", fechaVenc);
        request.getSession().setAttribute("codigo", codigo);
        
        Controladora control = new Controladora();
        boolean tarjetaRegistrada = control.verificarExistencia(numeroTarjeta); //chequeo que la tarjeta no este registrada
        if(!tarjetaRegistrada){
            control.registrarTarjeta(numeroTarjeta, codigo, fechaVenc, nombre);
            //int idTarjeta = control.idTarjeta(numeroTarjeta);
            //control.asignarTarjetaCliente(idCliente, idTarjeta);
            response.sendRedirect("popUpRegistroCorrecto.jsp");
        }else{
            response.sendRedirect("popUpErrorConstrasenia.jsp"); //si la tarjeta ya se encuentra registrada se envia a popup
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
