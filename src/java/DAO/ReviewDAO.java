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
import java.sql.Date;
import java.util.List;
import model.Account;
import model.Review;

/**
 *
 * @author Asus
 */
public class ReviewDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    
      public List<Review> getAll(){
        List<Review> list = new ArrayList<>();
        String sql = "SELECT [review_id]\n" +
                    "      ,[product_id]\n" +
                    "      ,[customer_id]\n" +
                    "      ,[rating]\n" +
                    "      ,[comment]\n" +
                    "      ,[date]\n" +
                    "  FROM [ShopDB].[dbo].[Review]";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int review_id = rs.getInt("review_id");
                int product_id = rs.getInt("product_id");
                int customer_id = rs.getInt("customer_id");
                int rating = rs.getInt("rating");
                String comment = rs.getString("comment");
                Date date = rs.getDate("date");
                
                Review review = new Review(review_id, product_id, customer_id, rating, comment, date);
                list.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
