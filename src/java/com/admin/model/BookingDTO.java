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
    private String cusAddress;
    private String reason;

//    private Date expireDate;
    private String expireDate;
    private boolean status;
    private int account_id;
    private int quantityAdult;
    private int quantityChild;
    private int trip_id;

    //Extra attributes    private int trip_id;
    private TripDTO tripDTO;
    private PaymentDTO paymentDTO;
    private int totalQuantity;

    // Extra attributes <Get List TotalPrice>
    private String tourName;
    private String tourThumbnail;
    private double revenue;

    public BookingDTO() {
    }

    public BookingDTO(int id, double totalPrice, String cusBook, String expireDate, int totalQuantity, boolean status, TripDTO tripDTO) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.cusBook = cusBook;
        this.expireDate = expireDate;
        this.status = status;
        this.totalQuantity = totalQuantity;
        this.tripDTO = tripDTO;
    }

    //get details - without id
    public BookingDTO(double totalPrice, String requirement, String cusBook, String cusMail, String cusPhone, String expireDate, boolean status, PaymentDTO paymentDTO, int account_id, int quantityAdult, int quantityChild, int trip_id) {
        this.totalPrice = totalPrice;
        this.requirement = requirement;
        this.cusBook = cusBook;
        this.cusMail = cusMail;
        this.cusPhone = cusPhone;
        this.expireDate = expireDate;
        this.status = status;
        this.paymentDTO = paymentDTO;
        this.account_id = account_id;
        this.quantityAdult = quantityAdult;
        this.quantityChild = quantityChild;
        this.trip_id = trip_id;
    }

    //get details column values
    public BookingDTO(int id, double totalPrice, String requirement, String cusBook, String cusMail, String cusPhone, String cusAddress, String expireDate, boolean status, int account_id, int quantityAdult, int quantityChild, TripDTO tripDTO, PaymentDTO paymentDTO, String reason) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.requirement = requirement;
        this.cusBook = cusBook;
        this.cusMail = cusMail;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.expireDate = expireDate;
        this.status = status;
        this.account_id = account_id;
        this.quantityAdult = quantityAdult;
        this.quantityChild = quantityChild;
        this.tripDTO = tripDTO;
        this.paymentDTO = paymentDTO;
        this.reason = reason;
    }

    // Get list Totalprice
    public BookingDTO(String tourName, String tourThumbnail, double revenue) {
        this.tourName = tourName;
        this.tourThumbnail = tourThumbnail;
        this.revenue = revenue;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getTourThumbnail() {
        return tourThumbnail;
    }

    public void setTourThumbnail(String tourThumbnail) {
        this.tourThumbnail = tourThumbnail;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
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

    public String getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(String expireDate) {
        this.expireDate = expireDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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

    public TripDTO getTripDTO() {
        return tripDTO;
    }

    public void setTripDTO(TripDTO tripDTO) {
        this.tripDTO = tripDTO;
    }

    public PaymentDTO getPaymentDTO() {
        return paymentDTO;
    }

    public void setPaymentDTO(PaymentDTO paymentDTO) {
        this.paymentDTO = paymentDTO;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "BookingDTO{" + "id=" + id + ", totalPrice=" + totalPrice + ", requirement=" + requirement + ", cusBook=" + cusBook + ", cusMail=" + cusMail + ", cusPhone=" + cusPhone + ", expireDate=" + expireDate + ", status=" + status + ", account_id=" + account_id + ", quantityAdult=" + quantityAdult + ", quantityChild=" + quantityChild + ", trip_id=" + trip_id + ", tripDTO=" + tripDTO + ", paymentDTO=" + paymentDTO + ", totalQuantity=" + totalQuantity + '}';
    }

}
