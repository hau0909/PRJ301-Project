/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dinh_Hau
 */
public class Product {

    private int product_id;
    private String name;
    private double price;
    private int stock;
    private String image;
    private String size;
    private String gender;
    private String brand;
    private int category_id;
    private int status;
    private String cName;

    public Product() {
    }

    public Product(int product_id, String name, double price, int stock, String image, String size, String gender, String brand, int category_id, int status) {
        this.product_id = product_id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.image = image;
        this.size = size;
        this.gender = gender;
        this.brand = brand;
        this.category_id = category_id;
        this.status = status;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", name=" + name + ", price=" + price + ", stock=" + stock + ", image=" + image + ", size=" + size + ", gender=" + gender + ", brand=" + brand + ", category_id=" + category_id + ", status=" + status + ", cName=" + cName + '}';
    }

   

}
