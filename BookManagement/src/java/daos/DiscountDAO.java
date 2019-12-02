/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.DiscountDTO;
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
public class DiscountDAO implements Serializable {
     private String userId;
     private String discountCode;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }
     

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

    public void createNewDiscountCode(DiscountDTO dto) throws SQLException, NamingException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_Discount values(?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getDiscountCode());
                ps.setString(2, dto.getUserId());
                ps.setBoolean(3, dto.isIsActive());
                ps.setInt(4, dto.getDiscountPercent());
                ps.setString(5, dto.getCreateDate());
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }

    public boolean checkDiscountCode(String userId, String discountCode) throws NamingException, SQLException {
        boolean check = false;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT userId, discountCode FROM tbl_Discount WHERE userId = ? OR discountCode = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, userId);
                ps.setString(2, discountCode);
                rs = ps.executeQuery();
                if (rs.next()) {
                    this.userId = rs.getString("userId");    
                    this.discountCode = rs.getString("discountCode");    
                    check = true;
                }
            }
        } finally {
            closeConnection();
        }return check;
    }
}
