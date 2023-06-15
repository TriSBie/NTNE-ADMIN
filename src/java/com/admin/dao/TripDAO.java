/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.TripDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
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

//Get List Trip
    public List<TripDTO> getAllTrip()
            throws ClassNotFoundException, SQLException {
        List<TripDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
//                String SQL = "SELECT TOP (1000) tr.[id]\n"
//                        + "	  ,t.name, t.thumbnail\n"
//                        + "      ,tr.[availability]\n"
//                        + "      ,tr.[priceAdult]\n"
//                        + "      ,tr.[priceChild]\n"
//                        + "      ,tr.[quantity]\n"
//                        + "      ,tr.[depart_time]\n"
//                        + "  FROM [NTNECompany].[dbo].[Trip] tr JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.id";
                String SQL = "SELECT TOP (1000) tr.[id]\n"
                        + "	  ,t.name, t.thumbnail\n"
                        + "      ,tr.[availability]\n"
                        + "      ,tr.[priceAdult]\n"
                        + "      ,tr.[priceChild]\n"
                        + "      ,tr.[quantity]\n"
                        + "      ,tr.[depart_time]\n"
                        + "  FROM [NTNECompany].[dbo].[Trip] tr JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.tour_id";
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

    // Hanler Create Trip 
    public boolean createTrip(float priceAdult, float priceChild, int quantity, String depart_time, int tour_id)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "INSERT INTO [dbo].[Trip] (priceAdult, priceChild, quantity, depart_time, tour_id) VALUES (?,?,?,?,?)";
                ps = con.prepareStatement(SQL);
                ps.setFloat(1, priceAdult);
                ps.setFloat(2, priceChild);
                ps.setInt(3, quantity);
                ps.setString(4, depart_time);
                ps.setInt(5, tour_id);
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

    // Xử lí đổi trạng thái TRIP
    public boolean changeStateTrip(int tripid)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "BEGIN \n"
                        + "	DECLARE @availability bit;\n"
                        + "\n"
                        + "	SELECT\n"
                        + "		@availability = [availability]\n"
                        + "	FROM [dbo].[Trip]\n"
                        + "	WHERE id = ?;\n"
                        + "\n"
                        + "	IF @availability = 0\n"
                        + "	BEGIN \n"
                        + "	    UPDATE [dbo].[Trip] SET [availability] = 1 	WHERE id = ?;\n"
                        + "	END\n"
                        + "\n"
                        + "	ELSE \n"
                        + "	BEGIN \n"
                        + "		UPDATE [dbo].[Trip] SET [availability] = 0 WHERE id = ?;\n"
                        + "	END\n"
                        + "END";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tripid);
                ps.setInt(2, tripid);
                ps.setInt(3, tripid);
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

    public static void main(String[] args) {

        TripDAO dao = new TripDAO();
        try {
            boolean checkCreate = dao.changeStateTrip(1);
            System.out.println(checkCreate);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
