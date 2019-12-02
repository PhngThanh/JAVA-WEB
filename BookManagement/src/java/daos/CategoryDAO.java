/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoryDTO;
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
public class CategoryDAO implements Serializable {
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
    public List<CategoryDTO> getAllCategory() throws SQLException, NamingException{
        List<CategoryDTO> categoryList = new ArrayList();
        try{
            con = DBUtilities.makeConnection();
            if(con != null)
            {
                String sql = "SELECT categoryId, categoryName FROM tbl_Category";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    String categoryId = rs.getString("categoryId");
                    String categoryName = rs.getString("categoryName");
                    categoryList.add(new CategoryDTO(categoryId, categoryName));
                }
            }
        }finally{
            closeConnection();
        }
        return categoryList;
    }
    public String getCategoryId(String categoryName) throws SQLException, NamingException{
        String result = "";
        try{
            con = DBUtilities.makeConnection();
            if(con != null)
            {
                String sql = "SELECT categoryId FROM tbl_Category WHERE categoryName = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, categoryName);
                rs = ps.executeQuery();
                if(rs.next())
                {
                     result = rs.getString("categoryId");
                }
            }
        }finally{
            closeConnection();
        }
        return result;
    }
}
