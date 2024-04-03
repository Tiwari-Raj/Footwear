<%@page import="com.entity.Product_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manage order Page</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-gray-300">
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>

<div class="overflow-x-auto">
  <table class=" w-full table-auto bg-gray-400 border-collapse border border-gray-400">
    <thead>
      <tr class="text-white">
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Order ID</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Name</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Email</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Address</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Phone No</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Product Name</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Brand</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Price</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Payment Type</th>
      </tr>
    </thead>
    <tbody>
    
            <%
				User u = (User) session.getAttribute("userobj");
				ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DBConnect.getConn());
				List<Product_Order> blist = dao.getAllOrder();
				for (Product_Order b : blist) {
				%>
    
      <tr>
        <td class="px-4 py-2 border border-gray-200"><%=b.getOrderId() %></td>
        <td class="px-4 py-2 border border-gray-200"><%=b.getUserName() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getEmail() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getFulladdres() %></td>
        <td class="px-4 py-2 border border-gray-200"><%=b.getPhone() %></td>
        <td class="px-4 py-2 border border-gray-200"><%=b.getProductName() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getBrand() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getPrice() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getPaymentType() %></td>
      </tr>
     <%
				}
     %>
    </tbody>
  </table>
</div>




<%@include file="footer.jsp"%>
</body>
</html>