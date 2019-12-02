/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.BookDTO;
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
public class BookDAO implements Serializable {

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

    public List<BookDTO> getBookList(String searchValue) throws NamingException, SQLException {
        List<BookDTO> booklist = new ArrayList();
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT bookID, bookTitle, image, categoryID, author, price, importDate, isActive, description, quantity FROM tbl_Book where isActive = 'TRUE' AND quantity > 0 AND bookTitle like ? ";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + searchValue + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String bookId = rs.getString("bookID");
                    String bootitle = rs.getString("bookTitle");
                    String image = rs.getString("image");
                    String categoryId = rs.getString("categoryID");
                    String author = rs.getString("author");
                    float price = rs.getFloat("price");
                    String date = rs.getString("importDate");
                    boolean isActive = rs.getBoolean("isActive");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    booklist.add(new BookDTO(bookId, bootitle, image, categoryId, author, price, date, isActive, description, quantity));
                }
            }
        } finally {
            closeConnection();
        }
        return booklist;
    }

    public List<BookDTO> getBookListByPrice(float min, float max) throws NamingException, SQLException {
        List<BookDTO> booklist = new ArrayList();
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT bookID, bookTitle, image, categoryID, author, price, importDate, isActive, description, quantity FROM tbl_Book where isActive = 'TRUE' AND quantity > 0 AND price between ? AND ?";
                ps = con.prepareStatement(sql);
                ps.setFloat(1, min);
                ps.setFloat(2, max);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String bookId = rs.getString("bookID");
                    String bootitle = rs.getString("bookTitle");
                    String image = rs.getString("image");
                    String categoryId = rs.getString("categoryID");
                    String author = rs.getString("author");
                    float price = rs.getFloat("price");
                    String date = rs.getString("importDate");
                    boolean isActive = rs.getBoolean("isActive");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    booklist.add(new BookDTO(bookId, bootitle, image, categoryId, author, price, date, isActive, description, quantity));

                }
            }
        } finally {
            closeConnection();
        }
        return booklist;
    }

    public List<BookDTO> getBookListByCategoryId(String categoryId) throws NamingException, SQLException {
        List<BookDTO> booklist = new ArrayList();
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT bookID, bookTitle, image, categoryID, author, price, importDate, isActive, description, quantity FROM tbl_Book where isActive = 'TRUE' AND quantity > 0 AND categoryId = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, categoryId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String bookId = rs.getString("bookID");
                    String bootitle = rs.getString("bookTitle");
                    String image = rs.getString("image");
                    String author = rs.getString("author");
                    float price = rs.getFloat("price");
                    String date = rs.getString("importDate");
                    boolean isActive = rs.getBoolean("isActive");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    booklist.add(new BookDTO(bookId, bootitle, image, categoryId, author, price, date, isActive, description, quantity));
                }
            }
        } finally {
            closeConnection();
        }
        return booklist;
    }

    public void deleteBook(String bookId) throws NamingException, SQLException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "UPDATE tbl_Book SET isActive = 'FALSE' WHERE bookId = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, bookId);
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }

    public void updateBook(BookDTO b) throws NamingException, SQLException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "UPDATE tbl_Book SET bookTitle = ?, image = ?, categoryID = ?, author = ?,"
                        + " price = ?, importDate = ?, description = ?, quantity = ?  WHERE bookId = ?";
                ps = con.prepareStatement(sql);

                ps.setString(1, b.getBookTitle());
                ps.setString(2, b.getImage());
                ps.setString(3, b.getCategoryId());
                ps.setString(4, b.getAuthor());
                ps.setFloat(5, b.getPrice());
                ps.setString(6, b.getImportDate());

                ps.setString(7, b.getDescription());
                ps.setInt(8, b.getQuantity());
                ps.setString(9, b.getBookId());
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }

    }

    public void insertNewBook(BookDTO b) throws NamingException, SQLException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tbl_Book VALUES (?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, b.getBookId());
                ps.setString(2, b.getBookTitle());
                ps.setString(3, b.getImage());
                ps.setString(4, b.getCategoryId());
                ps.setString(5, b.getAuthor());
                ps.setFloat(6, b.getPrice());
                ps.setString(7, b.getImportDate());
                ps.setBoolean(8, b.isIsActive());
                ps.setString(9, b.getDescription());
                ps.setInt(10, b.getQuantity());

                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }

    }

    public boolean checkBookID(String bookID) throws SQLException, NamingException {
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "Select bookID From tbl_Book Where bookID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, bookID);
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
    
    public int getQuantity(String bookID) throws SQLException, NamingException {
        int quantity = 0;
        try {
            con = DBUtilities.makeConnection();
            if (con != null) {
                String sql = "SELECT Quantity From tbl_Book WHERE bookID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, bookID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("Quantity") ;
                }
            }
        } finally {
            closeConnection();
        }
        return quantity;
    }
    
}
