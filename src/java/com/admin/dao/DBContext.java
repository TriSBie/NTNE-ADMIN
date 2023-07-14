/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author buidu
 */
public class DBContext {

    public static Connection getConnectionDB()
            throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String sql = "jdbc:sqlserver://34.142.152.99;databaseName=NTNECompany";
        Connection con = DriverManager.getConnection(sql, "sqlserver", "Dat123vn");
        return con;
    }
    
    
    public static void main(String[] args) {
        DBContext b = new DBContext();
        System.out.println(b);
    }
}
