/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanh.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import thanh.dtos.CourseDTO;
import thanh.utils.DBUtil;

/**
 *
 * @author THANH
 */
public class CourseDAO implements Serializable {

    public List<CourseDTO> getListCourse() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        List<CourseDTO> list = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT id, title,info, price from Course";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    int id = rs.getInt("id");
                    String name = rs.getString("title");
                    String infor = rs.getString("info");
                    float price = rs.getFloat("price");

                    CourseDTO dto = new CourseDTO(id, name, "", infor, "", price, "", "");
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

    public List<CourseDTO> getListCourseIntro() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        List<CourseDTO> list = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT alias, description, date from Course";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    String alias = rs.getString("alias");
                    String des = rs.getString("description");
                    
                    Date date = rs.getDate("date");

                    DateFormat df = new SimpleDateFormat("MMM. dd, yyyy");
                    String strDate = df.format(date);

                    CourseDTO dto = new CourseDTO(0, "", des, "", strDate, 0, alias, "");
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
}
