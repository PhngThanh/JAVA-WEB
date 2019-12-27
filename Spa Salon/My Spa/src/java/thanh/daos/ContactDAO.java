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
import javax.naming.NamingException;
import thanh.dtos.ContactDTO;
import thanh.utils.DBUtil;

/**
 *
 * @author THANH
 */
public class ContactDAO implements Serializable{
    public ContactDTO getContactInfo() throws SQLException, NamingException{
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT address, city, country, Phone, email from [Contact]";
                stm = con.createStatement();
                rs =stm.executeQuery(sql);

                if (rs.next()) {
                    //cac bien lay gia tri DB
                    String address = rs.getString("address");
                    String city = rs.getString("city");
                    String country = rs.getString("country");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("email");

                    ContactDTO dto = new ContactDTO(address, city, country, phone, email);
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
