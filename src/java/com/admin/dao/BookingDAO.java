/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.BookingDTO;
import com.admin.model.Chart;
import com.admin.model.PaymentDTO;
import com.admin.model.TripDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason,Trip.thumbnail\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT  tr.thumbnail,tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
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

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    String reason = rs.getString(10);
                    String thumbnail = rs.getString(11);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    dto.setThumbnail(thumbnail);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, expireDate, totalQuantity, status, dto, reason);
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

    // Lấy DS Booking to view export file Excel
    public List<BookingDTO> getSummaryBookings_ExportExcel()
            throws ClassNotFoundException, SQLException {
        List<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook, bk.cusPhone, bk.cusMail,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason,Trip.thumbnail\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT  tr.thumbnail,tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE bk.trip_id = tp.id\n"
                        + "AND tp.tour_id = tr.id) Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "AND bk.status = 1\n"
                        + "ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    String custMailBooking = rs.getString(6);
                    String custPhoneBooking = rs.getString(7);

                    int totalQuantity = rs.getInt(8) + rs.getInt(9);
                    double totalPrice = rs.getDouble(10);
                    boolean status = rs.getBoolean(11);
                    String reason = rs.getString(12);
                    String thumbnail = rs.getString(13);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    dto.setThumbnail(thumbnail);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, custMailBooking, custPhoneBooking, expireDate, totalQuantity, status, dto, reason);
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

    public List<BookingDTO> getSummaryBookingsWithPagination(int offset, int rowsPerPage)
            throws ClassNotFoundException, SQLException {
        List<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason, Trip.thumbnail, Trip.tripID\n"
                        + "                        FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "                        INNER JOIN ( SELECT tr.thumbnail,tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "                        FROM Booking bk, Trip tp, Tour tr\n"
                        + "                        WHERE bk.trip_id = tp.id\n"
                        + "                        AND tp.tour_id = tr.id)Trip\n"
                        + "                        ON Trip.tripID = bk.trip_id\n"
                        + "                        JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "                        ORDER BY bk.expireDate DESC\n"
                        + "                        OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, offset);
                ps.setInt(2, rowsPerPage);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    String reason = rs.getString(10);
                    String thumbnail = rs.getString(11);
                    int tripID = rs.getInt(12);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    dto.setThumbnail(thumbnail);
                    dto.setTripID(tripID);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, expireDate, totalQuantity, status, dto, reason);
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
                String SQL = "SELECT DISTINCT bk.id, bk.requirement, bk.cusBook, bk.cusMail, bk.cusPhone, bk.cusAddress, bk.expireDate,\n"
                        + "bk.quantityAdult, bk.quantityChild,Trip.tripID,Trip.code as tripCode, Trip.tourName, Trip.depart_time,\n"
                        + "bk.totalPrice, Trip.priceAdult, Trip.priceChild,pm.id as paymentID, pm.name AS thanhToan, bk.status, acc.id as accountID, bk.reason\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN (SELECT tr.code,tr.name AS tourName, tp.depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr \n"
                        + "WHERE tp.id = bk.trip_id AND tp.tour_id = tr.id)Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "LEFT JOIN Account acc ON bk.account_id = acc.id\n"
                        + "WHERE bk.id = ?\n"
                        + "ORDER BY expireDate DESC";

                ps = con.prepareStatement(SQL);
                ps.setInt(1, bookingID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String requirement = rs.getString(2);
                    String cusNameBooking = rs.getString(3);
                    String cusMail = rs.getString(4);
                    String cusPhone = rs.getString(5);
                    String cusAddress = rs.getString(6);

                    Timestamp ts = rs.getTimestamp(7);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

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
                    String reason = rs.getString(21);
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
                    bookingDTO = new BookingDTO(bookingID, totalPrice, requirement, cusNameBooking, cusMail, cusPhone, cusAddress, expireDate, status, accountID, quantityAdult, quantityChild, tripDTO, paymentDTO, reason);
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
    public boolean changeStateBooking(int bookingID, int tripID, String description)
            throws ClassNotFoundException, SQLException {
        PreparedStatement ps2 = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "BEGIN\n"
                        + "DECLARE @status bit\n"
                        + "DECLARE @quantity int\n"
                        + "DECLARE @current_quantity int \n"
                        + "SELECT @status = [status] FROM [dbo].[Booking] WHERE id = ?\n"
                        + "SELECT @quantity = [quantityAdult] + [quantityChild] FROM [dbo].[Booking] WHERE id = ?;\n"
                        + "SELECT @current_quantity = [current_quantity] FROM [dbo].[Trip] WHERE [dbo].[Trip].id = ?;\n"
                        + "IF @status = 0\n"
                        + "BEGIN\n"
                        + "UPDATE [dbo].[Booking] SET [status] = 1 WHERE id = ?;\n"
                        + "UPDATE [dbo].[Trip] SET [current_quantity] = [current_quantity] + @quantity WHERE id = ?;\n"
                        + "END\n"
                        + "ELSE\n"
                        + "BEGIN\n"
                        + "     IF @current_quantity = 0\n"
                        + "	 BEGIN \n"
                        + "		UPDATE [dbo].[Booking] SET [status] = 0 WHERE id = ?;\n"
                        + "		UPDATE [dbo].[Trip] SET [current_quantity] = 0 WHERE id = ?;\n"
                        + "	 END\n"
                        + "	 ELSE \n"
                        + "	 BEGIN \n"
                        + "		UPDATE [dbo].[Booking] SET [status] = 0 WHERE id = ?;\n"
                        + "		UPDATE [dbo].[Trip] SET [current_quantity] = [current_quantity] - @quantity WHERE id = ?;\n"
                        + "	 END\n"
                        + "END\n"
                        + "END";
                String SQL2 = "UPDATE [dbo].[Booking] SET [reason] = ? WHERE id = ?";
                ps = con.prepareStatement(SQL);
                ps2 = con.prepareStatement(SQL2);
                ps.setInt(1, bookingID);
                ps.setInt(2, bookingID);
                ps.setInt(3, tripID);
                ps.setInt(4, bookingID);
                ps.setInt(5, tripID);
                ps.setInt(6, bookingID);
                ps.setInt(7, tripID);
                ps.setInt(8, bookingID);
                ps.setInt(9, tripID);
                ps2.setString(1, description);
                ps2.setInt(2, bookingID);
                ps.execute();
                ps2.execute();
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
            if (ps2 != null) {
                ps2.close();

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
                    BookingDTO booking = new BookingDTO(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getInt(4));
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

    // lẤY TỔNG DOANH THU THEO THÁNG HIỆN TẠI CỦA TẤT CẢ TOUR VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public double getRevenueByMonth() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([totalPrice]) FROM[dbo].[Booking]\n"
                        + "WHERE MONTH([expireDate]) = MONTH(GETDATE()) AND [status] = 1";
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

    // lẤY TỔNG DOANH THU THEO THÁNG HIỆN TẠI CỦA TẤT CẢ TOUR VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public double getRevenueBy_Privious_Month() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([totalPrice]) FROM[dbo].[Booking]\n"
                        + "WHERE MONTH([expireDate]) = MONTH(GETDATE()) - 1 AND [status] = 1";
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

    // lẤY TỔNG DOANH THU THEO NGÀY HIỆN TẠI CỦA TẤT CẢ TOUR VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public double getRevenueByDay() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([totalPrice])  FROM [dbo].[Booking]\n"
                        + "where DAY([expireDate]) =  DAY(GETDATE())\n"
                        + "AND MONTH([expireDate]) = MONTH(GETDATE()) \n"
                        + "AND YEAR([expireDate]) = YEAR(GETDATE())\n"
                        + "AND [status] = 1";
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
                String SQL = "DECLARE @day int\n"
                        + "SELECT @day = DAY([expireDate]) FROM [dbo].[Booking]\n"
                        + "IF @day = 1 \n"
                        + "BEGIN\n"
                        + "     SELECT SUM([totalPrice])  FROM [dbo].[Booking]\n"
                        + "     WHERE DAY([expireDate]) =  DAY(DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE()), 0))) AND [status] = 1;\n"
                        + "END\n"
                        + "ELSE\n"
                        + "BEGIN\n"
                        + "	SELECT SUM([totalPrice])  FROM [dbo].[Booking]\n"
                        + "	where DAY([expireDate]) =  DAY(GETDATE()) - 1 AND [status] = 1;\n"
                        + "END";
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

    // lẤY TỔNG SỐ NGƯỜI ĐẶT BOOING NGÀY HIỆN TẠI VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public int getTotalTicket() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([quantityAdult] + [quantityChild]) AS quantityAdult FROM [dbo].[Booking] \n"
                        + "WHERE [status] = 1 AND DAY([expireDate]) = DAY(GETDATE())";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                int total = 0;
                while (rs.next()) {
                    total = rs.getInt(1);
                }
                return total;
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

    // lẤY TỔNG SỐ NGƯỜI ĐẶT BOOING NGÀY HÔM QUA VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public int getTotalTicket_PreviousDay() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([quantityAdult] + [quantityChild])\n"
                        + "FROM [dbo].[Booking]\n"
                        + "WHERE CONVERT(DATE, [expireDate]) = CAST(DATEADD(DAY, -1, GETDATE()) AS DATE) AND [status] = 1;";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                int total = 0;
                while (rs.next()) {
                    total = rs.getInt(1);
                }
                return total;
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

    // lẤY TỔNG SỐ NGƯỜI ĐẶT BOOING THÁNG HIỆN TẠI VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public int getTotalTicket_Month() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([quantityAdult] + [quantityChild]) FROM [dbo].[Booking] \n"
                        + " WHERE [status] = 1 AND MONTH([expireDate]) = MONTH(GETDATE())";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                int total = 0;
                while (rs.next()) {
                    total = rs.getInt(1);
                }
                return total;
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

    // lẤY TỔNG SỐ NGƯỜI ĐẶT BOOING NGÀY HÔM QUA VỚI ĐIỀU KIỆN ĐÃ THANH TOÁN
    public int getTotalTicket_PreviousMonth() throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM([quantityAdult] + [quantityChild]) FROM [dbo].[Booking] \n"
                        + " WHERE [status] = 1 AND MONTH([expireDate]) = MONTH(GETDATE()) - 1";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                int total = 0;
                while (rs.next()) {
                    total = rs.getInt(1);
                }
                return total;
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
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE bk.trip_id = tp.id\n"
                        + "AND tp.tour_id = tr.id AND tp.id = ?)Trip \n"
                        + "ON Trip.tripID = bk.trip_id \n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tripID);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    String reason = rs.getString(10);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, expireDate, totalQuantity, status, dto, reason);
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

    //Lấy booking với status dạng phân trang
    public ArrayList<BookingDTO> getListOfBookingByStatus(boolean bookingStatus, int offset, int rowsPerPage) throws ClassNotFoundException, SQLException {
        ArrayList<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason, Trip.thumbnail, Trip.tripID\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT tr.thumbnail, tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE bk.trip_id = tp.id\n"
                        + "AND tp.tour_id = tr.id)Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "WHERE bk.status = ?\n"
                        + "ORDER BY bk.expireDate DESC\n"
                        + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = con.prepareStatement(SQL);
                ps.setBoolean(1, bookingStatus);
                ps.setInt(2, offset);
                ps.setInt(3, rowsPerPage);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    String reason = rs.getString(10);
                    String thumbnail = rs.getString(11);
                    int tripID = rs.getInt(12);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    dto.setThumbnail(thumbnail);
                    dto.setTripID(tripID);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, expireDate, totalQuantity, status, dto, reason);
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

    //lấy tất cả các row có sẵn
    public int getAllAvailableRows()
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "select sum([rows])\n"
                        + "from sys.partitions\n"
                        + "where object_id=object_id('[NTNECompany].[dbo].[Booking]')\n"
                        + "and index_id in (0,1)";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    //lấy tất cả các row với conditions
    public int getAllAvailableRowsWithCondition(boolean status)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = " SELECT COUNT(*) AS numberOfRows FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + " WHERE bk.status = ?";
                ps = con.prepareStatement(SQL);
                ps.setBoolean(1, status);
                rs = ps.executeQuery();

                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    // LẤY DANH SÁCH BOOKING THEO NGÀY HIỆN TẠI
    public ArrayList<BookingDTO> getListOfBooking_Current_Day() throws ClassNotFoundException, SQLException {
        ArrayList<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE bk.trip_id = tp.id\n"
                        + "AND tp.tour_id = tr.id)Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "WHERE DAY(bk.expireDate) = DAY(GETDATE()) \n"
                        + "AND MONTH(bk.expireDate) = MONTH(GETDATE()) \n"
                        + "AND YEAR(bk.expireDate) = YEAR(GETDATE())\n"
                        + "AND bk.status = 1\n"
                        + "ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    String reason = rs.getString(10);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, expireDate, totalQuantity, status, dto, reason);
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

    // LẤY DANH SÁCH BOOKING THEO NGÀY THÁNG HIỆN TẠI
    public ArrayList<BookingDTO> getListOfBooking_Current_Month() throws ClassNotFoundException, SQLException {
        ArrayList<BookingDTO> listOfSummaryBooking = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT bk.id,Trip.code, Trip.depart_time, bk.expireDate, bk.cusBook,bk.quantityAdult, bk.quantityChild, bk.totalPrice, bk.status, bk.reason\n"
                        + "FROM [NTNECompany].[dbo].[Booking] bk\n"
                        + "INNER JOIN ( SELECT tr.code AS code, tp.depart_time as depart_time, tp.id AS tripID, tp.priceAdult, tp.priceChild\n"
                        + "FROM Booking bk, Trip tp, Tour tr\n"
                        + "WHERE bk.trip_id = tp.id\n"
                        + "AND tp.tour_id = tr.id)Trip\n"
                        + "ON Trip.tripID = bk.trip_id\n"
                        + "JOIN Payment pm ON bk.payment_id = pm.id\n"
                        + "WHERE MONTH(bk.expireDate) = MONTH(GETDATE()) AND bk.status = 1\n"
                        + "ORDER BY bk.expireDate DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                listOfSummaryBooking = new ArrayList<>();
                while (rs.next()) {
                    int bookingID = rs.getInt(1);
                    String code = rs.getString(2);
                    Date depart_time = rs.getDate(3);

                    Timestamp ts = rs.getTimestamp(4);
                    SimpleDateFormat formatter = new SimpleDateFormat("HH:mm dd/MM/yyyy");
                    String expireDate = formatter.format(ts);

                    String custNameBooking = rs.getString(5);
                    int totalQuantity = rs.getInt(6) + rs.getInt(7);
                    double totalPrice = rs.getDouble(8);
                    boolean status = rs.getBoolean(9);
                    String reason = rs.getString(10);
                    TripDTO dto = new TripDTO();
                    dto.setCode(code);
                    dto.setDepart_time(depart_time);
                    BookingDTO booking = new BookingDTO(bookingID, totalPrice, custNameBooking, expireDate, totalQuantity, status, dto, reason);
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

    // LẤY RA DOANH THU TRONG NGÀY HÔM NAY CỦA TOUR ĐÓ VÀ ID
    public ArrayList<BookingDTO> getRevenue_Current_Day_of_Tour() throws ClassNotFoundException, SQLException {
        ArrayList<BookingDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM(BK.totalPrice), TP.tour_id\n"
                        + "FROM [dbo].[Booking] as BK, [dbo].[Trip] as TP\n"
                        + "WHERE BK.trip_id = TP.id\n"
                        + "AND DAY(BK.expireDate) = DAY(GETDATE())\n"
                        + "AND MONTH(BK.expireDate) = MONTH(GETDATE()) \n"
                        + "AND YEAR(BK.expireDate) = YEAR(GETDATE())\n"
                        + "AND BK.status = 1\n"
                        + "GROUP BY TP.tour_id";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                list = new ArrayList<>();
                while (rs.next()) {
                    double revenue = rs.getDouble(1);
                    int tour_id = rs.getInt(2);
                    BookingDTO booking = new BookingDTO(revenue, tour_id);
                    list.add(booking);
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
        return list;
    }

    // LẤY RA DOANH THU TRONG THÁNG VỪA RỒI CỦA TOUR ĐÓ VÀ ID
    public ArrayList<BookingDTO> getRevenue_Previous_Month_of_Tour() throws ClassNotFoundException, SQLException {
        ArrayList<BookingDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT SUM(BK.totalPrice), TP.tour_id\n"
                        + "FROM [dbo].[Booking] as BK, [dbo].[Trip] as TP\n"
                        + "WHERE BK.trip_id = TP.id\n"
                        + "AND MONTH(BK.expireDate) = MONTH(GETDATE()) - 1 \n"
                        + "AND YEAR(BK.expireDate) = YEAR(GETDATE())\n"
                        + "AND BK.status = 1\n"
                        + "GROUP BY TP.tour_id";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                list = new ArrayList<>();
                while (rs.next()) {
                    double revenue = rs.getDouble(1);
                    int tour_id = rs.getInt(2);
                    BookingDTO booking = new BookingDTO(revenue, tour_id);
                    list.add(booking);
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
        return list;
    }

    // CHART getSummaryTotalOfWeeks
    public List<Chart> getSummaryTotalOfWeeks()
            throws SQLException, ClassNotFoundException {
        List<Chart> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = " SELECT SUM(totalPrice) as totalOfWeeks, convert(date, expireDate) as Date\n"
                        + "FROM [NTNECompany].[dbo].[Booking] \n"
                        + "WHERE convert(date, expireDate) IN\n"
                        + "(SELECT DISTINCT TOP 7 convert(date, expireDate)\n"
                        + "FROM [NTNECompany].[dbo].[Booking] \n"
                        + "WHERE convert(date, expireDate) IN \n"
                        + "(SELECT DISTINCT TOP 7 convert(date, expireDate) as Date)\n"
                        + "AND status = 1\n"
                        + "ORDER BY convert(date, expireDate) DESC)\n"
                        + "AND status = 1\n"
                        + "GROUP BY convert(date, expireDate)";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                list = new ArrayList<>();
                while (rs.next()) {
                    Chart chart = new Chart(rs.getDate(2), rs.getInt(1));
                    list.add(chart);
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
        return list;

    }

    // CHART getHighestTotalSummaryOfWeeks
    public double getHighestTotalSummaryOfWeeks()
            throws SQLException, ClassNotFoundException {
        double price = 0;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT TOP 1 SUM(totalPrice) as totalOfWeeks, convert(date, expireDate) as Date\n"
                        + "FROM [NTNECompany].[dbo].[Booking] \n"
                        + "WHERE convert(date, expireDate) IN\n"
                        + "(SELECT DISTINCT TOP 7 convert(date, expireDate)\n"
                        + "FROM [NTNECompany].[dbo].[Booking] \n"
                        + "WHERE convert(date, expireDate) IN \n"
                        + "(SELECT DISTINCT TOP 7 convert(date, expireDate) as Date)\n"
                        + "AND status = 1\n"
                        + "ORDER BY convert(date, expireDate) DESC)\n"
                        + "AND status = 1\n"
                        + "GROUP BY convert(date, expireDate)\n"
                        + "ORDER BY SUM(totalPrice) DESC";
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                if (rs.next()) {
                    price = rs.getDouble(1);
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
        return price;

    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        BookingDAO dao = new BookingDAO();
        ArrayList<BookingDTO> list = dao.getRevenue_Current_Day_of_Tour();
        System.out.println((int) dao.getHighestTotalSummaryOfWeeks());
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getTour_id());
        }
    }
}
