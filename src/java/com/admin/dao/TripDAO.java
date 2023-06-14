/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.TripDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buidu
 */
public class TripDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<TripDTO> getAllTrip()
            throws ClassNotFoundException, SQLException {
        List<TripDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT TOP (1000) tr.[id]\n"
                        + "	  ,t.name, t.thumbnail\n"
                        + "      ,tr.[availability]\n"
                        + "      ,tr.[priceAdult]\n"
                        + "      ,tr.[priceChild]\n"
                        + "      ,tr.[quantity]\n"
                        + "      ,tr.[depart_time]\n"
                        + "  FROM [NTNECompany].[dbo].[Trip] tr JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.id";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    TripDTO dto = new TripDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getDouble(5), rs.getDouble(6), rs.getInt(7), rs.getDate(8));
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

        TripDAO dao = new TripDAO();
        try {
            List<TripDTO> dto = dao.getAllTrip();
            for (TripDTO item : dto) {
                System.out.println(item.getDepart_time());
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
