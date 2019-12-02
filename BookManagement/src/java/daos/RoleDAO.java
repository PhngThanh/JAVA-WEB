/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RoleDTO;
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
public class RoleDAO implements Serializable {
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

    public List<RoleDTO> getRoleList() throws SQLException, NamingException{
        List<RoleDTO> roleList = new ArrayList();
        try{
            con = DBUtilities.makeConnection();
            if(con != null)
            {
                String sql = "SELECT RoleID, RoleName FROM tbl_Role";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    String roleName = rs.getString("RoleName");
                    String roleId = rs.getString("RoleID");
                    roleList.add(new RoleDTO(roleId, roleName));
                }
            }
        }finally{
            closeConnection();
        }return roleList;
    }
}
