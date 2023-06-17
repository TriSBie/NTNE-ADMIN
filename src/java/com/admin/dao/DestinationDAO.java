/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.DestinationDTO;
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
public class DestinationDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<DestinationDTO> getAllDestination()
            throws ClassNotFoundException, SQLException {
        List<DestinationDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT [id]\n"
                        + "      ,[name]\n"
                        + "  FROM [NTNECompany].[dbo].[Destination]";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    DestinationDTO dto = new DestinationDTO(rs.getInt(1), rs.getString(2));
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
//    Get all list destination

    public List<DestinationDTO> getAll_List_Destination()
            throws ClassNotFoundException, SQLException {
        List<DestinationDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT * from  [dbo].[Destination]";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    DestinationDTO dto = new DestinationDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
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

    public boolean createDestination(DestinationDTO dto)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "INSERT INTO [dbo].[Destination]\n"
                        + "           ([name]\n"
                        + "           ,[description]\n"
                        + "           ,[lat]\n"
                        + "           ,[lon])\n"
                        + "     VALUES(?, ?, ?, ?)";
                ps = con.prepareStatement(SQL);
                ps.setString(1, dto.getName());
                ps.setNString(2, dto.getDescription());
                ps.setString(3, dto.getLat());
                ps.setString(4, dto.getLon());
                int result = ps.executeUpdate();
                if (result > 0) {
                    return true;
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
        return false;
    }

    public boolean editDestination(int destinationID, DestinationDTO dto)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "UPDATE [dbo].[Destination]\n"
                        + "   SET [name] = ?\n"
                        + "      ,[description] = ?\n"
                        + "      ,[lat] = ?\n"
                        + "      ,[lon] = ?\n"
                        + " WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setString(1, dto.getName());
                ps.setNString(2, dto.getDescription());
                ps.setString(3, dto.getLat());
                ps.setString(4, dto.getLon());
                ps.setInt(5, destinationID);
                int result = ps.executeUpdate();
                if (result > 0) {
                    return true;
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
        return false;
    }

//    public static void main(String[] args) {
//        try {
//            List<DestinationDTO> dto = new DestinationDAO().getAll_List_Destination();
//            for (DestinationDTO item : dto) {
//                System.out.println(item.getLat());
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            System.out.println(e.getMessage());
//        }
//    }
}
