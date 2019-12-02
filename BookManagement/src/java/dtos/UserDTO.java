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
public class UserDTO implements Serializable {

    private String userId;
    private String password;
    private String roleId;
    private String userName;
    private boolean isActive;

    public UserDTO() {
    }

    public UserDTO(String userId, String password, String roleId, String userName, boolean isActive) {
        this.userId = userId;
        this.password = password;
        this.roleId = roleId;
        this.userName = userName;
        this.isActive = isActive;
    }

    public UserDTO(String userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

}
