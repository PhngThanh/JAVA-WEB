/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CartDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import utils.DBUtilities;

/**
 *
 * @author USER
 */
public class OrderDetailDAO implements Serializable {

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

    public void insertOrderDetail(int orderId, CartDTO dto) throws SQLException, NamingException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_OrderDetail (OrderId, BookId, Title, Quantity, Price) VALUES (?,?,?,?,?)"
                        + " UPDATE tbl_Book SET Quantity = Quantity - ? WHERE BookId = ?"
                        + " UPDATE tbl_Book  SET isActive = 0 WHERE Quantity = 0";
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.setString(2, dto.getBookId());
                ps.setString(3, dto.getTitle());
                ps.setInt(4, dto.getQuantity());
                ps.setFloat(5, dto.getTotalUnitPrice());
                 ps.setInt(6, dto.getQuantity());
                 ps.setString(7, dto.getBookId());
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }
}
