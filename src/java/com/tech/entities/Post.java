/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.entities;

import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class Post {
    
    private int pId;
    private String pTitle;
    private String PContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;

    public Post() {
    }

    public Post(int pId, String pTitle, String PContent, String pCode, String pPic, Timestamp pDate, int catId,int userId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.PContent = PContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId=userId;
    }

    public Post(String pTitle, String PContent, String pCode, String pPic, Timestamp pDate, int catId,int userId) {
        this.pTitle = pTitle;
        this.PContent = PContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
         this.userId=userId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getPContent() {
        return PContent;
    }

    public void setPContent(String PContent) {
        this.PContent = PContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    
    
}
