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
public class CartDTO implements Serializable{
        private String bookId;
        private String title;
        private int quantity;
        private float price;
        private float totalUnitPrice;

    public CartDTO(String bookId, String title, int quantity, float price, float totalUnitPrice) {
        this.bookId = bookId;
        this.title = title;
        this.quantity = quantity;
        this.price = price;
        this.totalUnitPrice = totalUnitPrice;
    }
    public float getTotalUnitPrice() {
        return totalUnitPrice;
    }
    public void setTotalUnitPrice(float totalUnitPrice) {
        this.totalUnitPrice = totalUnitPrice;
    } 
    public CartDTO() {
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
        
        
}
