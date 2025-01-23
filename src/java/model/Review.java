/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Dinh_Hau
 */
public class Review {

    private int review_id;
    private int product_id;
    private int customer_id;
    private int rating;
    private String comment;
    private Date date;

    public Review() {
    }

    public Review(int review_id, int product_id, int customer_id, int rating, String comment, Date date) {
        this.review_id = review_id;
        this.product_id = product_id;
        this.customer_id = customer_id;
        this.rating = rating;
        this.comment = comment;
        this.date = date;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Review{" + "review_id=" + review_id + ", product_id=" + product_id + ", customer_id=" + customer_id + ", rating=" + rating + ", comment=" + comment + ", date=" + date + '}';
    }
    
    
}
