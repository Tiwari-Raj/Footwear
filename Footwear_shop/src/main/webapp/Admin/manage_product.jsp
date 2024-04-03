<%@page import="com.entity.ProductDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manage product Page</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-gray-300">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
						<c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>

	<div class="overflow-x-auto">
		<table
			class=" w-full table-auto bg-gray-400 border-collapse border border-gray-400">
			<thead>
				<tr class="text-white">
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">ID</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Image</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Product Name</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Brand Name</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Price</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Category</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Type</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Action</th>
				</tr>
			</thead>
			<tbody>
			<%
			ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
			List<ProductDtls> list=dao.getAllProducts();
			for (ProductDtls b : list ){
			%>
			<tr>
					<td class="px-4 py-2 border border-gray-200"><%=b.getProductId() %></td>
					<td class="px-4 py-2 border border-gray-200"><img src="../../product/<%=b.getPhotoName()%>" style="width:50px; height:50px;"></td>
					<td class="px-4 py-2 border border-gray-300"><%=b.getProductname()%></td>
					<td class="px-4 py-2 border border-gray-300"><%=b.getBrand() %></td>
					<td class="px-4 py-2 border border-gray-300"><%=b.getPrice() %></td>
					<td class="px-4 py-2 border border-gray-200"><%=b.getCategory() %></td>
					<td class="px-4 py-2 border border-gray-300"><%=b.getType() %></td>
					<td class="px-4 py-2 border border-gray-300">
						<a href="edit_product.jsp?id=<%=b.getProductId()%>"><button type="submit"
							class="bg-green-600 text-white text-sm font-semibold py-2 px-4 rounded">Update</button></a>
						<a href="${pageContext.request.contextPath}/delete?id=<%=b.getProductId()%>"><button type="submit"
							class="bg-red-500 text-white text-sm font-semibold py-2 px-4 rounded">Delete</button></a>
					</td>
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