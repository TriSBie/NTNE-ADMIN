/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.BookingDTO;
import com.admin.model.PaymentDTO;
import com.admin.model.TripDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author buidu
 */
public class BookingDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // Lấy danh sach booking
    public List<BookingDTO> getSummaryBookings()
            throws ClassNotFoundException, SQLException {
        List<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE bk.trip_id = tp.id\n"
                        + "AND tp.tour_id = tr.id)Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);
                    Date expireDate = rs.getDate(4);
                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, (java.sql.Date) expireDate, totalQuantity, status, dto);
                    listOfSummaryBooking.add(booking);
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return listOfSummaryBooking;
    }

    public BookingDTO getDetailBookingByID(int bookingID)
            throws ClassNotFoundException, SQLException {
        BookingDTO bookingDTO = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = " SELECT DISTINCT bk.id, bk.requirement, bk.cusBook,bk.cusMail,bk.cusPhone,bk.cusAddress,bk.expireDate,\n"
                        + "	bk.quantityAdult, bk.quantityChild,Trip.tripID,Trip.code as tripCode, Trip.tourName, Trip.depart_time,\n"
                        + "	bk.totalPrice, Trip.priceAdult, Trip.priceChild,pm.id as paymentID, pm.name AS thanhToan, bk.status, acc.id as accountID\n"
                        + "	FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "	INNER JOIN (SELECT tr.code,tr.name AS tourName, tp.depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild \n"
                        + "	FROM Booking bk, Trip tp, Tour tr \n"
                        + "	WHERE tp.id = bk.trip_id AND tp.id = tr.id)Trip\n"
                        + "	ON Trip.tripID = bk.trip_id\n"
                        + "	JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "	LEFT JOIN Account acc ON bk.account_id = acc.id\n"
                        + "     WHERE bk.id = ?\n"
                        + "	ORDER BY expireDate DESC";

                ps = con.prepareStatement(SQL);
                ps.setInt(1, bookingID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String requirement = rs.getString(2);
                    String cusNameBooking = rs.getString(3);
                    String cusMail = rs.getString(4);
                    String cusPhone = rs.getString(5);
                    String cusAddress = rs.getString(6);
                    int quantityAdult = rs.getInt(8);
                    int quantityChild = rs.getInt(9);
                    int tripID = rs.getInt(10);
                    String tripCode = rs.getString(11);
                    String tourName = rs.getString(12);
                    Date departTime = rs.getDate(13);
                    double totalPrice = rs.getDouble(14);
                    double priceAdult = rs.getDouble(15);
                    double priceChild = rs.getDouble(16);
                    int paymentID = rs.getInt(17);
                    String paymentName = rs.getString(18);
                    boolean status = rs.getBoolean(19);
                    int accountID = rs.getInt(20);

                    //TRIP DTO
                    TripDTO tripDTO = new TripDTO();
                    tripDTO.setCode(tripCode);
                    tripDTO.setTripID(tripID);
                    tripDTO.setTourName(tourName);
                    tripDTO.setDepart_time(departTime);
                    tripDTO.setPriceAdult(priceAdult);
                    tripDTO.setPriceChild(priceChild);

                    //PAYMENT DTO
                    PaymentDTO paymentDTO = new PaymentDTO(paymentID, paymentName);

                    //BOOKING DTO 
                    bookingDTO = new BookingDTO(bookingID, totalPrice, requirement, cusNameBooking, cusMail, cusPhone, cusAddress, rs.getDate(7), status, accountID, quantityAdult, quantityChild, tripDTO, paymentDTO);
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return bookingDTO;
    }

    // Xử lí đổi trạng thái TRIP
    public boolean changeStateBooking(int bookingID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "BEGIN\n"
                        + "DECLARE @status bit;\n"
                        + "SELECT\n"
                        + "@status = [status]\n"
                        + "FROM [dbo].[Booking]\n"
                        + "WHERE id = ?;\n"
                        + "IF @status = 0\n"
                        + "BEGIN\n"
                        + "UPDATE [dbo].[Booking] SET [status] = 1 WHERE id = ?;\n"
                        + "END\n"
                        + "ELSE\n"
                        + "BEGIN\n"
                        + "UPDATE [dbo].[Booking] SET [status] = 0 WHERE id = ?;\n"
                        + "END\n"
                        + "END";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, bookingID);
                ps.setInt(2, bookingID);
                ps.setInt(3, bookingID);
                ps.execute();
                ps.close();
                return true;
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return false;
    }

    // Lấy ra tổng tất cả giá của TOUR
    public ArrayList<BookingDTO> getListTotalPrice() throws ClassNotFoundException, SQLException {

        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT T.name, T.thumbnail, SUM(BK.totalPrice) as revenue, T.id FROM [dbo].[Booking] AS BK, [dbo].[Trip] AS TP,[dbo].[Tour] AS T  WHERE TP.id = BK.trip_id AND TP.tour_id = T.id AND BK.status = 1\n"
                        + "GROUP BY T.name, T.thumbnail,T.id\n"
                        + "ORDER BY revenue DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                ArrayList<BookingDTO> listTotalPrice = new ArrayList<>();
                while (rs.next()) {
                    BookingDTO booking = new BookingDTO(rs.getString(1), rs.getString(2), rs.getDouble(3));
                    listTotalPrice.add(booking);
                }
                return listTotalPrice;
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return null;
    }

    // lẤY TỔNG DOANH THU THEO THÁNG CỦA TẤT CẢ TOUR VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public double getRevenueByMonth(int month) throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([totalPrice]) FROM[dbo].[Booking]\n"
                        + "WHERE MONTH([expireDate]) = ? AND [status] = 1";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, month);
                rs = ps.executeQuery();
                double revenue = 0;
                while (rs.next()) {
                    revenue = rs.getDouble(1);
                }
                return revenue;
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return 0;
    }

    // lẤY TỔNG DOANH THU THEO NGÀY HIỆN TẠI CỦA TẤT CẢ TOUR VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public double getRevenueByDay() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([totalPrice])  FROM [dbo].[Booking]\n"
                        + "where DAY([expireDate]) =  DAY(GETDATE()) AND [status] = 1";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                double revenue = 0;
                while (rs.next()) {
                    revenue = rs.getDouble(1);
                }
                return revenue;
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return 0;
    }

    // lẤY TỔNG DOANH THU THEO NGÀY HÔM QUA CỦA TẤT CẢ TOUR VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public double getRevenueByPreviousDay() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([totalPrice])  FROM [dbo].[Booking]\n"
                        + "where DAY([expireDate]) =  DAY(GETDATE()) - 1 AND [status] = 1;";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                double revenue = 0;
                while (rs.next()) {
                    revenue = rs.getDouble(1);
                }
                return revenue;
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return 0;
    }

    
    // Lấy ra danh sách Booking theo tripID
    public ArrayList<BookingDTO> getListBooking_By_TripID(int tripID) throws ClassNotFoundException, SQLException {
        ArrayList<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status\n" +
"                        FROM [NTNECompany].[dbo].[Booking] bk\n" +
"                        INNER JOIN ( SELECT tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n" +
"                        FROM Booking bk, Trip tp, Tour tr\n" +
"                        WHERE bk.trip_id = tp.id\n" +
"                        AND tp.tour_id = tr.id AND tp.id = ?)Trip \n" +
"                        ON Trip.tripID = bk.trip_id \n" +
"                        JOIN Payment pm ON bk.payment_id = pm.id\n" +
"                        ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tripID);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);
                    Date expireDate = rs.getDate(4);
                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, (java.sql.Date) expireDate, totalQuantity, status, dto);
                    listOfSummaryBooking.add(booking);
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return listOfSummaryBooking;
    }
    
    public static void main(String[] args) {
        try {
            List<BookingDTO> list = new BookingDAO().getListBooking_By_TripID(1);
//            if (dto != null) {
//                System.out.println(dto);
//                System.out.println(dto.getPaymentDTO().getPaymentName());
//                System.out.println(dto.getTripDTO().getTourName());
//                System.out.println(dto.getTripDTO().getCode());
//            }
            if (list != null) {
                for (BookingDTO bookingDTO : list) {
                    System.out.println(bookingDTO.getCusBook());
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
