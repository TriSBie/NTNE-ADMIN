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

    public DestinationDTO() {
    }

    public DestinationDTO(int id, String name) {
        this.id = id;
        this.name = name;
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
