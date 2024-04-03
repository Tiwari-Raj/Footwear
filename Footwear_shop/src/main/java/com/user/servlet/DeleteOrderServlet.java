package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductOrderDAOImpl;
import com.DB.DBConnect;



@WebServlet("/OrderDelete")
public class DeleteOrderServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String order_id = req.getParameter("order_id");
			ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteOrder(order_id);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Order Cancelled...");
				resp.sendRedirect("setting.jsp");
			} else {
				session.setAttribute("failedMsg", "Order Cancelled...");
				resp.sendRedirect("setting.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
