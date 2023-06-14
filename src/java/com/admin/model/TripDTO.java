/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author buidu
 */
public class TripDTO implements Serializable {

    private int tripID;
    private boolean availability;
    private double priceAdult;
    private double priceChild;
    private int quantity;
    private Date depart_time;
    private int tourID;
    //Extra attribute
    private String tourName;
    private String thumbnail;

    public TripDTO() {
    }

    public TripDTO(boolean availability, double priceAdult, double priceChild, int quantity, Date depart_time, int tourID) {
        this.availability = availability;
        this.priceAdult = priceAdult;
        this.priceChild = priceChild;
        this.quantity = quantity;
        this.depart_time = depart_time;
        this.tourID = tourID;
    }

    public TripDTO(int tripID, boolean availability, double priceAdult, double priceChild, int quantity, Date depart_time, int tourID) {
        this.tripID = tripID;
        this.availability = availability;
        this.priceAdult = priceAdult;
        this.priceChild = priceChild;
        this.quantity = quantity;
        this.depart_time = depart_time;
        this.tourID = tourID;
    }

    public TripDTO(int tripID, String tourName, String thumbnail, boolean availability, double priceAdult, double priceChild, int quantity, Date depart_time) {
        this.tripID = tripID;
        this.tourName = tourName;
        this.availability = availability;
        this.priceAdult = priceAdult;
        this.priceChild = priceChild;
        this.quantity = quantity;
        this.depart_time = depart_time;
        this.thumbnail = thumbnail;
    }

    public int getTripID() {
        return tripID;
    }

    public void setTripID(int tripID) {
        this.tripID = tripID;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getDepart_time() {
        return depart_time;
    }

    public void setDepart_time(Date depart_time) {
        this.depart_time = depart_time;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

}
