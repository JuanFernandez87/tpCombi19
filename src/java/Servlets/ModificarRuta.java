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
public class ModificarRuta extends HttpServlet {

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
            out.println("<title>Servlet ModificarRuta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarRuta at " + request.getContextPath() + "</h1>");
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
        int idRuta = Integer.parseInt(request.getParameter("idRuta"));
        int idOrigen = Integer.parseInt(request.getParameter("idOrigen"));
        int idDestino = Integer.parseInt(request.getParameter("idDestino"));
        int idCombi = Integer.parseInt(request.getParameter("idCombi"));
        int distancia = Integer.parseInt(request.getParameter("distancia"));
        int hora = Integer.parseInt(request.getParameter("hora"));
        int minutos = Integer.parseInt(request.getParameter("minutos"));
        
        request.getSession().setAttribute("idRuta", idRuta);
        request.getSession().setAttribute("idOrigen", idOrigen);
        request.getSession().setAttribute("idDestino", idDestino);
        request.getSession().setAttribute("idCombi", idCombi);
        request.getSession().setAttribute("distancia", distancia);
        request.getSession().setAttribute("hora", hora);
        request.getSession().setAttribute("minutos", minutos);

        Controladora control = new Controladora();
        boolean sinViajes = control.verificarViaje(idRuta);
        if(!sinViajes){ //entra si no tiene viajes asignados
            if(idOrigen != idDestino){ //entra si el origen y el destino son distintos
                boolean rutaCargada = control.rutaCargada2(idRuta,idOrigen,idDestino,idCombi,hora,minutos);
                if(!rutaCargada){ //entra si no hay una ruta igual cargada origen+destino+combi+horario
                    control.modificarRuta(idRuta, idOrigen, idDestino, idCombi, distancia, hora, minutos);
                    response.sendRedirect ("popUpRegistroCorrectoRuta.jsp");     
                }else if (rutaCargada){
                     response.sendRedirect ("popUpErrorRutaExistente.jsp"); //si la ruta ya esta cargada origen+destino+combi+horario
                }
            }else if (idOrigen == idDestino){
                String direccion = "popUpErrorMismoOyDModificacion.jsp"+"?idRuta="+String.valueOf(idRuta);
                response.sendRedirect (direccion); //si el origen y destino son iguales
            }
        }else{
            String direccion = "popUpErrorRutaConViajeActivo.jsp"+"?idRuta="+String.valueOf(idRuta);
            response.sendRedirect (direccion); //si tiene viajes asignados
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
