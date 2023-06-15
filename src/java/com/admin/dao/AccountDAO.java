/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import com.admin.model.AccountDTO;
import com.admin.model.DestinationDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author buidu
 */
public class AccountDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // Lấy tài khoản theo password và username
    public AccountDTO getAccountByUsername_Password(String email, String password) throws ClassNotFoundException, SQLException {
        try {
            con = DBContext.getConnectionDB();
            if (con != null) {
                String SQL = "SELECT * from [dbo].[Account] where [role] = 'AM' AND [email] = ? AND [password] = ?";
                ps = con.prepareStatement(SQL);
                ps.setString(1, email);
                ps.setString(2, password);
                rs = ps.executeQuery();
                while (rs.next()) {
                    AccountDTO account = new AccountDTO(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getInt(8), rs.getBoolean(9), rs.getString(10));
                    return account;
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
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        AccountDAO accountDAO = new AccountDAO();
        AccountDTO account = accountDAO.getAccountByUsername_Password("admin1@gmail.com", "8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92");
        System.out.println(account);
    }
}
