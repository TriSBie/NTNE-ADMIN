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
        String sql = "jdbc:sqlserver://demo-ms.cestdggebmjp.ap-southeast-1.rds.amazonaws.com.:1433;databaseName=NTNECompany";
        Connection con = DriverManager.getConnection(sql, "admin", "Dat123vn");
        return con;
    }
}
