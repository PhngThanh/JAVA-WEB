/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author hieu
 */
public class CreateUpdateBookError {

    private String bookIDIsExisted;
    private String bookTitleLength;
    private String authorLengthErr;
    private String priceFormatErr;
    private String quantityFormatErr;
    private String importDateFormatErr;
    private String desciptionLengthErr;

    public String getBookIDIsExisted() {
        return bookIDIsExisted;
    }

    public void setBookIDIsExisted(String bookIDIsExisted) {
        this.bookIDIsExisted = bookIDIsExisted;
    }

    public String getBookTitleLength() {
        return bookTitleLength;
    }

    public void setBookTitleLength(String bookTitleLength) {
        this.bookTitleLength = bookTitleLength;
    }
    
    public String getAuthorLengthErr() {
        return authorLengthErr;
    }

    public void setAuthorLengthErr(String authorLengthErr) {
        this.authorLengthErr = authorLengthErr;
    }

    public String getPriceFormatErr() {
        return priceFormatErr;
    }

    public void setPriceFormatErr(String priceFormatErr) {
        this.priceFormatErr = priceFormatErr;
    }

    public String getQuantityFormatErr() {
        return quantityFormatErr;
    }

    public void setQuantityFormatErr(String quantityFormatErr) {
        this.quantityFormatErr = quantityFormatErr;
    }

    public String getImportDateFormatErr() {
        return importDateFormatErr;
    }

    public void setImportDateFormatErr(String importDateFormatErr) {
        this.importDateFormatErr = importDateFormatErr;
    }

    public String getDesciptionLengthErr() {
        return desciptionLengthErr;
    }

    public void setDesciptionLengthErr(String desciptionLengthErr) {
        this.desciptionLengthErr = desciptionLengthErr;
    }
    
}
