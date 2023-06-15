/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.controller;

import com.admin.config.Config;
import com.admin.dao.DestinationDAO;
import com.admin.dao.TourDAO;
import com.admin.dao.TourItemDAO;
import com.admin.dao.TripDAO;
import com.admin.model.DestinationDTO;
import com.admin.model.TourDTO;
import com.admin.model.TourItemDTO;
import com.admin.model.TripDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    String LIST_DESTINATION_URL = "ui-destination.jsp";
    String CREATE_TRIP_URL = "ui-createTrip.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = (String) request.getAttribute("action");
        switch (action) {
            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU GET
            ------------------------------------------------------------------------------*/
            case "listTour":
                listTour(request, response);
                break;
            case "listTourItems":
                listTourItem(request, response);
                break;
            case "listTrip":
                listTrip(request, response);
                break;
            case "listDestination":
                listDestination(request, response);
                break;
            case "tourDetailByID":
                getListOfTourItemFromTourByID(request, response);
                break;
            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU CREATE
            ------------------------------------------------------------------------------*/
            case "createTrip":
                createTripForm(request, response);
                break;
            // Xử lý khi ADMIN tạo TRIP mới
            case "hanleCreateTrip":
                hanleCreateTrip(request, response);
                break;
            // Xử lý khi ADMIN muốn thay đổi trạng thái của TRIP
            case "hanleChangeState":
                hanleChangeState(request, response);
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

    //Get list of destination
    protected void listDestination(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            DestinationDAO dao = new DestinationDAO();
            List<DestinationDTO> listDestination = dao.getAllDestination();
            if (listDestination != null) {
                url = Config.LAYOUT + LIST_DESTINATION_URL;
                request.setAttribute("LIST_DESTINATION", listDestination);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    protected void getListOfTourItemFromTourByID(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tourID = Integer.parseInt(request.getParameter("id"));
            System.out.println(tourID);
            TourItemDAO dao = new TourItemDAO();
            List<TourItemDTO> listTourItemByTourID = dao.getListTourItemByTourID(tourID);
            System.out.println(listTourItemByTourID.get(1).getDescription());
            if (listTourItemByTourID != null) {
                url = Config.LAYOUT + LIST_TOUR_ITEMS_URL;
                request.setAttribute("LIST_TOUR_ITEM_DETAIL_BY_TOUR_ID", listTourItemByTourID);
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
                                FUNCTION XU LY YEU CAU CREATE
    ------------------------------------------------------------------------------*/
    protected void createTripForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            List<TourDTO> listTour = new TourDAO().getAllTours();
            TourItemDAO dao = new TourItemDAO();
            if (listTour != null) {
                url = Config.LAYOUT + CREATE_TRIP_URL;
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

    // Funtion hanleCreateTrip
    protected void hanleCreateTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            // Get Parameter
            int tour_id = Integer.parseInt(request.getParameter("tour_id"));
            float priceAdult = Float.parseFloat(request.getParameter("priceAdult"));
            float priceChild = Float.parseFloat(request.getParameter("priceChild"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String depart_time = request.getParameter("depart_time");

            // Call DAO
            TripDAO dao = new TripDAO();
            boolean checkCreate = dao.createTrip(priceAdult, priceChild, quantity, depart_time, tour_id);
            if (checkCreate) {
                // Phải quay về frontcontroller để đưa dữ liệu lên trang listTourItems
                request.getRequestDispatcher("/tour/listTrip.do").forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Funtion hanleChangeState
    protected void hanleChangeState(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        System.out.println("Im here");
        try {
            // Get Parameter
            int tripID = Integer.parseInt(request.getParameter("tripID"));
            System.out.println(tripID);
            // Call DAO
            TripDAO dao = new TripDAO();
            boolean checkChangeState = dao.changeStateTrip(tripID);
            if (checkChangeState) {
                //Phải quay về frontcontroller để đưa dữ liệu lên trang listTourItems
                request.getRequestDispatcher("/tour/listTrip.do").forward(request, response);
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
