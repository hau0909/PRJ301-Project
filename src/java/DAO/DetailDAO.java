/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBcontext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Review;

/**
 *
 * @author Dinh_Hau
 */
public class DetailDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Product getProductById(String productId) {

        String sql = "SELECT p.*, c.name\n"
                + "FROM Product p\n"
                + "Join Category c \n"
                + "on p.category_id = c.category_id\n"
                + "where p.product_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);  // Set the parameter for gender
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getByte(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
                p.setcName(rs.getString(11));
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Review> getReviewByProductId(String productId) {
        List<Review> list = new ArrayList<>();
        String sql = "select * from Review\n"
                + "where product_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);  // Set the parameter for gender
            rs = ps.executeQuery();
            while (rs.next()) {
                Review r = new Review(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getDate(6));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addReview(String productId, String customerId, String rating, String comment, String date) {
        String sql = "INSERT INTO Review (product_id, customer_id, rating, comment, date) VALUES \n"
                + "(?, ?, ?, ?, ?)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productId);
            ps.setString(2, customerId);
            ps.setString(3, rating);
            ps.setString(4, comment);
            ps.setString(5, date);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DetailDAO dao = new DetailDAO();
       dao.addReview("5", "1", "5", "Quần Đẹp Quá !!!", "2024-11-3");
       

    }
}
