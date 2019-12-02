/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author USER
 */
public class CreateDiscountCodeError {
    private String userIdError;
    private String discountCodeError;

    public String getUserIdError() {
        return userIdError;
    }

    public void setUserIdError(String userIdError) {
        this.userIdError = userIdError;
    }

    public String getDiscountCodeError() {
        return discountCodeError;
    }

    public void setDiscountCodeError(String discountCodeError) {
        this.discountCodeError = discountCodeError;
    }
    
}
