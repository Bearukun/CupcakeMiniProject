package servlets;

import data.Db;
import entity.Cupcake;
import entity.Layer;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Alert;
import javax.servlet.RequestDispatcher;
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

    ArrayList<Layer> theBottoms = new ArrayList();
    ArrayList<Layer> theToppings = new ArrayList();
    ArrayList<Cupcake> theCupcakes = new ArrayList();
    ArrayList<Cupcake> basket = new ArrayList();
    int grandTotal = 0;
    int userBalance = 0;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String origin = request.getParameter("origin");
        String selectedIdBasket = request.getParameter("selectedIdBasket");

        //Switch system for each button's actions on the various slides
        switch (origin) {

            //Login to the website
            case "login":

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String sql = "SELECT idUser from user where binary username like ? and binary password like ?";
                 {
                    try {
                        PreparedStatement pstmtLogin = Db.getConnection().prepareStatement(sql);

                        pstmtLogin.setString(1, username);
                        pstmtLogin.setString(2, password);

                        
                        ResultSet rs = pstmtLogin.executeQuery();

                        if (rs.next()) {
                            String sqlBalance = "SELECT balance FROM user where idUser = " + rs.getInt(1) + ";";
                            PreparedStatement sqlBalpstmt = Db.getConnection().prepareStatement(sqlBalance);
                            ResultSet balance = sqlBalpstmt.executeQuery();
                            balance.last();
                            userBalance = balance.getInt("balance");

                            request.getSession().setAttribute("balance", userBalance);
                            request.getSession().setAttribute("username", username);

                            refreshCupcakes(1);
                            request.getSession().setAttribute("toppings", theToppings);
                            request.getSession().setAttribute("bottoms", theBottoms);
                            request.getSession().setAttribute("cupcakes", theCupcakes);

                            response.sendRedirect("theshop.jsp");

                            //Error Message hvis bruger ikke findes
                        } else {
                            request.setAttribute("error", "Invalid username or password");
                            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                            rd.include(request, response);
                            //response.sendRedirect("login.jsp#");
                        }

                    } catch (SQLException ex) {
                        Logger.getLogger(Front.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

                break;
            //Logout of the website
            case "logout":

                request.getSession().invalidate();
                response.sendRedirect("login.jsp#");

                break;

            //Empty the customer basket
            case "empty":

                basket.clear();
                grandTotal = calGrandTotal();
                request.getSession().setAttribute("grandTotal", grandTotal);
                response.sendRedirect("basket.jsp#empty");

                break;

            //Adds a custom cupcake to the selectable drop down menu
            case "addCupcake":

                try {

                    String cupName = request.getParameter("cupcakeName");
                    String cupTopping = request.getParameter("selectedTopping").split("\\|")[0];
                    String cupButtom = request.getParameter("selectedBottom").split("\\|")[0];

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(" + cupTopping + ");");
                    out.println("</script>");

                    //String sqlRegister = "INSERT INTO `cupcakeshop`.`cupcake` (`cupcakeName`, `idTopping`, `idBottom`) VALUES (\"" + cupName + "\", (select idTopping from cupcaketopping where cupcakeToppingPiece like \"" + cupTopping + "\"), (select idBottom from cupcakebottom where cupcakeBottomPiece like \"" + cupButtom + "\"));";
                    String sqlRegister = "INSERT INTO `cupcakeshop`.`cupcake` (`cupcakeName`, `idTopping`, `idBottom`) VALUES (?, (select idTopping from cupcaketopping where cupcakeToppingPiece like ?), (select idBottom from cupcakebottom where cupcakeBottomPiece like ?));";

                    PreparedStatement pstmt = Db.getConnection().prepareStatement(sqlRegister);

                    pstmt.setString(1, cupName);
                    pstmt.setString(2, cupTopping.substring(0, cupTopping.length() - 1));
                    pstmt.setString(3, cupButtom.substring(0, cupButtom.length() - 1));

                    pstmt.executeUpdate();

                    refreshCupcakes(2);
                    response.sendRedirect("theshop.jsp#" + cupTopping);

                } catch (SQLException ex) {
                    ex.printStackTrace();
                }

                break;

            //Adds the selected cup cake to the customers basket
            case "addToBasket":

                String cupName = request.getParameter("selectedCupcake");
                String[] cupNameSplit = cupName.split("#");
                boolean boolie = false;
                int cupId = Integer.parseInt(cupNameSplit[0]);

                for (int i = 0; i < theCupcakes.size(); i++) {

                    if (cupId == theCupcakes.get(i).getIdCupcake()) {

                        for (int j = 0; j < basket.size(); j++) {

                            if (basket.get(j).getIdCupcake() == cupId) {

                                basket.get(j).setQty(basket.get(j).getQty() + 1);

                                boolie = true;

                            }

                        }

                        if (!boolie) {

                            basket.add(new Cupcake(theCupcakes.get(i).getIdCupcake(), theCupcakes.get(i).getCupCakename(), theCupcakes.get(i).getIdTopping(), theCupcakes.get(i).getIdBottom(), 1));

                        }

                    }

                }

                grandTotal = calGrandTotal();

                response.sendRedirect("theshop.jsp#");

                break;

            //Takes the customer to the basket
            case "goToBasket":

                request.getSession().setAttribute("basket", basket);
                request.getSession().setAttribute("grandTotal", grandTotal);
                response.sendRedirect("basket.jsp");

                break;

            //Takes the customer from the basket to checkout(invoice)
            case "checkout":

                //if user doesn't have enough funds!
                if (grandTotal >= userBalance) {
                    response.sendRedirect("basket.jsp#not enough money");

                    //else if user has enough funds!
                } else {

                    grandTotal = finalGrandTotal();
                    //userBalance = userBalance - finalGrandTotal();
                    request.getSession().setAttribute("balance", userBalance);
                    request.getSession().setAttribute("grandTotal", grandTotal);
                    response.sendRedirect("checkout.jsp");

//                    try {
//
//                        PreparedStatement sqlBalpstmt = Db.getConnection().prepareStatement(sqlBalance);
//                        ResultSet balance = sqlBalpstmt.executeQuery();
//                        balance.last();
//                        int userBalance = balance.getInt("balance");
//
//                        request.getSession().setAttribute("balance", userBalance);
//
//                    } catch (SQLException ex) {
//                        Logger.getLogger(Front.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                }

                break;

            default:
                break;
        }

    }

//Methods used to make thing more easy for us.
    //Calculates the grandTotal of the cupcakes price
    protected int calGrandTotal() {

        int temp = 0;

        for (Cupcake basketItem : basket) {

            temp += ((theToppings.get(basketItem.getIdTopping()).getPrice() + theBottoms.get(basketItem.getIdBottom()).getPrice()) * basketItem.getQty());

        }

        return temp;
    }

    //Final balance for checkout
    protected int finalGrandTotal() {

        int temp = 0;
        for (Cupcake basketItem : basket) {

            temp += ((theToppings.get(basketItem.getIdTopping()).getPrice() + theBottoms.get(basketItem.getIdBottom()).getPrice()) * basketItem.getQty());

        }

        return userBalance - temp;

    }

    protected int finalBalance() {

        return finalGrandTotal();

    }

    //Refreshes cupcakes to make clear for new ones
    protected void refreshCupcakes(int type) {

        if (type == 1) {

            try {
                theToppings.clear();
                //Populate theToppings! 
                ResultSet rs = Db.getConnection().prepareStatement("SELECT * FROM cupcaketopping").executeQuery();
                while (rs.next()) {
                    int topId = rs.getInt(1);
                    String topCupcakeLayerPiece = rs.getString(2);
                    int topPrice = rs.getInt(3);
                    theToppings.add(new Layer(topId, topCupcakeLayerPiece, topPrice));
                }
                theBottoms.clear();
                //Populate theBottoms! 
                rs = Db.getConnection().prepareStatement("SELECT * FROM cupcakebottom").executeQuery();
                while (rs.next()) {
                    int botId = rs.getInt(1);
                    String botCupcakeLayerPiece = rs.getString(2);
                    int botPrice = rs.getInt(3);
                    theBottoms.add(new Layer(botId, botCupcakeLayerPiece, botPrice));
                }
                theCupcakes.clear();
                //Populate theCupcakes! 
                rs = Db.getConnection().prepareStatement("SELECT * FROM cupcake").executeQuery();
                while (rs.next()) {
                    int cupcakeId = rs.getInt(1);
                    String cupcakeName = rs.getString(2);
                    int cupcakeIdTopping = rs.getInt(3);
                    int cupcakeIdBottom = rs.getInt(4);
                    theCupcakes.add(new Cupcake(cupcakeId, cupcakeName, cupcakeIdTopping, cupcakeIdBottom));
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        } else if (type == 2) {

            try {
                //Clear all elements!
                theCupcakes.clear();
                //Populate theCupcakes! 
                ResultSet rs = Db.getConnection().prepareStatement("SELECT * FROM cupcake").executeQuery();
                while (rs.next()) {
                    int cupcakeId = rs.getInt(1);
                    String cupcakeName = rs.getString(2);
                    int cupcakeIdTopping = rs.getInt(3);
                    int cupcakeIdBottom = rs.getInt(4);
                    theCupcakes.add(new Cupcake(cupcakeId, cupcakeName, cupcakeIdTopping, cupcakeIdBottom));
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

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
