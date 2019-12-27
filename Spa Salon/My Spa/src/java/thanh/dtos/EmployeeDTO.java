/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanh.dtos;

import java.io.Serializable;

/**
 *
 * @author THANH
 */
public class EmployeeDTO implements Serializable{
    private int id;
    private String name;
    private String phone;
    private String email;
    private String intro;
    private String img;
    private boolean isMaster;
    private String title;

    public EmployeeDTO() {
    }

    public EmployeeDTO(int id, String name, String phone, String email, String intro, String img, boolean isMaster, String title) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.intro = intro;
        this.img = img;
        this.isMaster = isMaster;
        this.title = title;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the intro
     */
    public String getIntro() {
        return intro;
    }

    /**
     * @param intro the intro to set
     */
    public void setIntro(String intro) {
        this.intro = intro;
    }

    /**
     * @return the img
     */
    public String getImg() {
        return img;
    }

    /**
     * @param img the img to set
     */
    public void setImg(String img) {
        this.img = img;
    }

    /**
     * @return the isMaster
     */
    public boolean isIsMaster() {
        return isMaster;
    }

    /**
     * @param isMaster the isMaster to set
     */
    public void setIsMaster(boolean isMaster) {
        this.isMaster = isMaster;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }
    
    
}
