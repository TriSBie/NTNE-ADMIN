/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.controller;

import com.admin.config.Config;
import com.admin.dao.BookingDAO;
import com.admin.model.BookingDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author buidu
 */
@WebServlet(name = "BookingController", urlPatterns = {"/booking"})
public class BookingController extends HttpServlet {

    String ERROR_URL = "error.jsp";
    String VIEW_BOOKING_URL = "ui-manageBooking.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = (String) request.getAttribute("action");
        switch (action) {
            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU GET
            ------------------------------------------------------------------------------*/
            case "viewBooking":
                viewBooking(request, response);
            case "viewDetailBooking":
                viewDetailBooking(request, response);
                break;
            default:
                response.sendRedirect(Config.LAYOUT + "error.jsp");

        }
    }

    protected void viewBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            List<BookingDTO> listOfSummaryBooking = new BookingDAO().getSummaryBookings();
            if (listOfSummaryBooking != null) {
                url = Config.LAYOUT + VIEW_BOOKING_URL;
                request.setAttribute("LIST_OF_SUMMARY_BOOKING", listOfSummaryBooking);
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    protected void viewDetailBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int bookingID = Integer.parseInt(request.getParameter("bookingID"));

            BookingDAO dao = new BookingDAO();
            BookingDTO bookingDetail = dao.getDetailBookingByID(bookingID);
            if (bookingDetail != null) {
                url = Config.LAYOUT + VIEW_BOOKING_URL;
                request.setAttribute("BOOKING_DETAILS", bookingDetail);
                request.getRequestDispatcher(url).forward(request, response);
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
