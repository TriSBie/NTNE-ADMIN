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
public class PaymentDTO implements Serializable{
    private int paymentID;
    private String paymentName;

    public PaymentDTO() {
    }

    
    public PaymentDTO(int paymentID, String paymentName) {
        this.paymentID = paymentID;
        this.paymentName = paymentName;
    }

    public PaymentDTO(String paymentName) {
        this.paymentName = paymentName;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }
    
    
}
