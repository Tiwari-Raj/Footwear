package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;


@WebServlet("/deleteUser")
public class UserDeleteServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	try {
			int id = Integer.parseInt(req.getParameter("id"));
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteUser(id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "User Deleted...");
				resp.sendRedirect("Admin//manage_user.jsp");
			} else {

				session.setAttribute("failedMsg", "Something went wrong!!!");
				resp.sendRedirect("Admin//manage_user.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
