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
                String SQL = "BEGIN TRY\n"
                        + "		BEGIN TRANSACTION\n"
                        + "		INSERT INTO Tour\n"
                        + "		VALUES(?, ?, ?, ?, ?)\n"
                        + "		DECLARE @TOURID INT;\n"
                        + "		SELECT TOP 1 @TOURID = Tour.ID FROM [dbo].[Tour]\n"
                        + "		ORDER BY Tour.id DESC\n"
                        + "		DECLARE @COUNT INT = 0;\n"
                        + "		WHILE @COUNT < ?\n"
                        + "		BEGIN\n"
                        + "		INSERT INTO TourItem\n"
                        + "		VALUES(@TOURID,?, ?, ?)\n"
                        + "		SET @COUNT = @COUNT + 1;\n"
                        + "		END\n"
                        + "		COMMIT TRANSACTION\n"
                        + "END TRY\n"
                        + "BEGIN CATCH\n"
                        + "    IF @@TRANCOUNT > 0\n"
                        + "        ROLLBACK TRANSACTION;\n"
                        + "    PRINT ERROR_MESSAGE();\n"
                        + "END CATCH;";
                ps = con.prepareStatement(SQL);
                //Insert tour
                ps.setString(1, tourDTO.getTourName());
                ps.setDouble(2, tourDTO.getPriceAdult());
                ps.setDouble(3, tourDTO.getPriceChild());
                ps.setString(4, tourDTO.getThumbnail());
                ps.setString(5, tourDTO.getLocation());

                ps.setInt(6, tourItemDTO.size());
                //Vòng lặp để tạo các TourItem
                for (int i = 0; i < tourItemDTO.size(); i++) {
                    System.out.println(tourItemDTO.get(i).getDestinationID());
                    System.out.println(tourItemDTO.get(i).getDescription());
                    System.out.println(tourItemDTO.get(i).getDuration());
                    ps.setInt(7, tourItemDTO.get(i).getDestinationID());
                    ps.setString(8, tourItemDTO.get(i).getDescription());
                    ps.setString(9, tourItemDTO.get(i).getDuration());
                }
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

    public static void main(String[] args) {
        TourDTO tourDTO = new TourDTO("Da nang 1 Minh Em", 1000000, 2000000, "abcdxez.com", "dia diem1, dia diem 2, dia diem 3");
        List<TourItemDTO> tourItemsDTO = new ArrayList<>();
        tourItemsDTO.add(new TourItemDTO(3, "8h-12h", "Sang di ban ca, toi ve ban em"));

        try {
            boolean result = new TourDAO().createNewTour(tourDTO, tourItemsDTO);
            if (result) {
                System.out.println("HAHAHA");
            } else {
                System.out.println("BUGS BUGS BUGS");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
