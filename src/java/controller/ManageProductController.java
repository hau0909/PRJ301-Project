/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ManagerDAO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import java.nio.file.Paths;

/**
 *
 * @author Asus
 */
@WebServlet(name = "ManagerProductController", urlPatterns = {"/ManageProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ManageProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageProductController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProductDAO pd = new ProductDAO();
        
        List<Product> products = pd.getAllProducts();
        List<Category> cates = pd.getAllCategory();
        List<Product> brands = pd.getAllBrand();

        request.setAttribute("brands", brands);
        request.setAttribute("products", products);
        request.setAttribute("cates", cates);
        request.getRequestDispatcher("ProductManager.jsp").forward(request, response);
    }

    private static final String UPLOAD_DIR = "image";
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDAO mDAO = new ManagerDAO();
        ProductDAO pDAO = new ProductDAO();
        
        String id = request.getParameter("product_id");
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String stockStr = request.getParameter("stock");
        String size = request.getParameter("size");
        String gender = request.getParameter("gender");
        String brand = request.getParameter("brand");
        String categoryIdStr = request.getParameter("category");
        Part imagePart = request.getPart("image");
        String action = request.getParameter("action");
        String status = request.getParameter("status");
        
        String img = null;
         if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            System.out.println("upload:" + uploadPath);
            File uploadDirFile = new File(uploadPath);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }

            String filePath = Paths.get(uploadPath, fileName).toString();
            try {
                imagePart.write(filePath);
                img = UPLOAD_DIR + "/" + fileName;
            } catch (IOException e) {
                e.printStackTrace();
                throw new ServletException("File upload failed!", e);
            }
        } else {
            img = mDAO.getProductById(Integer.parseInt(id)).getImage();
        }
         
        double price;
        int stock ;
        int categoryId = -1;
        
        
        if(action.equalsIgnoreCase("add")){
            price = Double.parseDouble(priceStr);
            stock = Integer.parseInt(stockStr);
            categoryId = Integer.parseInt(categoryIdStr);
            
            Product newProduct = new Product( 0, name, price, stock, img, size, gender, brand, categoryId, stock);
            mDAO.CreateProduct(newProduct);
        }else if(action.equalsIgnoreCase("edit")){
            price = Double.parseDouble(priceStr);
            stock = Integer.parseInt(stockStr);
                    
            Product updateProduct = new Product(Integer.parseInt(id), name, price, stock, img, size, gender, brand, categoryId, stock);
            mDAO.UpdateProduct(updateProduct);
        }else if(action.equalsIgnoreCase("delete")){
            if(status.equalsIgnoreCase("1")){
               mDAO.ChangeProductStatus(Integer.parseInt(id), "0");
            }
            else if(status.equalsIgnoreCase("0"))
            {
               mDAO.ChangeProductStatus(Integer.parseInt(id), "1");
            }
        }
         
        
        List<Product> products = pDAO.getAllProducts();
        List<Category> cates = pDAO.getAllCategory();
        List<Product> brands = pDAO.getAllBrand();

        request.setAttribute("brands", brands);
        request.setAttribute("products", products);
        request.setAttribute("cates", cates);
        request.getRequestDispatcher("ProductManager.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
