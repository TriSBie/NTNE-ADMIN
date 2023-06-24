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
                String SQL = "SELECT TOP (1000) tr.[id]\n"
                        + "	  ,t.code, t.thumbnail\n"
                        + "      ,tr.[availability]\n"
                        + "      ,tr.[priceAdult]\n"
                        + "      ,tr.[priceChild]\n"
                        + "      ,tr.[quantity]\n"
                        + "      ,tr.[depart_time]\n"
                        + "  FROM [NTNECompany].[dbo].[Trip] tr JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.tour_id\n"
                        + "ORDER BY tr.[depart_time] DESC";
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

    //Get List Trip by state is false
    public List<TripDTO> getAllTrip_by_state_false()
            throws ClassNotFoundException, SQLException {
        List<TripDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT TOP (1000) tr.[id],t.code, t.thumbnail ,tr.[availability] ,tr.[priceAdult],tr.[priceChild],tr.[quantity],tr.[depart_time]\n"
                        + "FROM [NTNECompany].[dbo].[Trip] tr\n"
                        + "JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.tour_id\n"
                        + "WHERE [availability] = 0\n"
                        + "ORDER BY tr.[depart_time] DESC";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
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

    //Get List Trip by state is true
    public List<TripDTO> getAllTrip_by_state_true()
            throws ClassNotFoundException, SQLException {
        List<TripDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT TOP (1000) tr.[id],t.code, t.thumbnail ,tr.[availability] ,tr.[priceAdult],tr.[priceChild],tr.[quantity],tr.[depart_time]\n"
                        + "FROM [NTNECompany].[dbo].[Trip] tr\n"
                        + "JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.tour_id\n"
                        + "WHERE [availability] = 1\n"
                        + "ORDER BY tr.[depart_time] DESC";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
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

    // Lấy dữ liệu thông tin TRIP theo tripID
    public TripDTO getTrip_by_tripID(int tripID) throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT tp.id, t.name, t.thumbnail, tp.[priceAdult], tp.[priceChild], tp.[quantity], tp.[depart_time]\n"
                        + "FROM [dbo].[Trip] as tp, [dbo].[Tour] as t \n"
                        + "WHERE tp.tour_id = t.id AND tp.id = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, tripID);

                rs = ps.executeQuery();
                while (rs.next()) {
                    TripDTO trip = new TripDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getFloat(5), rs.getInt(6), rs.getDate(7));
                    return trip;
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

    public List<TripDTO> getTripPriceByAscending()
            throws ClassNotFoundException, SQLException {
        List<TripDTO> listTrip = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT TOP (1000) tr.[id]\n"
                        + "	  ,t.code, t.thumbnail\n"
                        + "      ,tr.[availability]\n"
                        + "      ,tr.[priceAdult]\n"
                        + "      ,tr.[priceChild]\n"
                        + "      ,tr.[quantity]\n"
                        + "      ,tr.[depart_time]\n"
                        + "  FROM [NTNECompany].[dbo].[Trip] tr JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.tour_id\n"
                        + "ORDER BY tr.[priceAdult]";
                ps = con.prepareStatement(SQL);
                listTrip = new ArrayList<>();
                rs = ps.executeQuery();
                while (rs.next()) {
                    TripDTO dto = new TripDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getDouble(5), rs.getDouble(6), rs.getInt(7), rs.getDate(8));
                    listTrip.add(dto);
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
        return listTrip;
    }

    public List<TripDTO> getTripPriceByDescending()
            throws ClassNotFoundException, SQLException {
        List<TripDTO> listTrip = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT tr.[id]\n"
                        + "	  ,t.code, t.thumbnail\n"
                        + "      ,tr.[availability]\n"
                        + "      ,tr.[priceAdult]\n"
                        + "      ,tr.[priceChild]\n"
                        + "      ,tr.[quantity]\n"
                        + "      ,tr.[depart_time]\n"
                        + "  FROM [NTNECompany].[dbo].[Trip] tr JOIN [NTNECompany].[dbo].[Tour] t ON t.id = tr.tour_id\n"
                        + "ORDER BY tr.[priceAdult] DESC";
                ps = con.prepareStatement(SQL);
                listTrip = new ArrayList<>();
                rs = ps.executeQuery();
                while (rs.next()) {
                    TripDTO dto = new TripDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getDouble(5), rs.getDouble(6), rs.getInt(7), rs.getDate(8));
                    listTrip.add(dto);
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
        return listTrip;
    }

    // Xử lí update dữ liệu cho thông tin TRIP theo TRIP ID; 
    public boolean updateTrip(double priceAdult, double priceChild, int quantity, String depart_time, int tripID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "UPDATE [dbo].[Trip]\n"
                        + "SET [priceAdult] = ?, [priceChild] = ?, [quantity] = ?, [depart_time] = ?\n"
                        + "WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setDouble(1, priceAdult);
                ps.setDouble(2, priceChild);
                ps.setInt(3, quantity);
                ps.setString(4, depart_time);
                ps.setInt(5, tripID);
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
        try {
            List<TripDTO> trip = new TripDAO().getTripPriceByDescending();
            for (TripDTO x : trip) {
                System.out.println(x.getPriceAdult());
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
