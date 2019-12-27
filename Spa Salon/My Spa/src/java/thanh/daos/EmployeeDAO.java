/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanh.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import thanh.dtos.EmployeeDTO;
import thanh.utils.DBUtil;

/**
 *
 * @author THANH
 */
public class EmployeeDAO implements Serializable{
    public List<EmployeeDTO> getAllEmpInfo() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        List<EmployeeDTO> list = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT id, name, introduction, img, title from Employee";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    
                    String intro = rs.getString("introduction");
                    String title = rs.getString("title");
                    String img = rs.getString("img");

                    EmployeeDTO dto = new EmployeeDTO(id, name, "", "", intro, img, true, title);
                    list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    public EmployeeDTO getOwnerInfo() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT id, name, phone, img, email from Employee Where isOwner = 1";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String img = rs.getString("img");

                    EmployeeDTO dto = new EmployeeDTO(id, name, phone, email, "", img, true, "");
                    return dto;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
