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
import thanh.dtos.TreatmentDTO;
import thanh.utils.DBUtil;

/**
 *
 * @author THANH
 */
public class TreatmentDAO implements Serializable{
    public List<TreatmentDTO> getAllTreatment() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        List<TreatmentDTO> list = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT id, name, serviceId, infor, price from Treatment";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    int serviceId = rs.getInt("serviceId");
                    String infor = rs.getString("infor");
                    float price = rs.getFloat("price");

                    TreatmentDTO dto = new TreatmentDTO(id, name, serviceId, infor, price);
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
