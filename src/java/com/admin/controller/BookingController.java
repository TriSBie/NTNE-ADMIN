/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.controller;

import com.admin.config.Config;
import com.admin.dao.BookingDAO;
import com.admin.dao.TourDAO;
import com.admin.model.BookingDTO;
import com.admin.model.TourDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "BookingController", urlPatterns = {"/booking"})
public class BookingController extends HttpServlet {

    String ERROR_URL = "error.jsp";
    String VIEW_BOOKING_URL = "ui-manageBooking.jsp";
    String VIEW_BOOKING_BY_TRIPID_URL = "ui-listBookingbyTripID.jsp";
    String VIEW_DETAIL_BOOKING = "ui-detailBooking.jsp";

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
                break;
            case "viewDetailBooking":
                viewDetailBooking(request, response);
                break;
            case "listBookingbyTripID":
                listBookingbyTripID(request, response);
                break;

            case "filterStatusBooking":
                filterStatusBooking(request, response);
                break;

            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU UPDATE
            ------------------------------------------------------------------------------*/
            case "hanleChangeState_Booking":
                hanleChangeState_Booking(request, response);
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

            // Get TOUR BY BOOKING ID
            TourDAO dao_tour = new TourDAO();
            TourDTO tour = dao_tour.getTour_by_BookingID(bookingID);
            if (bookingDetail != null) {
                url = Config.LAYOUT + VIEW_DETAIL_BOOKING;
                request.setAttribute("BOOKING_DETAILS", bookingDetail);
                request.setAttribute("TOUR", tour);
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Lấy DS KH BOOKING TỪ TRIPID
    protected void listBookingbyTripID(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tripID = Integer.parseInt(request.getParameter("tripID"));
            // Get TOUR BY TRIP ID
            TourDAO dao_tour = new TourDAO();
            TourDTO tour = dao_tour.getTour_by_TripID(tripID);
            
            BookingDAO dao = new BookingDAO();
            ArrayList<BookingDTO> list = dao.getListBooking_By_TripID(tripID);
            System.out.println(tripID);
            if (list != null) {
                url = Config.LAYOUT + VIEW_BOOKING_BY_TRIPID_URL;
                System.out.println(list.size());
                request.setAttribute("LIST_BOOKING_BY_TRIPID", list);
                request.setAttribute("TOUR", tour);
                request.setAttribute("TRIP_ID", tripID);

                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU UPDATE
    ------------------------------------------------------------------------------*/
    protected void hanleChangeState_Booking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            // Get Parameter
            int bookingItemID = Integer.parseInt(request.getParameter("bookingItemID"));
            String description = request.getParameter("descriptionBookingChanged");
            System.out.println(description);
            // Call DAO
            BookingDAO dao = new BookingDAO();
            boolean checkChangeStateBooking = dao.changeStateBooking(bookingItemID, description);
            if (checkChangeStateBooking) {
                request.setAttribute("msg_success", "Bạn đã thay đổi trạng thái của Booking có mã Booking");
                request.setAttribute("bookingItemID", bookingItemID);
                request.getRequestDispatcher("/booking/viewBooking.do").forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Filter status based on user click
    protected void filterStatusBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            // Get Parameter from button
            String action = request.getParameter("payStatus");
            // Call DAO
            BookingDAO dao = new BookingDAO();
            ArrayList<BookingDTO> listOfBooking = null;
            switch (action) {
                case "yes":
                    listOfBooking = dao.getListOfBookingByStatus(true);
                    break;
                case "no":
                    listOfBooking = dao.getListOfBookingByStatus(false);
                    break;
            }
            if (listOfBooking != null) {
                //Phải quay về frontcontroller để đưa dữ liệu lên trang listTourItems
                request.setAttribute("BOOKING_STATUS_WITH_CONDITION", listOfBooking);
                url = Config.LAYOUT + VIEW_BOOKING_URL;
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | SQLException e) {
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
