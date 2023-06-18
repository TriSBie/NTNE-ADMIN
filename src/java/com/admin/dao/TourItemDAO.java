/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

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
public class TourItemDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<TourItemDTO> getAllTourItems()
            throws ClassNotFoundException, SQLException {
        List<TourItemDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
//                String SQL = "SELECT [id]\n"
//                        + "      ,[tour_id]\n"
//                        + "      ,[destination_id]\n"
//                        + "      ,[script]\n"
//                        + "  FROM [NTNECompany].[dbo].[TourItem] ";
                String SQL = " SELECT ti.id, t.name, t.thumbnail, d.name,ti.duration, ti.script\n"
                        + "  FROM [NTNECompany].[dbo].[TourItem] ti JOIN [NTNECompany].[dbo].[Tour] t ON ti.tour_id = t.id \n"
                        + "  JOIN [NTNECompany].[dbo].[Destination] d ON ti.destination_id = d.id";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int tourItemID = rs.getInt(1);
                    String tourName = rs.getString(2);
                    String thumbnail = rs.getString(3);
                    String destinationName = rs.getString(4);
                    String duration = rs.getString(5);
                    String script = rs.getString(6);
                    TourItemDTO dto = new TourItemDTO(tourItemID, tourName, thumbnail, destinationName, duration, script);
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

    public List<TourItemDTO> getListTourItemByTourID(int tourID)
            throws ClassNotFoundException, SQLException {
        List<TourItemDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = " SELECT ti.id, t.name, t.thumbnail, d.name,ti.duration, ti.script\n"
                        + "  FROM [NTNECompany].[dbo].[TourItem] ti JOIN [NTNECompany].[dbo].[Tour] t ON ti.tour_id = t.id \n"
                        + "  JOIN [NTNECompany].[dbo].[Destination] d ON ti.destination_id = d.id\n"
                        + "  WHERE ti.tour_id = ?";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tourID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int tourItemID = rs.getInt(1);
                    String tourName = rs.getString(2);
                    String thumbnail = rs.getString(3);
                    String destinationName = rs.getString(4);
                    String duration = rs.getString(5);
                    String script = rs.getString(6);
                    TourItemDTO dto = new TourItemDTO(tourItemID, tourName, thumbnail, destinationName, duration, script);
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

    // Get TourItem by tourItemID 
    public TourItemDTO getTourItem_By_TourItemID(int tourItemID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT tp.id, t.name, t.thumbnail, tp.destination_id, tp.duration, tp.script, tp.tour_id\n"
                        + "FROM [dbo].[TourItem] as tp, [dbo].[Tour] as t\n"
                        + "WHERE tp.[id] = ? AND tp.tour_id = t.id";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tourItemID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    TourItemDTO tourITem = new TourItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                    return tourITem;
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

    // Xử lí update dữ liệu cho thông tin TOURITEM theo TOURITEM ID; 
    public boolean updateTourItem_by_TourItemID(int destination_id, String description, String duration, int tourItemId)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "UPDATE [dbo].[TourItem]\n"
                        + "SET [destination_id] = ?, [script] = ?, [duration] = ?\n"
                        + "WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, destination_id);
                ps.setString(2, description);
                ps.setString(3, duration);
                ps.setInt(4, tourItemId);
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

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        TourItemDAO dao = new TourItemDAO();

        boolean check = dao.updateTourItem_by_TourItemID(2, "2", "8:00 - 08:32", 1);
        System.out.println(check);
    }
}
