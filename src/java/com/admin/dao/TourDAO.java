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
                        + "  FROM [NTNECompany].[dbo].[Tour]";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    TourDTO dto = new TourDTO(rs.getInt("id"), rs.getString("name"),
                            rs.getDouble("priceAdult"), rs.getDouble("priceChild"),
                            rs.getString("thumbnail"), rs.getString("location"));
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
                        + "VALUES(?, ?, ?, ?, ?)";
                ps = con.prepareStatement(SQL);
                //Insert tour
                ps.setString(1, tourDTO.getTourName());
                ps.setDouble(2, tourDTO.getPriceAdult());
                ps.setDouble(3, tourDTO.getPriceChild());
                ps.setString(4, tourDTO.getThumbnail());
                ps.setString(5, tourDTO.getLocation());
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
                    TourDTO tour = new TourDTO(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
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
    public boolean updateTour(String tourName, double priceAdult, double priceChild, String thumbnail, String location, int tourID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "UPDATE [dbo].[Tour] \n"
                        + "SET [name] = ?, [priceAdult] = ?, [priceChild] = ?, [thumbnail] = ?, [location] = ? \n"
                        + "WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setString(1, tourName);
                ps.setDouble(2, priceAdult);
                ps.setDouble(3, priceChild);
                ps.setString(4, thumbnail);
                ps.setString(5, location);
                ps.setInt(6, tourID);
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
//    public static void main(String[] args) {
//        TourDTO tourDTO = new TourDTO("Da nang 1 Minh Em", 1000000, 2000000, "abcdxez.com", "dia diem1, dia diem 2, dia diem 3");
//        List<TourItemDTO> tourItemsDTO = new ArrayList<>();
//        tourItemsDTO.add(new TourItemDTO(3, "8h-12h", "test4"));
//        tourItemsDTO.add(new TourItemDTO(3, "12h-15h", "test5"));
//        tourItemsDTO.add(new TourItemDTO(3, "15h-19h", "test6"));
//        System.out.println(tourDTO.getLocation());
//        try {
//            boolean result = new TourDAO().createNewTour(tourDTO, tourItemsDTO);
//            if (result) {
//                System.out.println("HAHAHA");
//            } else {
//                System.out.println("BUGS BUGS BUGS");
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            System.out.println(e.getMessage());
//        }
//    }
}
