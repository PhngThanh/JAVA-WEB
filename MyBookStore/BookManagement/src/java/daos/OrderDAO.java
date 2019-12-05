/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtilities;

/**
 *
 * @author USER
 */
public class OrderDAO implements Serializable {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public void insertOrder(OrderDTO dto) throws SQLException, NamingException, NullPointerException {
       try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_Order VALUES (?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getUserId());
                ps.setFloat(2, dto.getTotalPrice());
                ps.setTimestamp(3, dto.getDate());
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }
    public int getOrderId(String date) throws SQLException, NamingException {
        int orderId = 0;
       try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT id FROM tbl_Order WHERE shoppingDate = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, date);
                rs = ps.executeQuery();
                if (rs.next()) {
                    orderId = rs.getInt("id");
                }
            }
        } finally {
            closeConnection();
        }
       return orderId;
    }
    
    public List<OrderDTO> getAllOrder(String user) throws NamingException, SQLException
    {   
        List<OrderDTO> orderList = new ArrayList();
        try{
            con = DBUtilities.makeConnection();
            if(con != null)
            {
                String sql = "SELECT id, userId, totalPrice, shoppingDate from tbl_Order where userId=? order by shoppingDate desc";
                ps = con.prepareStatement(sql);
                ps.setString(1, user);
                
                rs = ps.executeQuery();
                while(rs.next())
                {
                    int id = rs.getInt("id");
                    String userId = rs.getString("userId");
                    float totalPrice = rs.getFloat("totalPrice");
                    Timestamp shoppingDate = rs.getTimestamp("shoppingDate");
                    orderList.add(new OrderDTO(id, userId, totalPrice, shoppingDate));
                }
            }
        }finally{
            closeConnection();
        }return orderList;
    }
}
