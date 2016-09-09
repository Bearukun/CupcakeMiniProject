/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * 
 */
package servlets;

import data.Db;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bearu
 */
@WebServlet(name = "Front", urlPatterns = {"/Front"})
public class Front extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String origin = request.getParameter("origin");

        switch (origin) {

            case "userlist":
                List<User> users = new ArrayList();
                try {
                    ResultSet rs = Db.getConnection().prepareStatement("SELECT * FROM login").executeQuery();
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String username = rs.getString(2);
                        String password = rs.getString(3);
                        users.add(new User(id, username, password));
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                request.getSession().setAttribute("users", users);
                response.sendRedirect("userlist.jsp");

                break;

            case "register":
                try {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String sql = "INSERT INTO login (username, password) VALUES (?, ?)";
                    PreparedStatement pstmt = Db.getConnection().prepareStatement(sql);
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    pstmt.executeUpdate();
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("password", password);
                    request.getRequestDispatcher("result.jsp").forward(request, response);
                    response.getWriter().print("SUCCESS! the user is added");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                break;

            default:
                break;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
