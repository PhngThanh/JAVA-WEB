/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class DiscountDTO implements Serializable{
    private String discountCode;
    private String userId;
    private boolean isActive;
    private int discountPercent;
    private String createDate;

    public DiscountDTO(String discountCode, String userId, boolean isActive, int discountPercent, String createDate) {
        this.discountCode = discountCode;
        this.userId = userId;
        this.isActive = isActive;
        this.discountPercent = discountPercent;
        this.createDate = createDate;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
}
