/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Hash.MD5;
import context.DBcontext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author Dinh_Hau
 */
public class LoginDAO {
    public Account getAccountByUsername(String username) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE username = ?";

        try ( Connection conn = new DBcontext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int accountId = rs.getInt("account_id");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    int status = rs.getInt("status");
                    int customerId = rs.getInt("customer_id");

                    account = new Account(accountId, username, password, role, status);
                    account.setCustomer_id(customerId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public String getFullName(String username) {
        String fullName = null;
        String sql = "SELECT c.name FROM Customer c JOIN Account a ON c.customer_id = a.customer_id WHERE a.username = ?";

        try ( Connection conn = new DBcontext().getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    fullName = rs.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fullName;
    }

    public int checkLoginAndGetCustomerId(String username, String password) {
        String sql = "SELECT customer_id FROM Account WHERE username = ? AND password = ?";
        try ( Connection conn = new DBcontext().getConnection();  
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, MD5.getMd5(password));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("customer_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if login fails
    }
}
