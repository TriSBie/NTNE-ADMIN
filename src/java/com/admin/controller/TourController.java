/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.controller;

import com.admin.config.Config;
import com.admin.dao.TourDAO;
import com.admin.dao.TourItemDAO;
import com.admin.dao.TripDAO;
import com.admin.model.TourDTO;
import com.admin.model.TourItemDTO;
import com.admin.model.TripDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author buidu
 */
@WebServlet(name = "TourController", urlPatterns = {"/tour"})
public class TourController extends HttpServlet {

    String LIST_TOUR_URL = "ui-listTour.jsp";
    String LIST_TOUR_ITEMS_URL = "ui-listTourItems.jsp";
    String ERROR_URL = "error.jsp";
    String LIST_TRIP_URL = "ui-listTrip.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "listTour":
                listTour(request, response);
                break;
            case "listTourItems":
                listTourItem(request, response);
                break;
            case "listTrip":
                listTrip(request, response);
                break;
            default:
                response.sendRedirect(ERROR_URL);
        }

    }

    /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU
    ------------------------------------------------------------------------------*/
    //Get list Tour from database 
    protected void listTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            TourDAO dao = new TourDAO();
            List<TourDTO> listTour = dao.getAllTours();
            if (listTour != null) {
                url = Config.LAYOUT + LIST_TOUR_URL;
                request.setAttribute("LIST_TOUR", listTour);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Get list Tour Item from database 
    protected void listTourItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            TourItemDAO dao = new TourItemDAO();
            List<TourItemDTO> listTourItems = dao.getAllTourItems();
            if (listTourItems != null) {
                url = Config.LAYOUT + LIST_TOUR_ITEMS_URL;
                request.setAttribute("LIST_TOUR_ITEMS", listTourItems);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Get list trip from database 
    protected void listTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            TripDAO dao = new TripDAO();
            List<TripDTO> listTrip = dao.getAllTrip();
            if (listTrip != null) {
                url = Config.LAYOUT + LIST_TRIP_URL;
                request.setAttribute("LIST_TRIP", listTrip);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
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
