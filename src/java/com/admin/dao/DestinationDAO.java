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
    
//    public static void main(String[] args) {
//        try {
//            List<DestinationDTO> dto = new DestinationDAO().getAllDestination();
//            for (DestinationDTO item : dto) {
//                System.out.println(item.getName());
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            System.out.println(e.getMessage());
//        }
//    }
    
}
