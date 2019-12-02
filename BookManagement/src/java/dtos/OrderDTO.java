/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author USER
 */
public class OrderDTO implements Serializable{
    private String userId;
    private float totalPrice;
    private Timestamp date;

    public OrderDTO() {
    }

    public OrderDTO(String userId, float totalPrice, Timestamp date) {
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.date = date;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
}
