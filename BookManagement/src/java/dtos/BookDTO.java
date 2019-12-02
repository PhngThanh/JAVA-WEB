/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author hieu
 */
public class BookDTO implements Serializable {
    private String bookId;
    private String bookTitle;
    private String image;
    private String categoryId;
    private String author;
    private float price;
    private String importDate;
    private boolean isActive;
    private String description;
    private int quantity;

    public BookDTO() {
    }

    public BookDTO(String bookId, String bookTitle, String image, String categoryId, String author, float price, String importDate, boolean isActive, String description, int quantity) {
        this.bookId = bookId;
        this.bookTitle = bookTitle;
        this.image = image;
        this.categoryId = categoryId;
        this.author = author;
        this.price = price;
        this.importDate = importDate;
        this.isActive = isActive;
        this.description = description;
        this.quantity = quantity;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
