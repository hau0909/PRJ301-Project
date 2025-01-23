/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBcontext;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Asus
 */
public class AccountDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Account> getAllAcounts() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT [account_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role]\n"
                + "      ,[status]"
                + "  FROM [ShopDB].[dbo].[Account]\n"
                + "  Where role != 'admin'";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role");
                int status = rs.getInt("status");

                Account account = new Account(accountId, username, password, role, status);
                list.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void UpdateAccount(String username, String password, int account_id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE [Account].[account_id] = ? ";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, account_id);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void CreateAccount(String username, String password) {
        Account result = new Account();
        String sql = "INSERT INTO [dbo].[Account] "
                + "([username], [password], [role], [status]) "
                + "VALUES (?, ?, 'user', 1)";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void ChangeStatusAccount(String id, String status) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [status] = ?\n"
                + " WHERE [Account].[account_id] = ? ";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        a.ChangeStatusAccount("7", "0");
    }
}
