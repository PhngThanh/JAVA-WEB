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
import thanh.dtos.IntroduceDTO;
import thanh.utils.DBUtil;

/**
 *
 * @author THANH
 */
public class IntroduceDAO implements Serializable{
    public List<IntroduceDTO> getListIntro() throws NamingException, SQLException {
        //Các biến dùng kết nối DBUtil
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;

        List<IntroduceDTO> list = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                //tao cau truy van SQL
                String sql = "SELECT TOP 3 id, Title, description, date, img from Introduce order by date desc ";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);

                while (rs.next()) {
                    //cac bien lay gia tri DB
                    int id = rs.getInt("id");
                    String title = rs.getString("Title");
                    String des = rs.getString("description");
                    String img = rs.getString("img");
                    String date = rs.getString("date");
                   
                    IntroduceDTO dto = new IntroduceDTO(id, title, des, date, img);
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
