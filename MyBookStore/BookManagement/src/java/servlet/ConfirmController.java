/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daos.BookDAO;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import dtos.CartDTO;

import dtos.CartObj;
import dtos.OrderDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author USER
 */
public class ConfirmController extends HttpServlet {

    private final String SUCCESS = "SearchController";
    private final String FAIL = "viewCart.jsp";

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
        String url = FAIL;
        List<String> errorList = new ArrayList<>();
        try {
            HttpSession session = request.getSession();

            if (session != null) {
                CartObj cart = (CartObj) session.getAttribute("CART");
                BookDAO bookDao = new BookDAO();
                boolean check = true;
                for (Map.Entry<String, CartDTO> dto : cart.getCart().entrySet()) {
                    int quantity = dto.getValue().getQuantity();
                    if (quantity > bookDao.getQuantity(dto.getValue().getBookId())) {
                        check = false;
                        String error = "Book: " + dto.getValue().getTitle() + " is out of Stock!!";
                        errorList.add(error);
                        
                    }
                }
                if (check) {
                    String userId = (String) session.getAttribute("USERID");

                    Calendar cal = Calendar.getInstance();
                    java.sql.Timestamp date = new Timestamp(cal.getTimeInMillis());
                    String dateTime = "" + date;
                    float totalPrice = cart.getTotal();
                    OrderDAO orderDAO = new OrderDAO();
                    OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                    orderDAO.insertOrder(new OrderDTO(userId, totalPrice, date));
                    int orderId = orderDAO.getOrderId(dateTime);
                    for (Map.Entry<String, CartDTO> dto : cart.getCart().entrySet()) {
                        orderDetailDAO.insertOrderDetail(orderId, dto.getValue());
                    }
                    session.setAttribute("ORDERLIST", orderDAO.getAllOrder(userId));
                    session.removeAttribute("CART");
                    url = SUCCESS;
                } else{
                    request.setAttribute("ERROR", errorList);
                }

                
            }

        } catch (SQLException e) {
            log("SQL_Confirm" + e.getMessage());
        } catch (NamingException e) {
            log("Naming_Confirm" + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
