package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductOrderDAOImpl;
import com.DB.DBConnect;

import com.entity.Cart;
import com.entity.Product_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
try {
			
			HttpSession session=req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			List<Cart> blist = dao.getProductByUser(id);

			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Please Add Product ");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				
				ProductOrderDAOImpl dao2 = new ProductOrderDAOImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				Product_Order o = new Product_Order();
				ArrayList<Product_Order> orderList = new ArrayList<Product_Order>();

				for (Cart c : blist) {

					o.setOrderId("ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFulladdres(fullAdd);
					o.setProductName(c.getProductName());
					o.setBrand(c.getBrand());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
				}

				if ("noselect".equals(paymentType)) {
					
					session.setAttribute("failedMsg", "Please Choose Payment Method ");
					resp.sendRedirect("checkout.jsp");
				}
				
				else {

					Boolean f = dao2.saveOrder(orderList);
					if(f) {
					  if("CARD PAYMENT".equals(paymentType)) {
						  req.getRequestDispatcher("/emailsending").forward(req, resp);
						}
					  else if("COD".equals(paymentType)){
						req.getRequestDispatcher("/emailsending").forward(req, resp);
					  }
					}else {
						session.setAttribute("failedMsg", "Something went wrong ");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
}
