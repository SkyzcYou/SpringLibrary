package com.book.entity;

/**
 * entity-管理员
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019/07/01 12:05
 */

public class Admin {

    private int adminId;
    private String password;


    public void setPassword(String password) {
        this.password = password;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getPassword() {
        return password;
    }

    public int getAdminId() {
        return adminId;
    }
}
