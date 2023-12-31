/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.ImageDTO;
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
public class ImageDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<ImageDTO> getAllImage()
            throws ClassNotFoundException, SQLException {
        List<ImageDTO> list = null;
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT [id],[name],[img_url],[tour_id]\n"
                        + "FROM [NTNECompany].[dbo].[Image]\n"
                        + "ORDER BY [id] DESC";
                list = new ArrayList<>();
                ps = con.prepareStatement(SQL);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ImageDTO dto = new ImageDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
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

    public boolean deleteImageByID(int id)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "DELETE FROM [dbo].[Image]\n"
                        + "WHERE id = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, id);
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

    public boolean addNewImage(ImageDTO dto)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "INSERT INTO [dbo].[Image]\n"
                        + "           ([name]\n"
                        + "           ,[img_url]\n"
                        + "           ,[tour_id])\n"
                        + "     VALUES (?, ?, ?)";
                ps = con.prepareStatement(SQL);
                ps.setString(1, dto.getImgName());
                ps.setString(2, dto.getImgURL());
                ps.setInt(3, dto.getTourID());
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

    public ImageDTO getImgByImgID(int imgID)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT [id]\n"
                        + "      ,[name]\n"
                        + "      ,[img_url]\n"
                        + "      ,[tour_id]\n"
                        + "  FROM [NTNECompany].[dbo].[Image]\n"
                        + "WHERE [dbo].[Image].id = ?";
                ps = con.prepareStatement(SQL);
                ps.setInt(1, imgID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ImageDTO img = new ImageDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                    return img;
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

    // Xử lí update dữ liệu cho thông tin Img theo IMG_ID; 
    public boolean updateImg(String name, String url, int tour_id, int img_id)
            throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "UPDATE [dbo].[Image]\n"
                        + "SET [name] = ?,  [img_url] = ?, [tour_id] = ?\n"
                        + "WHERE [id] = ?";
                ps = con.prepareStatement(SQL);
                ps.setString(1, name);
                ps.setString(2, url);
                ps.setInt(3, tour_id);
                ps.setInt(4, img_id);
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
}
