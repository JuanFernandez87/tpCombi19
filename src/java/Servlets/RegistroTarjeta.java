/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Controladora;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String num1 = (request.getParameter("num1"));
        String num2 = (request.getParameter("num2"));
        String num3 = (request.getParameter("num3"));
        String num4 = (request.getParameter("num4"));
        String nombre = request.getParameter("nombre");
        int mesVenc = Integer.parseInt(request.getParameter("mes"));
        int anioVenc = Integer.parseInt(request.getParameter("anio"));
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String numeroTarjeta = num1 + num2 + num3 + num4;
        
        
        
        request.getSession().setAttribute("idCliente", idCliente);
        request.getSession().setAttribute("nombre", nombre);
        request.getSession().setAttribute("numeroTarjeta", numeroTarjeta);
        String fechaVenc = mesVenc + "/" + anioVenc;
        request.getSession().setAttribute("fechaVenc", fechaVenc);
        request.getSession().setAttribute("codigo", codigo);
        Controladora control = new Controladora();
        String cod = request.getParameter("codigo");
        
         boolean tarjetaRegistrada = control.verificarExistencia(numeroTarjeta); //chequeo que la tarjeta no este registrada
        if(!tarjetaRegistrada){
            control.registrarTarjeta(numeroTarjeta, codigo, fechaVenc, nombre);
            int idTarjeta = control.idTarjeta(numeroTarjeta);
            control.asignarTarjetaCliente(idCliente, idTarjeta);
            response.sendRedirect("popUpRegistroCorrecto.jsp");
        }else{
             request.setAttribute("num1", num1);
            request.setAttribute("num2", num2);
             request.setAttribute("num3", num3);
            request.setAttribute("num4", num4);
             request.setAttribute("nombre", nombre);
            request.setAttribute("mes", mesVenc);
             request.setAttribute("anio", anioVenc);
            request.setAttribute("codigo", codigo);
            request.getRequestDispatcher("popUpErrorTarjetaRegistrada.jsp").forward(request, response);
            //response.sendRedirect("popUpRegistroErroneoBasico.jsp"); //si la tarjeta ya se encuentra registrada se envia a popup
        }
        /*
        Date date = new Date();
        int mes = date.getMonth() +1 ;
        int anio = 2021 ;
        if ((mesVenc <= mes) && anioVenc <= anio){
            response.sendRedirect("popUpErrorFechaTarjeta.jsp");
        }else{
            boolean tarjetaRegistrada = control.verificarExistencia(numeroTarjeta); //chequeo que la tarjeta no este registrada
            if((!tarjetaRegistrada) && (cod.length() == 3)){
                control.registrarTarjeta(numeroTarjeta, codigo, fechaVenc, nombre);
                int idTarjeta = control.idTarjeta(numeroTarjeta);
                control.asignarTarjetaCliente(idCliente, idTarjeta);
                response.sendRedirect("popUpRegistroCorrecto.jsp");
            }else{
                if(tarjetaRegistrada){
                    response.sendRedirect("popUpErrorTarjetaRegistrada.jsp");
                }else{
                    response.sendRedirect("popUpErrorContraseniaTarjeta.jsp"); //si la tarjeta ya se encuentra registrada se envia a popup
                }
                 
             }
            }*/
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
