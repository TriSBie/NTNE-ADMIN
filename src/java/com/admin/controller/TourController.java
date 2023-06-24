/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.controller;

import com.admin.config.Config;
import com.admin.dao.BookingDAO;
import com.admin.dao.DestinationDAO;
import com.admin.dao.TourDAO;
import com.admin.dao.TourItemDAO;
import com.admin.dao.TripDAO;
import com.admin.model.BookingDTO;
import com.admin.model.DestinationDTO;
import com.admin.model.TourDTO;
import com.admin.model.TourItemDTO;
import com.admin.model.TripDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    String CREATE_TOUR_URL = "ui-createTour.jsp";
    String DASHBORAD_URL = "ui-dashborad.jsp";
    String UPDATE_TRIP = "ui-editTrip.jsp";
    String UPDATE_TOUR = "ui-editTour.jsp";
    String UPDATE_TOURITEM = "ui-editTourItem.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
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
            case "dashborad":
                get_Info_Dashborad(request, response);
                break;
            case "filter_state_false":
                filter_state_false(request, response);
                break;

            case "filter_state_true":
                filter_state_true(request, response);
                break;

            case "filter_trip_price":
                filter_trip_price(request, response);
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
            // Xử lí khi Admin click vào tạo des khi điền đầy đủ tt
            case "handleCreateDestination":
                handleCreateDestination(request, response);
                break;
            // Điều hướng qua page Tạo mới tour         
            case "createTourForm":
                createTourForm(request, response);
                break;
            // Xử lí khi Admin click vào tạo tour khi điền đầy đủ tt
            case "handleCreateTour":
                handleCreateTour(request, response);
                break;
            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU UPDATE
            ------------------------------------------------------------------------------*/
            // Xử lí chuyển trang đến editTrip
            case "editTrip":
                editTrip(request, response);
                break;
            // Xử lí cập nhật thông tin TRIP
            case "hanleEditTrip":
                hanleEditTrip(request, response);
                break;
            case "handleEditDestination":
                handleEditDestination(request, response);
                break;
            // Xử lí chuyển trang đến editTrip
            case "editTour":
                editTour(request, response);
                break;
            // Xử lí cập nhật thông tin TOUR
            case "hanleEditTour":
                hanleEditTour(request, response);
                break;
            // Xử lí chuyển trang đến editTourItem
            case "editTourItem":
                editTourItem(request, response);
                break;
            // Xử lí cập nhật thông tin TourItem
            case "hanleEditTourItem":
                hanleEditTourItem(request, response);
                break;
            default:
                response.sendRedirect(ERROR_URL);
        }

    }

    /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU GET
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
            List<DestinationDTO> listDestination = dao.getAll_List_Destination();
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
            int tourID = Integer.parseInt(request.getParameter("tourID"));
            System.out.println(tourID);
            TourItemDAO dao = new TourItemDAO();
            List<TourItemDTO> listTourItemByTourID = dao.getListTourItemByTourID(tourID);

            System.out.println(listTourItemByTourID.get(1).getDescription());
            if (listTourItemByTourID != null) {
                url = Config.LAYOUT + LIST_TOUR_ITEMS_URL;
                request.setAttribute("LIST_TOUR_ITEM_DETAIL_BY_TOUR_ID", listTourItemByTourID);
                request.setAttribute("TOUR_ITEM_NAME", listTourItemByTourID.get(1).getTourName());
                request.setAttribute("TOUR_ITEM_IMG", listTourItemByTourID.get(1).getTourThumbnail());
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // getInfomation Dashborad
    protected void get_Info_Dashborad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {

            // CALL DAO
            TripDAO trip_dao = new TripDAO();
            BookingDAO dao = new BookingDAO();
            ArrayList<BookingDTO> list = dao.getListTotalPrice();

            // Lấy danh sách booking
            List<BookingDTO> listOfSummaryBooking = new BookingDAO().getSummaryBookings();

            // Lấy doanh thu tháng hiện tại           
            double revenue = dao.getRevenueByMonth();
            // Lấy doanh thu tháng trước         
            double revenue_privious_month = dao.getRevenueBy_Privious_Month();
            // Tính toán theo % tăng giảm
            double stamp_month;
            if (revenue_privious_month == 0) {
                stamp_month = 0;
            } else {
                stamp_month = revenue / revenue_privious_month * 100;
            }
            // Nếu tháng này - tháng trước < 100% tức là doanh thu giảm 
            // => 100 - số stamp sẽ là số giảm so với tháng này
            double stamp_down_month = 100 - (revenue / revenue_privious_month * 100);

            // Lấy doanh thu theo ngày hiện tại
            double revenue_by_curentDay = dao.getRevenueByDay();
            // Lấy doanh thu theo ngày hôm qua
            double revenue_by_priviousDay = dao.getRevenueByPreviousDay();

            // Tính toán theo % tăng giảm
            double stamp;
            if (revenue_by_priviousDay == 0) {
                stamp = 0;
            } else {
                stamp = revenue_by_curentDay / revenue_by_priviousDay * 100;
            }
            // Nếu ngày hôm nay - hôm qua < 100% tức là doanh thu giảm 
            // => 100 - số stamp sẽ là số giảm so với ngày hôm nay
            double stamp_down = 100 - (revenue_by_curentDay / revenue_by_priviousDay * 100);

            // Lấy tổng số vé của ngày hôm nay và hôm qua với điều kiện đã thanh toán
            int totalSticket = dao.getTotalTicket();
            int totalSticket_PriviousDay = dao.getTotalTicket_PreviousDay();

            // Lấy tổng số vé của ngày tháng hiện tại và tháng trước với điều kiện đã thanh toán
            int totalSticket_Month = dao.getTotalTicket_Month();
            int totalSticket_PriviousMonth = dao.getTotalTicket_PreviousMonth();

            // Lấy tổng số TRIP đang hoạt động
            int total_TRIP_Available = trip_dao.getTotal_TRIP_ACTIVE();

            if (list != null) {
                url = Config.LAYOUT + DASHBORAD_URL;
                request.setAttribute("LIST_ALL_TOUR_REVENUE", list);
                request.setAttribute("REVENUE_BY_MONTH", revenue);
                request.setAttribute("REVENUE_BY_PRIVOUS_MONTH", revenue_privious_month);
                request.setAttribute("REVENUE_GROWTH_RATE_MONTH", (double) Math.floor(stamp_month * 10) / 10);
                request.setAttribute("REVENUE_GROWTH_RATE_DOWN_MONTH", (double) Math.floor(stamp_down_month * 10) / 10);

                request.setAttribute("REVENUE_BY_CURENT_DAY", revenue_by_curentDay);
                request.setAttribute("REVENUE_BY_PRIVIOUS_DAY", revenue_by_priviousDay);
                request.setAttribute("REVENUE_GROWTH_RATE", (double) Math.floor(stamp * 10) / 10);
                request.setAttribute("REVENUE_GROWTH_RATE_DOWN", (double) Math.floor(stamp_down * 10) / 10);

                request.setAttribute("LIST_OF_SUMMARY_BOOKING", listOfSummaryBooking);
                request.setAttribute("TOTAL_TICKET", totalSticket);
                request.setAttribute("TOTAL_TICKET_PRIVIOUS_DAY", totalSticket_PriviousDay);
                request.setAttribute("TOTAL_TICKET_MONTH", totalSticket_Month);
                request.setAttribute("TOTAL_TICKET_PRIVIOUS_MONTH", totalSticket_PriviousMonth);
                request.setAttribute("TOTAL_TRIP_ACTIVE", total_TRIP_Available);

                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Get list trip from database "filter_state_false"
    protected void filter_state_false(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            TripDAO dao = new TripDAO();
            List<TripDTO> listTrip = dao.getAllTrip_by_state_false();
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

    //Get list trip from database "filter_state_true"
    protected void filter_state_true(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            TripDAO dao = new TripDAO();
            List<TripDTO> listTrip = dao.getAllTrip_by_state_true();
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

    //Get list trip from database "filter_trip_by_price"
    protected void filter_trip_price(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        String sortByPrice = request.getParameter("sortByPrice");
        TripDAO dao = new TripDAO();
        List<TripDTO> listTrip = null;
        try {
            switch (sortByPrice) {
                case "ascending":
                    listTrip = dao.getTripPriceByAscending();
                    break;
                case "descending":
                    listTrip = dao.getTripPriceByDescending();
                    break;
            }
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


    /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU CREATE
    ------------------------------------------------------------------------------*/
    protected void createTripForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {

            List<TourDTO> listTour = new TourDAO().getAllTours();
            TourItemDAO dao = new TourItemDAO();

            TourDTO tour = new TourDTO();
            String tourID = request.getParameter("tourID");
            if (listTour != null) {
                if (tourID == null) {
                    tour = listTour.get(0);
                } else {
                    int tourID_parse = Integer.parseInt(tourID);
                    tour = new TourDAO().getTour_by_tourID(tourID_parse);
                }
                url = Config.LAYOUT + CREATE_TRIP_URL;
                request.setAttribute("LIST_TOUR", listTour);
                request.setAttribute("TOUR", tour);
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
        try {
            // Get Parameter
            int tripID = Integer.parseInt(request.getParameter("tripID"));
            System.out.println(tripID);
            // Call DAO
            TripDAO dao = new TripDAO();
            boolean checkChangeState = dao.changeStateTrip(tripID);
            if (checkChangeState) {
                //Phải quay về frontcontroller để đưa dữ liệu lên trang listTourItems
                request.setAttribute("msg_success", "Bạn đã thay đổi trạng thái của TRIP có ID");
                request.setAttribute("tripID", tripID);
                request.getRequestDispatcher("/tour/listTrip.do").forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Xử lí tạo destination
    protected void handleCreateDestination(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            //get Parameters from destination
            String desName = request.getParameter("destinationName");
            String latitude = (request.getParameter("latitude"));
            String longitude = (request.getParameter("longitude"));
            //using text editor'index' -> get description detail of destination
            String desc_des = request.getParameter("editor1");
            if (desName != null && latitude != null && longitude != null && desc_des != null) {
                DestinationDTO dto = new DestinationDTO(desName, desc_des, latitude, longitude);
                // Call DAO
                DestinationDAO dao = new DestinationDAO();
                boolean result = dao.createDestination(dto);
                if (result) {
                    String message = "Địa điểm mới: " + desName + " được thêm vào thành công!";
                    request.setAttribute("messageSc", message);
                    request.getRequestDispatcher("/tour/listDestination.do").forward(request, response);
                } else {
                    response.sendRedirect(url);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Xử lí TourForm    
    protected void createTourForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String url = Config.LAYOUT + CREATE_TOUR_URL;
            DestinationDAO dao = new DestinationDAO();
            List<DestinationDTO> listDestination = dao.getAll_List_Destination();
            request.setAttribute("LIST_DESTINATION", listDestination);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TourController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TourController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Xử lí quá trình tạo TOUR
    protected void handleCreateTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {

            //get Parameters from TOUR
            String name = request.getParameter("name");
            String location = request.getParameter("location");
            double priceAdult = Double.parseDouble(request.getParameter("priceAdult"));
            double priceChild = Double.parseDouble(request.getParameter("priceChild"));
            String thumbnail = request.getParameter("thumbnail");
            String code = request.getParameter("code");

            //get Parameters from TOURITEM
            String[] duration = request.getParameterValues("duration");
            String[] destination_id = request.getParameterValues("destination_id");
            String[] script = request.getParameterValues("script");

            // Do destination_id phải là 1 mảng int nên sẽ chuyển sang int
            int[] destination_id_translate = new int[destination_id.length];
            try {
                for (int i = 0; i < destination_id.length; i++) {
                    destination_id_translate[i] = Integer.parseInt(destination_id[i]);
                }
            } catch (Exception e) {
                System.out.println(e);
            }

            TourDTO tour = new TourDTO(name, priceAdult, priceChild, thumbnail, location, code);

            ArrayList<TourItemDTO> listTourITem = new ArrayList<>();
            for (int i = 0; i < destination_id_translate.length; i++) {
                TourItemDTO tourItem = new TourItemDTO(destination_id_translate[i], script[i], duration[i]);
                listTourITem.add(tourItem);
            }
            // CALL DAO
            TourDAO dao = new TourDAO();
            boolean checkCreate = dao.createNewTour(tour, listTourITem);
            if (checkCreate) {
                // Phải quay về frontcontroller để đưa dữ liệu lên trang listTourItems
                request.getRequestDispatcher("/tour/listTour.do").forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU UPDATE
    ------------------------------------------------------------------------------*/
    // Chuyển trang đến editTrip   
    protected void editTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tripID = Integer.parseInt(request.getParameter("tripID"));
            TripDAO dao = new TripDAO();
            TripDTO trip = dao.getTrip_by_tripID(tripID);
            if (trip != null) {
                url = Config.LAYOUT + UPDATE_TRIP;
                request.setAttribute("TRIP_DETAIL", trip);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Xử lí cập nhật thông tin TRIP
    protected void hanleEditTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tripID = Integer.parseInt(request.getParameter("tripID"));
            double priceAdult = Double.parseDouble(request.getParameter("priceAdult"));
            double priceChild = Double.parseDouble(request.getParameter("priceChild"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String depart_time = (request.getParameter("depart_time"));

            TripDAO dao = new TripDAO();
            boolean checkUpdateTrip = dao.updateTrip(priceAdult, priceChild, quantity, depart_time, tripID);
            if (checkUpdateTrip) {
                request.setAttribute("msg_success", "Bạn đã cập nhật thông tin thành công với TRIP có ID");
                request.setAttribute("tripID", tripID);
                request.getRequestDispatcher("/tour/listTrip.do").forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Xu ly update destination
    protected void handleEditDestination(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            String destinationEditName = request.getParameter("destinationName");
            String destinationEditLat = request.getParameter("destinationLat");
            String destinationEditLong = request.getParameter("destinationLong");
            String destinationDesc = request.getParameter("destinationDescription");

            int destinationID = Integer.parseInt(request.getParameter("destinationID"));
            System.out.println(destinationDesc + "-" + destinationEditLat + "-" + destinationEditName + "-" + destinationID);
            if (destinationDesc != null && destinationEditName != null && destinationEditLat != null && destinationEditLong != null) {
                DestinationDTO dto = new DestinationDTO(destinationEditName, destinationDesc, destinationEditLat, destinationEditLong);
                boolean result = new DestinationDAO().editDestination(destinationID, dto);
                if (result) {
                    request.setAttribute("msg_success", "Bạn đã cập nhật thông tin thành công!");
                    request.getRequestDispatcher("/tour/listDestination.do").forward(request, response);
                } else {
                    response.sendRedirect(url);
                }
            }
        } catch (ClassNotFoundException | IOException | SQLException | ServletException e) {
            System.out.println(e.getMessage());
        }
    }

    // Chuyển trang đến ui-editTour.jsp
    protected void editTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tourID = Integer.parseInt(request.getParameter("tourID"));
            TourDAO dao = new TourDAO();
            TourDTO tour = dao.getTour_by_tourID(tourID);
            if (tour != null) {
                url = Config.LAYOUT + UPDATE_TOUR;
                request.setAttribute("TOUR_DETAIL", tour);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Xử lí cập nhật thông tin Tour
    protected void hanleEditTour(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tourID = Integer.parseInt(request.getParameter("tourID"));
            String tourName = request.getParameter("tourName");
            double priceAdult = Double.parseDouble(request.getParameter("priceAdult"));
            double priceChild = Double.parseDouble(request.getParameter("priceChild"));
            String thumbnail = request.getParameter("thumbnail");
            String location = request.getParameter("location");
            String code = request.getParameter("code");

            TourDAO dao = new TourDAO();
            boolean checkUpdateTour = dao.updateTour(tourName, priceAdult, priceChild, thumbnail, location, code, tourID);
            if (checkUpdateTour) {
                request.setAttribute("msg_success", "Bạn đã cập nhật thông tin thành công với Tour có ID");
                request.setAttribute("tourID", tourID);
                request.getRequestDispatcher("/tour/listTour.do").forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Chuyển trang đến ui-editTourItem.jsp
    protected void editTourItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {

            // Get Parameter ToutItemID 
            int tourItemID = Integer.parseInt(request.getParameter("tourItemID"));

            // Get LIST DESTINATION
            DestinationDAO dao = new DestinationDAO();
            List<DestinationDTO> listDestination = dao.getAll_List_Destination();

            // Get TourItem by TourItemID
            TourItemDAO dao1 = new TourItemDAO();
            TourItemDTO tourItem = dao1.getTourItem_By_TourItemID(tourItemID);
            System.out.println(tourItem);
            if (tourItem != null) {
                url = Config.LAYOUT + UPDATE_TOURITEM;
                request.setAttribute("TOUR_ITEM_DETAIL", tourItem);
                request.setAttribute("LIST_DESTINATION", listDestination);
                request.setAttribute("tourID", tourItem.getTourID());
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Xử lí cập nhật thông tin TourItem
    protected void hanleEditTourItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = Config.LAYOUT + ERROR_URL;
        try {
            int tourID = Integer.parseInt(request.getParameter("tourID"));
            int tourItemID = Integer.parseInt(request.getParameter("tourItemID"));
            String description = request.getParameter("description");
            String duration = request.getParameter("duration");
            int destination_id = Integer.parseInt(request.getParameter("destination_id"));

            System.out.println(tourItemID);
            TourItemDAO dao = new TourItemDAO();
            boolean checkUpdateTourItem = dao.updateTourItem_by_TourItemID(destination_id, description, duration, tourItemID);

            System.out.println(checkUpdateTourItem);
            if (checkUpdateTourItem) {
                request.setAttribute("msg_success", "Bạn đã cập nhật thông tin thành công!");
                request.setAttribute("tourID", tourID);
                request.getRequestDispatcher("/tour/tourDetailByID.do").forward(request, response);
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
