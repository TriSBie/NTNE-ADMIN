/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.model;

import java.io.Serializable;

/**
 *
 * @author buidu
 */
public class ImageDTO implements Serializable {

    private int imgID;
    private String imgName;
    private String imgURL;
    private int tourID;

    public ImageDTO(String imgName, String imgURL, int tourID) {
        this.imgName = imgName;
        this.imgURL = imgURL;
        this.tourID = tourID;
    }

    public ImageDTO(int imgID, String imgName, String imgURL, int tourID) {
        this.imgID = imgID;
        this.imgName = imgName;
        this.imgURL = imgURL;
        this.tourID = tourID;
    }

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public int getTourID() {
        return tourID;
    }

    public void setTourID(int tourID) {
        this.tourID = tourID;
    }

}
