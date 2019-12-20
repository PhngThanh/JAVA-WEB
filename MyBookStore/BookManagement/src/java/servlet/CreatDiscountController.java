/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.CreateDiscountCodeError;
import daos.DiscountDAO;
import dtos.DiscountDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.DataTypeUtilities;

/**
 *
 * @author USER
 */
public class CreatDiscountController extends HttpServlet {

    private final String ERROR = "addDiscount.jsp";
    private final String SUCCESS = "LoadUserController";

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
        String url = ERROR;
        boolean check;
        CreateDiscountCodeError error = new CreateDiscountCodeError();
        try {
            String discountCode = request.getParameter("txtDiscountId");
            String userId = request.getParameter("txtUserId");
            DiscountDAO discountDAO = new DiscountDAO();
            check = discountDAO.checkDiscountCode(userId, discountCode);
            
            if (check) {
                if(discountDAO.getUserId() != null){
                    error.setUserIdError("User already existed");
                }
                if(discountDAO.getDiscountCode() != null){
                    error.setDiscountCodeError("Discount code already existed");
                }
                request.setAttribute("ERROR", error);
            } else {
                String percent = request.getParameter("cbPercent");
                int p = DataTypeUtilities.convertStringToInt(percent);
                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new Timestamp(cal.getTimeInMillis());
                String date = "" + timestamp;
                discountDAO.createNewDiscountCode(new DiscountDTO(discountCode, userId, true, p, date));
                url = SUCCESS;
            }
        } catch (SQLException e) {
            log("SQL_Discount" + e.getMessage());
        } catch (NamingException e) {
            log("Naming_DIscount" + e.getMessage());
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
