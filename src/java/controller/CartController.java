package controller;

import DAO.CartDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customer_id");

        if (customerId == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("Login.jsp");
            return;
        }
    
        String action = request.getParameter("source");
        CartDAO cartDAO = new CartDAO();


        try {
            if ("removeProduct".equals(action)) {
                String productID = request.getParameter("productID");
                cartDAO.removeProductFromCart(String.valueOf(customerId), productID);
            } else if ("addToCart".equals(action)) {
                String productID = request.getParameter("productID");
                String quantity = request.getParameter("quantity");
                cartDAO.addProductIntoCart(String.valueOf(customerId), productID, quantity);
            }

            // Load lại danh sách sản phẩm trong giỏ hàng sau mỗi thao tác
            List<Cart> cartItems = cartDAO.getProductCartByCustomerId(String.valueOf(customerId));
            request.setAttribute("listCart", cartItems);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã có lỗi xảy ra, vui lòng thử lại!");
        } finally {
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "CartController handles cart actions.";
    }
}
