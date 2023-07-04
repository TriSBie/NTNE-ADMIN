package com.admin.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author buidu
 */
public class Chart implements Serializable {

    private Date date;
    private int totalOfWeeks;
    private List<String> perDateOfWeeks;

    public Chart(Date date, int totalOfWeeks) {
        this.date = date;
        this.totalOfWeeks = totalOfWeeks;
    }

    public Chart(int totalOfWeeks, List<String> perDateOfWeeks) {
        this.totalOfWeeks = totalOfWeeks;
        this.perDateOfWeeks = perDateOfWeeks;
    }

    public List<String> getPerDateOfWeeks() {
        return perDateOfWeeks;
    }

    public void setPerDateOfWeeks(List<String> perDateOfWeeks) {
        this.perDateOfWeeks = perDateOfWeeks;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotalOfWeeks() {
        return totalOfWeeks;
    }

    public void setTotalOfWeeks(int totalOfWeeks) {
        this.totalOfWeeks = totalOfWeeks;
    }

}