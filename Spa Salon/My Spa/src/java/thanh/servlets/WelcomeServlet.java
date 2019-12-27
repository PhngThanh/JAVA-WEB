/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanh.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thanh.daos.CourseDAO;
import thanh.daos.EmployeeDAO;
import thanh.daos.IntroduceDAO;
import thanh.dtos.CourseDTO;
import thanh.dtos.EmployeeDTO;
import thanh.dtos.IntroduceDTO;

/**
 *
 * @author THANH
 */
public class WelcomeServlet extends HttpServlet {

    public static final String ERROR = "error.html";
    public static final String WELCOME_PAGE = "Welcome.jsp";

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
        try {
            IntroduceDAO iDao = new IntroduceDAO();
            List<IntroduceDTO> list = iDao.getListIntro();
            request.setAttribute("INTRO", list);
           
            CourseDAO cDao = new CourseDAO();
            List<CourseDTO> cList = cDao.getListCourseIntro();
            request.setAttribute("COURSEINFO", cList);
            
            EmployeeDAO eDao =new EmployeeDAO();
            EmployeeDTO emp = eDao.getOwnerInfo();
            request.setAttribute("OWNER", emp);
            url = WELCOME_PAGE;
        } catch (SQLException e) {
            log("Welcome_SQL" + e.getMessage());
        } catch (NamingException e) {
            log("Welcome_Naming" + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
