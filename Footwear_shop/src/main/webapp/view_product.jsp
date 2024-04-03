<%@page import="com.entity.ProductDtls"%>
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
<title>view product</title>
<%@include file="All_Component/all_css.jsp"%>
</head>
<body class="bg-gray-300">
	<%@include file="All_Component/navbar.jsp"%>


   <%
	int id = Integer.parseInt(request.getParameter("pid"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
	ProductDtls b = dao.getProductById(id);
	%>


	<div
		class="min-w-screen min-h-screen bg-grey-700 flex items-center justify-center px-5 py-5">
		<div
			class="bg-gray-100 text-gray-500 rounded-3xl shadow-xl w-full overflow-hidden"
			style="max-width: 1000px">
			<div class="md:flex w-full">
				<div class="hidden md:block w-1/2 bg-white-500 py-10 px-10 ml-16">
					<img src="product/<%=b.getPhotoName() %>" alt="hello" style="height: 280px; width: 300px;">
				</div>
				<div class="w-full md:w-1/2 py-10 px-5 md:px-10">
					<div class="text-center mb-2">
						<h3 class="font-bold text-3xl text-gray-900">Product Details</h3>
					</div>
					
					
	
					
						<div class="text-center text-xl">
						<h4>Brand : &nbsp;&nbsp;&nbsp;<span><%=b.getBrand() %></span></h4>
						<h4>Name : &nbsp;&nbsp;<span><%=b.getProductname() %></span></h4>
						<h4>Type : &nbsp;&nbsp;<span><%=b.getType() %></span></h4>
						
						</div>
						
						<c:if test="${not empty userobj }">
						<div class="mt-32">
						<a href="checkout.jsp">
						<button type="submit" class="bg-green-500 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded">
                                    Buy Now
                                </button></a>
						
						</div>
						</c:if>
						<c:if test="${ empty userobj }">
						<div class="mt-32">
						
						
						</div>
						</c:if>
				
						
					
				</div>
			</div>
		</div>
	</div>


	<%@include file="All_Component/footer.jsp"%>
</body>
</html>