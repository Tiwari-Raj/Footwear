<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
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
<title>Search Page</title>
<%@include file="All_Component/all_css.jsp"%>
</head>
<body>
<%@include file="All_Component/navbar.jsp" %>

<%
	User u = (User) session.getAttribute("userobj");
	%>


<div class="flex">
  
    
    
  
    <div class="flex-1">
        <div class="container mx-auto mt-10">
            <div class="p-3 rounded-lg">
                <div class="grid grid-cols-5 gap-4">
                    <%
				String ch=request.getParameter("ch");
				ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
				List<ProductDtls> list = dao.getProductBySearch(ch);
				for (ProductDtls b : list) {
				%>
                    <div class="max-w-sm mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative" style="height: fit-content;">
                        <img class="w-full" src="product/<%=b.getPhotoName()%>" style="width: 370px; height: 200px;">
                        <c:if test="${not empty userobj}">
                        <a class="absolute top-0 right-0 mt-2 mr-2 text-red-600 bg-white rounded-full p-2" href="${pageContext.request.contextPath}/cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId() %>">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                        </c:if>
                        <div class="mt-2 ml-3">
                            <p class="font-bold text-xl"><%=b.getBrand() %></p>
                            <p class="text-gray-700  text-xs"><%=b.getProductname() %></p>
                            <p class="text-gray-700 font-semibold text-base text-sm mt-2">Rs. <%=b.getPrice()%></p>
                        </div>
                        <c:if test="${not empty userobj}">
                <div class="px-6 pt-2 pb-2">
                    <a href="${pageContext.request.contextPath}/cart?pid=<%=b.getProductId()%>&&uid=<%=u.getId() %>" class="block bg-blue-500 text-white text-center py-1 rounded">Add to Cart</a>
                </div>
                </c:if>
                <c:if test="${ empty userobj}">
                <div class="px-6 pt-2 pb-2">
                    <a href="view_product.jsp?pid=<%=b.getProductId() %>" class="block bg-blue-500 text-white text-center py-1 rounded">View </a>
                </div>
                </c:if>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>





<div class="mt-auto">
<%@include file="All_Component/footer.jsp" %>
</div>

</body>
</html>