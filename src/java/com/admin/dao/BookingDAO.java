/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.BookingDTO;
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
                String SQL = "SELECT DISTINCT bk.id,Trip.code, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT tr.code AS code, tp.depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE tp.id = bk.trip_id AND tp.id = tr.id )Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    String custNameBooking = rs.getString(4);
                    int totalQuantity = rs.getInt(5) + rs.getInt(6);
                    double totalPrice = rs.getDouble(7);
                    boolean status = rs.getBoolean(8);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, rs.getDate(3), totalQuantity, status, dto);
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
            List<BookingDTO> bookingList = new BookingDAO().getSummaryBookings();
            for (BookingDTO x : bookingList) {
                System.out.println(x);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
