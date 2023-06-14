/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.TourDTO;
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

    public static void main(String[] args) {

        TourDAO dao = new TourDAO();
        try {
            List<TourDTO> dto = dao.getAllTours();
            for (TourDTO item : dto) {
                System.out.println(item.getTourID());
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
