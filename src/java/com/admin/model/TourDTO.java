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
public class TourDTO implements Serializable {

    private int tourID;
    private String tourName;
    private double priceAdult;
    private double priceChild;
    private String thumbnail;
    private String location;

    public TourDTO() {
    }

    public TourDTO(String tourName, double priceAdult, double priceChild, String thumbnail, String location) {
        this.tourName = tourName;
        this.priceAdult = priceAdult;
        this.priceChild = priceChild;
        this.thumbnail = thumbnail;
        this.location = location;
    }

    public TourDTO(int tourID, String tourName, double priceAdult, double priceChild, String thumbnail, String location) {
        this.tourID = tourID;
        this.tourName = tourName;
        this.priceAdult = priceAdult;
        this.priceChild = priceChild;
        this.thumbnail = thumbnail;
        this.location = location;
    }

    

    public int getTourID() {
        return tourID;
    }

    public void setTourID(int tourID) {
        this.tourID = tourID;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public double getPriceAdult() {
        return priceAdult;
    }

    public void setPriceAdult(double priceAdult) {
        this.priceAdult = priceAdult;
    }

    public double getPriceChild() {
        return priceChild;
    }

    public void setPriceChild(double priceChild) {
        this.priceChild = priceChild;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
    

}
