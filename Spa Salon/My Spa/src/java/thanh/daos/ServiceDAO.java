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
import thanh.dtos.ServiceDTO;
import thanh.utils.DBUtil;

/**
 *
 * @author THANH
 */
public class ServiceDAO implements Serializable{
    public List<ServiceDTO> getAllServices() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        List<ServiceDTO> list = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT id, Title, intro, img from Service";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    int id = rs.getInt("id");
                    String name = rs.getString("Title");
                    
                    String infor = rs.getString("intro");
                    String img = rs.getString("img");


                    ServiceDTO dto = new ServiceDTO(id, name, infor, img);
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
