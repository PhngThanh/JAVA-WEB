/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.CreateUpdateBookError;
import daos.BookDAO;
import dtos.BookDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class AddNewBookController extends HttpServlet {

    final static String ERROR = "error.html";
    final static String FAIL = "addNewBook.jsp";
    final static String SUCCESS = "addNewBook.jsp";

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
        String url = ERROR;
        CreateUpdateBookError error = new CreateUpdateBookError();
        BookDAO bookDAO = new BookDAO();
        boolean check = false;
        try {
            String id = request.getParameter("txtId");
            if (id.trim().length() == 0 || id.trim().length() > 10) {
                check = true;
                error.setBookIDIsExisted("bookID required from 1 to 10 characters");
            } else if (bookDAO.checkBookID(id)) {
                check = true;
                error.setBookIDIsExisted("bookID is already existed");
            }
            String title = request.getParameter("txtTitle");
            if (title.trim().length() < 2 || title.trim().length() > 50) {
                check = true;
                error.setBookTitleLength("Book title required from 2 to 50 characters");
            }
            String author = request.getParameter("txtAuthor");
            if (author.trim().length() < 2 || author.trim().length() > 50) {
                check = true;
                error.setAuthorLengthErr("Author required from 2 to 50 characters");
            }
            String des = request.getParameter("txtDescription");
            if (des.trim().length() < 2 || des.trim().length() > 50) {
                check = true;
                error.setDesciptionLengthErr("Description required from 2 to 50 characters");
            }
            String price = request.getParameter("txtPrice");
            float p = DataTypeUtilities.convertStringToFloat(price);
            if (p <= 0) {
                check = true;
                error.setPriceFormatErr("Price is a number and greater than 0");
            }
            String quantity = request.getParameter("txtQuantity");
            int q = DataTypeUtilities.convertStringToInt(quantity);
            if (q <= 0) {
                check = true;
                error.setPriceFormatErr("Quantity is a number and greater than 0");
            }
            Calendar cal = Calendar.getInstance();
            java.sql.Timestamp timestamp = new Timestamp(cal.getTimeInMillis());
            String date = "" + timestamp;

            String photo = request.getParameter("txtPhoto");
            String cat = request.getParameter("cbmChoosedCat");
            if (check) {
                request.setAttribute("ERRORCREATE", error);
                url = FAIL;
            } else {
                BookDTO dto = new BookDTO(id, title, photo, cat, author, p, date, true, des, q);
                BookDAO dao = new BookDAO();
                dao.insertNewBook(dto);   
                String createSuccess = "Create new Book successful";
                request.setAttribute("CREATESUCCESS", createSuccess);
                url = SUCCESS;
            }

        } catch (SQLException e) {
            log("SQL_Insert" + e.getMessage());
        } catch (NamingException e) {
            log("Naming_Insert" + e.getMessage());
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
