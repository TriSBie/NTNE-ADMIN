/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author buidu
 */
public class BookingDTO implements Serializable {

    private int id;
    private double totalPrice;
    private String requirement;
    private String cusBook;
    private String cusMail;
    private String cusPhone;
    private Date expireDate;
    private boolean status;
    private int payment_id;
    private int account_id;
    private int quantityAdult;
    private int quantityChild;
    private int trip_id;

    public BookingDTO() {
    }

    public BookingDTO(double totalPrice, String requirement, String cusBook, String cusMail, String cusPhone, Date expireDate, boolean status, int payment_id, int account_id, int quantityAdult, int quantityChild, int trip_id) {
        this.totalPrice = totalPrice;
        this.requirement = requirement;
        this.cusBook = cusBook;
        this.cusMail = cusMail;
        this.cusPhone = cusPhone;
        this.expireDate = expireDate;
        this.status = status;
        this.payment_id = payment_id;
        this.account_id = account_id;
        this.quantityAdult = quantityAdult;
        this.quantityChild = quantityChild;
        this.trip_id = trip_id;
    }

    public BookingDTO(int id, double totalPrice, String requirement, String cusBook, String cusMail, String cusPhone, Date expireDate, boolean status, int payment_id, int account_id, int quantityAdult, int quantityChild, int trip_id) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.requirement = requirement;
        this.cusBook = cusBook;
        this.cusMail = cusMail;
        this.cusPhone = cusPhone;
        this.expireDate = expireDate;
        this.status = status;
        this.payment_id = payment_id;
        this.account_id = account_id;
        this.quantityAdult = quantityAdult;
        this.quantityChild = quantityChild;
        this.trip_id = trip_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getCusBook() {
        return cusBook;
    }

    public void setCusBook(String cusBook) {
        this.cusBook = cusBook;
    }

    public String getCusMail() {
        return cusMail;
    }

    public void setCusMail(String cusMail) {
        this.cusMail = cusMail;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getQuantityAdult() {
        return quantityAdult;
    }

    public void setQuantityAdult(int quantityAdult) {
        this.quantityAdult = quantityAdult;
    }

    public int getQuantityChild() {
        return quantityChild;
    }

    public void setQuantityChild(int quantityChild) {
        this.quantityChild = quantityChild;
    }

    public int getTrip_id() {
        return trip_id;
    }

    public void setTrip_id(int trip_id) {
        this.trip_id = trip_id;
    }

}
