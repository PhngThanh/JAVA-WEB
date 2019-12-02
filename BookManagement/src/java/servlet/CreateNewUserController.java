/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.CreateUserError;
import daos.UserDAO;
import dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hieu
 */
@WebServlet(name = "CreateNewUserController", urlPatterns = {"/CreateNewUserController"})
public class CreateNewUserController extends HttpServlet {
    private final String ERROR = "createNewUser.jsp";
    private final String SUCCESS = "createNewUser.jsp";
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
        CreateUserError error = new CreateUserError();
        UserDAO userDAO = new UserDAO();
        boolean check = false;
        try  { 
            String userId = request.getParameter("txtUserId");
            if (userId.trim().length() == 0 || userId.trim().length() > 10) {
                check = true;
                error.setUserIdError("UserID required from 1 to 10 characters");
            } else if (userDAO.checkUserId(userId)) {
                check = true;
                error.setUserIdError("UserID is already existed");
            }
            String userName = request.getParameter("txtUserName");
            if (userName.trim().length() == 0 || userName.trim().length() > 10) {
                check = true;
                error.setUserNameError("User Name required from 1 to 10 characters");
            }
            String password = request.getParameter("txtPassword");
            if (password.trim().length() <= 2 || password.trim().length() > 10) {
                check = true;
                error.setPasswordError("Password required from 3 to 10 characters");
            }
            String confirm = request.getParameter("txtConfirmPassword");
            if (!password.trim().equals(confirm)) {
                check = true;
                error.setConfirmPasswordError("Confirm password not matched");
            }
            String roleId = request.getParameter("cbmChoosedRole");
            if(check)
            {
                request.setAttribute("ERRORCREATEUSER", error);
            }
            else
            {
                String successMessage = "Create new user successful";
                userDAO.createNewUser(new UserDTO(userId, password, roleId, userName, true));
                request.setAttribute("SUCCESSCREATEUSER", successMessage);
                url = SUCCESS;
            }
        }catch (SQLException e) {
            log("SQL_CreateUser" + e.getMessage());
        } catch (NamingException e) {
            log("Naming_CreateUser" + e.getMessage());
        }
        finally{
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
