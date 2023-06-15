/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.controller;

import com.admin.config.Config;
import com.admin.dao.AccountDAO;
import com.admin.dao.HashingPassword;
import com.admin.model.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thuyk
 */
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

    String DASHBOARD_URL = "ui-dashborad.jsp";
    String ERROR_URL = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = (String) request.getAttribute("action");
        switch (action) {
            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU GET
            ------------------------------------------------------------------------------*/
            case "hanleLogin":
                hanleLogin(request, response);
                break;
            case "hanleLogout":
                hanleLogout(request, response);
                break;

            /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU CREATE
            ------------------------------------------------------------------------------*/
            default:
                response.sendRedirect(ERROR_URL);
        }

    }

    /*------------------------------------------------------------------------------
                                FUNCTION XU LY YEU CAU
    ------------------------------------------------------------------------------*/
    // HanleLogin 
    protected void hanleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        HttpSession session = request.getSession();
        String url = Config.LAYOUT + ERROR_URL;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            // Khi người dùng nhập mật khẩu thì qua bên đây sẽ băm mật khẩu lại để có thể truy cập vào hệ thống 
            HashingPassword hash = new HashingPassword();
            AccountDAO dao = new AccountDAO();
            AccountDTO account = dao.getAccountByUsername_Password(email, hash.hash(password));

            if (account != null) {
                url = Config.LAYOUT + DASHBOARD_URL;
                session.setAttribute("admin", account);
                // chuyen huong ve trang chu
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException | IOException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    // HanleLogin 
    protected void hanleLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        HttpSession session = request.getSession();
        String url = Config.LAYOUT + ERROR_URL;
        try {
    
            if (session.getAttribute("admin") != null) {
                session.removeAttribute("admin");
                // chuyen huong ve login
                response.sendRedirect("/ADMIN_PAGE");
            } else {
                response.sendRedirect(url);
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
