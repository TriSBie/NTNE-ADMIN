/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.DestinationDTO;
import com.admin.model.TourDTO;
import com.admin.model.TourItemDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buidu
 */
public class TourDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<TourDTO> getAllTours()
            throws ClassNotFoundException, SQLException {
        List<TourDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT [id]\n"
                        + "      ,[name]\n"
                        + "      ,[priceAdult]\n"
                        + "      ,[priceChild]\n"
                        + "      ,[thumbnail]\n"
                        + "      ,[location]\n"
                        + "      ,[code]\n"
                        + "  FROM [NTNECompany].[dbo].[Tour]\n";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    TourDTO dto = new TourDTO(rs.getInt("id"), rs.getString("name"),
                            rs.getDouble("priceAdult"), rs.getDouble("priceChild"),
                            rs.getString("thumbnail"), rs.getString("location"), rs.getString("code"));
                    list.add(dto);
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

    public List<TourDTO> getAllTours(int offset, int rowsPerPage)
            throws ClassNotFoundException, SQLException {
        List<TourDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT [id]\n"
                        + "      ,[name]\n"
                        + "      ,[priceAdult]\n"
                        + "      ,[priceChild]\n"
                        + "      ,[thumbnail]\n"
                        + "      ,[location]\n"
                        + "      ,[code]\n"
                        + "  FROM [NTNECompany].[dbo].[Tour]\n"
                        + "ORDER BY id DESC\n"
                        + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                ps.setInt(1, offset);
                ps.setInt(2, rowsPerPage);
                rs = ps.executeQuery();
                while (rs.next()) {
                    TourDTO dto = new TourDTO(rs.getInt("id"), rs.getString("name"),
                            rs.getDouble("priceAdult"), rs.getDouble("priceChild"),
                            rs.getString("thumbnail"), rs.getString("location"), rs.getString("code"));
                    list.add(dto);
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

    public boolean createNewTour(TourDTO tourDTO, List<TourItemDTO> tourItemDTO)
            throws ClassNotFoundException, SQLException {

        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "INSERT INTO Tour \n"
                        + "VALUES(?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(SQL);
                //Insert tour
                ps.setString(1, tourDTO.getTourName());
                ps.setDouble(2, tourDTO.getPriceAdult());
                ps.setDouble(3, tourDTO.getPriceChild());
                ps.setString(4, tourDTO.getThumbnail());
                ps.setString(5, tourDTO.getLocation());
                ps.setString(6, tourDTO.getCode());
                ps.executeUpdate();

                String SQL_1 = "DECLARE @TOURID INT;\n"
                        + "SELECT TOP 1 @TOURID = Tour.ID FROM [dbo].[Tour]\n"
                        + "ORDER BY Tour.id DESC\n"
                        + "INSERT INTO TourItem\n"
                        + "VALUES(@TOURID, ?, ?, ?)";

                //Vòng lặp để tạo các TourItem
                for (TourItemDTO item : tourItemDTO) {
                    PreparedStatement ps1 = con.prepareStatement(SQL_1);
                    ps1.setInt(1, item.getDestinationID());
                    ps1.setString(2, item.getDescription());
                    ps1.setString(3, item.getDuration());
                    ps1.executeUpdate();
                }
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

    // Lấy dữ liệu thông tin Tour theo tourID
    public TourDTO getTour_by_tourID(int tourID) throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT * FROM [dbo].[Tour] \n"
                        + "WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tourID);

                rs = ps.executeQuery();
                while (rs.next()) {
                    TourDTO tour = new TourDTO(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    return tour;
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
        return null;
    }

    // Xử lí update dữ liệu cho thông tin TOUR theo TOUR ID; 
    public boolean updateTour(String tourName, double priceAdult, double priceChild, String thumbnail, String location, String code, int tourID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "UPDATE [dbo].[Tour] \n"
                        + "SET [name] = ?, [priceAdult] = ?, [priceChild] = ?, [thumbnail] = ?, [location] = ?,[code] = ?\n"
                        + "WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setString(1, tourName);
                ps.setDouble(2, priceAdult);
                ps.setDouble(3, priceChild);
                ps.setString(4, thumbnail);
                ps.setString(5, location);
                ps.setString(6, code);
                ps.setInt(7, tourID);
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

    // Lấy TOUR theo BOOKING ID
    public TourDTO getTour_by_BookingID(int bookingID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT DISTINCT [dbo].[Tour].name,[dbo].[Tour].priceAdult, [dbo].[Tour].priceChild, [dbo].[Tour].thumbnail, [dbo].[Tour].location\n"
                        + "  FROM [dbo].[Booking], [dbo].[Trip], [dbo].[Tour]\n"
                        + "  WHERE [dbo].[Booking].trip_id = [dbo].[Trip].id AND [dbo].[Trip].tour_id = [dbo].[Tour].id AND [dbo].[Booking].id = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, bookingID);

                rs = ps.executeQuery();
                while (rs.next()) {
                    TourDTO tour = new TourDTO(rs.getString(1), rs.getDouble(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
                    return tour;
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
        return null;
    }

    // Lấy TOUR theo TRIP ID
    public TourDTO getTour_by_TripID(int tripID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "  SELECT [dbo].[Tour].name,[dbo].[Trip].priceAdult, [dbo].[Trip].priceChild, [dbo].[Tour].thumbnail, [dbo].[Tour].location\n"
                        + "  FROM [dbo].[Trip], [dbo].[Tour]\n"
                        + "  WHERE [dbo].[Trip].tour_id = [dbo].[Tour].id AND [dbo].[Trip].id = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tripID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    TourDTO tour = new TourDTO(rs.getString(1), rs.getDouble(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
                    return tour;
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
        return null;
    }

    public int getAllAvailableRows()
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "select sum([rows])\n"
                        + "from sys.partitions\n"
                        + "where object_id=object_id('[NTNECompany].[dbo].[Tour]')\n"
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

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        TourDTO result = new TourDAO().getTour_by_BookingID(37);
        System.out.println(result.getLocation());
    }
}
