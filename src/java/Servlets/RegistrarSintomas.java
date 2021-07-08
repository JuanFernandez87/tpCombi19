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
public class RegistrarSintomas extends HttpServlet {

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
            out.println("<title>Servlet RegistrarSintomas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarSintomas at " + request.getContextPath() + "</h1>");
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
        int idPasaje = Integer.parseInt(request.getParameter("idPasaje"));
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int dni = Integer.parseInt(request.getParameter("dni"));
  
        double temp = Double.parseDouble(request.getParameter("temp"));
        String fiebre = request.getParameter("fiebre");
        String olfato = request.getParameter("olfato");
        String garganta = request.getParameter("garganta");
        
        request.getSession().setAttribute("idPasaje", idPasaje);
        request.getSession().setAttribute("idCliente", idCliente);
        request.getSession().setAttribute("dni", dni);
        request.getSession().setAttribute("temp", temp);
        request.getSession().setAttribute("fiebre", fiebre);
        request.getSession().setAttribute("olfato", olfato);
        request.getSession().setAttribute("garganta", garganta);        
        
        Controladora control = new Controladora();
        //temperatura > 38º = "Sospechoso/Rechazado"
        //En el caso de que no supere los 38º, pero al menos tiene 2 sintomas = "Sospechoso/Rechazado"
        int contador = 0;
        if(fiebre.equals("Si")){
            contador++;
        }
        if(olfato.equals("Si")){
            contador++;
        }
        if(garganta.equals("Si")){
            contador++;
        }        
        
        if((temp >= 38.0) || (contador >=2)){
            //si el cliente esta registrado ponerlo como sospechoso y no puede viajar por los proximos 15 dias
            if(idCliente > 0){
                control.AlmacenarPasajeEnCliente(idPasaje, idCliente, "Rechazado");
                control.SuspenderCliente(idCliente, "Suspendido");
                response.sendRedirect("popUpPasajeroRechazado.jsp");
            }else{
                control.ActualizarAcompañante(idPasaje, dni, "Rechazado");
                response.sendRedirect("popUpPasajeroAcompañanteRechazado.jsp");
            }              
        }else{
            //el cliente puede viajar
            if(idCliente > 0){
                control.AlmacenarPasajeEnCliente(idPasaje, idCliente, "Iniciado");
            }else{
                control.ActualizarAcompañante(idPasaje, dni, "Iniciado");
            }    
            response.sendRedirect("popUpPasajeroHabilitado.jsp");
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
