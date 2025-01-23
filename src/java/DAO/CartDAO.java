/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBcontext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author Dinh_Hau
 */
public class CartDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Cart> getProductCartByCustomerId(String customerId) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT p.*, c.quantity\n"
                + "FROM \n"
                + "    Cart c\n"
                + "JOIN \n"
                + "    Product p ON c.product_id = p.product_id\n"
                + "WHERE \n"
                + "    c.customer_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Khởi tạo đối tượng Cart
                Cart cart = new Cart();
                cart.setQuantity(rs.getInt("quantity"));

                // Khởi tạo đối tượng Product và thiết lập các thuộc tính
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getLong("price"));
                product.setImage(rs.getString("image"));
                product.setBrand(rs.getString("brand"));
                product.setStatus(rs.getInt("status"));
                product.setStock(rs.getInt("stock"));
                // Thiết lập Product cho Cart
                cart.setProduct(product);

                list.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addProductIntoCart(String customerID, String productID, String quantity) {
    String checkDuplicateSQL = "SELECT quantity FROM Cart WHERE customer_id = ? AND product_id = ?";
    String updateSQL = "UPDATE Cart SET quantity = quantity + ? WHERE customer_id = ? AND product_id = ?";
    String insertSQL = "INSERT INTO Cart (customer_id, product_id, quantity) VALUES (?, ?, ?)";

    try {
        conn = new DBcontext().getConnection();
        
        // Check if the product already exists in the cart
        ps = conn.prepareStatement(checkDuplicateSQL);
        ps.setString(1, customerID);
        ps.setString(2, productID);
        rs = ps.executeQuery();

        if (rs.next()) {
            // If the product exists, update the quantity
            int existingQuantity = rs.getInt("quantity");
            ps = conn.prepareStatement(updateSQL);
            ps.setInt(1, Integer.parseInt(quantity));
            ps.setString(2, customerID);
            ps.setString(3, productID);
        } else {
            // If the product does not exist, insert a new row
            ps = conn.prepareStatement(insertSQL);
            ps.setString(1, customerID);
            ps.setString(2, productID);
            ps.setString(3, quantity);
        }

        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } 
}


    public void removeProductFromCart(String customerID, String productID) {
        String sql = "DELETE FROM Cart WHERE customer_id = ? AND product_id = ?";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);
            ps.setString(2, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        dao.addProductIntoCart("2", "2", "7");
        List<Cart> list = dao.getProductCartByCustomerId("2");
        for (Cart cart : list) {
            System.out.println(cart);
        }
    }
}
