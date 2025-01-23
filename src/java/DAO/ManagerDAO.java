/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBcontext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Product;

/**
 *
 * @author Dinh_Hau
 */
public class ManagerDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAll() {
        String sql = "SELECT [order_id]\n"
                + "      ,[customer_id]\n"
                + "      ,[total_price]\n"
                + "      ,[status]\n"
                + "      ,[order_date]\n"
                + "      ,[payment_method]\n"
                + "  FROM [dbo].[Order]";
        List<Order> orders = new ArrayList<>();

        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                int customerId = rs.getInt("customer_id");
                double totalPrice = rs.getDouble("total_price");
                String status = rs.getString("status");
                java.util.Date orderDate = new java.util.Date(rs.getTimestamp("order_date").getTime()); // Convert to java.util.Date
                String paymentMethod = rs.getString("payment_method");

                Order order = new Order(orderId, customerId, totalPrice, status, orderDate, paymentMethod);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public int TotalBuyer() {
        int total = 0;
        String sql = "SELECT COUNT(DISTINCT([customer_id]))  as totalCustomer\n"
                + "FROM [ShopDB].[dbo].[Order]";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("totalCustomer");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
    
      public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT [product_id], [name], [price], [stock], [image], [size], [gender], [brand], [category_id], [status] " +
                     "FROM [dbo].[Product] WHERE [product_id] = ?";

        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                String image = rs.getString("image");
                String size = rs.getString("size");
                String gender = rs.getString("gender");
                String brand = rs.getString("brand");
                int categoryId = rs.getInt("category_id");
                int status = rs.getInt("status");

                product = new Product(productId, name, price, stock, image, size, gender, brand, categoryId, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    
    public void CreateProduct(Product p  ){
        String sql = "INSERT INTO [dbo].[Product]\n" +
                    "           ([name]\n" +
                    "           ,[price]\n" +
                    "           ,[stock]\n" +
                    "           ,[image]\n" +
                    "           ,[size]\n" +
                    "           ,[gender]\n" +
                    "           ,[brand]\n" +
                    "           ,[category_id]\n" +
                    "           ,[status])\n" +
                    "     VALUES\n" +
                    "           (?,?,?,?,?,?,?,?,1)";
        
         try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
           
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getSize());
            ps.setString(6, p.getGender());
            ps.setString(7, p.getBrand());
            ps.setInt(8, p.getCategory_id());
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void UpdateProduct(Product p ){
        String sql = "UPDATE [dbo].[Product]\n" +
                "   SET [name] = ?\n" +
                "      ,[price] = ?\n" +
                "      ,[stock] = ?\n" +
                "      ,[image] = ?\n" +
                " WHERE [product_id] = ?";
         try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
           
            ps.setString(1, p.getName());         
            ps.setDouble(2, p.getPrice());         
            ps.setInt(3, p.getStock());             
            ps.setString(4, p.getImage());        
            ps.setInt(5, p.getProduct_id());    
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }   
    
    public void ChangeProductStatus(int id, String status){
        String sql = "UPDATE [dbo].[Product]\n" +
                "   SET [status] = ?\n" +
                " WHERE [product_id] = ?";
         try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
           
            ps.setString(1, status);         
            ps.setInt(2, id);         
         
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

}
