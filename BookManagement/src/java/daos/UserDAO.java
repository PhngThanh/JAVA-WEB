/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtilities;

/**
 *
 * @author hieu
 */
public class UserDAO implements Serializable {

    private String roleId;
    private String userName;

    public String getRoleId() {
        return roleId;
    }

    public String getUserName() {
        return userName;
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

    public boolean checkLogin(String userId, String password) throws NamingException, SQLException {
        boolean check = false;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT roleId, userName FROM tbl_User WHERE userId = ? AND password = ? AND isActive = 'TRUE'";
                ps = con.prepareStatement(sql);
                ps.setString(1, userId);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    this.roleId = rs.getString("roleId");
                    this.userName = rs.getString("userName");
                    check = true;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public void createNewUser(UserDTO dto) throws SQLException, NamingException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_User VALUES (?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getUserId());
                ps.setString(2, dto.getPassword());
                ps.setString(3, dto.getRoleId());
                ps.setString(4, dto.getUserName());
                ps.setBoolean(5, dto.isIsActive());
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }

    public boolean checkUserId(String userId) throws SQLException, NamingException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT userID FROM tbl_User Where userID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, userId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }

    public List<UserDTO> getAllUser() throws SQLException, NamingException {
        List<UserDTO> list = new ArrayList<>();
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT userID, userName FROM tbl_User WHERE roleId = 2 AND isActive = 'TRUE'";
                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String name = rs.getString("userName");
                    list.add(new UserDTO(userID, name));
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
