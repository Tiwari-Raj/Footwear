package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.DAO.ProductDAOImpl;
import com.entity.ProductDtls;

@WebServlet("/add_products")
@MultipartConfig
public class ProductsAdd extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String productName = req.getParameter("productname");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String category = req.getParameter("category");
			String type = req.getParameter("type");
			Part part = req.getPart("pimg");
			String fileName = part.getSubmittedFileName();
			
			ProductDtls p=new ProductDtls(productName,brand,price,category,type,fileName);
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());

			boolean f = dao.addProducts(p);
			HttpSession session = req.getSession();
			
			
			
			
			
		if (f){
	        
	        	String path =getServletContext().getRealPath("")+"product";
				   
			    java.io.File file=new java.io.File(path);
			    
			    part.write(path+java.io.File.separator+fileName);
			
				
				session.setAttribute("succMsg", "Product Added Successfully");
				resp.sendRedirect("Admin/Add_product.jsp");
			} else {
				session.setAttribute("failedMsg", "Failed To Add Product");
				resp.sendRedirect("Admin/Add_product.jsp");
			}

			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}

}
