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
public class DestinationDTO implements Serializable {

    private int id;
    private String name;
    private String description;
    private String lat;
    private String lon;

    public DestinationDTO() {
    }

    public DestinationDTO(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public DestinationDTO(int id, String name, String description, String lat, String lon) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.lat = lat;
        this.lon = lon;
    }

    public DestinationDTO(String name, String description, String lat, String lon) {
        this.name = name;
        this.description = description;
        this.lat = lat;
        this.lon = lon;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public DestinationDTO(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
