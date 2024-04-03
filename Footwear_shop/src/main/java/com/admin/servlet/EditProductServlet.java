package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.entity.ProductDtls;
import com.DAO.ProductDAOImpl;

@WebServlet("/editproducts")
public class EditProductServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String productName = req.getParameter("productname");
			String brand = req.getParameter("brand");
			String price = req.getParameter("price");
			String category = req.getParameter("category");
			String type = req.getParameter("type");
			
			ProductDtls b=new ProductDtls();
			b.setProductId(id);
			b.setProductname(productName);
			b.setBrand(brand);
			b.setPrice(price);
			b.setCategory(category);
			b.setType(type);
			
			
			ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditProducts(b);
			HttpSession session=req.getSession();
			
			
			if(f){
				
				session.setAttribute("succMsg", "Product Updated...");
				resp.sendRedirect("Admin//manage_product.jsp");
			}else {
				
				session.setAttribute("failedMsg", "Something went wrong!!!");
				resp.sendRedirect("Admin//manage_product.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
