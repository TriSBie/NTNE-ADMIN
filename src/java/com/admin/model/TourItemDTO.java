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
public class TourItemDTO implements Serializable {

    private int tourItemID;
    private int tourID;
    private int destinationID;
    private String duration;
    private String description;
    //Extra attribute
    private String tourThumbnail;
    private String destinationName;
    private String tourName;

    public TourItemDTO() {
    }

    public TourItemDTO(int tourID, int destinationID, String duration, String description) {
        this.tourID = tourID;
        this.destinationID = destinationID;
        this.duration = duration;
        this.description = description;
    }

    //main constructor
    public TourItemDTO(int tourItemID, int tourID, int destinationID, String duration, String description) {
        this.tourItemID = tourItemID;
        this.tourID = tourID;
        this.destinationID = destinationID;
        this.duration = duration;
        this.description = description;
    }

    public TourItemDTO(int tourItemID, String tourName, String tourThumbnail, String destinationName, String duration, String description) {
        this.tourItemID = tourItemID;
        this.tourName = tourName;
        this.tourThumbnail = tourThumbnail;
        this.destinationName = destinationName;
        this.duration = duration;
        this.description = description;
    }

    public int getTourItemID() {
        return tourItemID;
    }

    public void setTourItemID(int tourItemID) {
        this.tourItemID = tourItemID;
    }

    public int getTourID() {
        return tourID;
    }

    public void setTourID(int tourID) {
        this.tourID = tourID;
    }

    public int getDestinationID() {
        return destinationID;
    }

    public void setDestinationID(int destinationID) {
        this.destinationID = destinationID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getTourThumbnail() {
        return tourThumbnail;
    }

    public void setTourThumbnail(String tourThumbnail) {
        this.tourThumbnail = tourThumbnail;
    }

    public String getDestinationName() {
        return destinationName;
    }

    public void setDestinationName(String destinationName) {
        this.destinationName = destinationName;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

}
