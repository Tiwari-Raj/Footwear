package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DAO.UserDAOImpl;
import com.entity.User;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());			
					boolean f = dao.userRegister(us);
					if (f) {
						

						session.setAttribute("succMsg", "Successfully Registered...");
						resp.sendRedirect("register.jsp");

					} else {
						session.setAttribute("failedMsg", "Something Went Wrong!..");
						resp.sendRedirect("register.jsp");

					}
	
			} else {
					
				session.setAttribute("failedMsg", "Please check the Agreement..");
				resp.sendRedirect("register.jsp");

			}
	

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
