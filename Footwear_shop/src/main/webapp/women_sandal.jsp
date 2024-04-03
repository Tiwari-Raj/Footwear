<%@page import="com.entity.User"%>
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
<title>Women sandal Page</title>
<%@include file="All_Component/all_css.jsp"%>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>
<%@include file="All_Component/navbar.jsp" %>

<img src="All_Component/image/women.png" style="width:100%; height:250px;">

<div class="flex">
  
    <div class="border p-4 w-40 relative h-full">
     
        <div class="flex justify-between items-center cursor-pointer" onclick="toggleDropdown1('categoryDropdown')">
            <h2 class="text-lg font-bold mb-2">Category</h2>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500 transform transition-transform duration-300" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M10 12a1 1 0 0 1-.707-.293l-4-4a1 1 0 0 1 1.414-1.414L10 9.586l3.293-3.293a1 1 0 0 1 1.414 1.414l-4 4A1 1 0 0 1 10 12z" clip-rule="evenodd" />
            </svg>
        </div>
        <div id="categoryDropdown" class="divide-y divide-gray-200 hidden text-center">
            <a href="women_running.jsp" style="text-decoration:none; color:black;" class="py-2 text-black">Running</a>
            <hr class="my-2">
            <a href="women_sport.jsp" style="text-decoration:none; color:black;" class="py-2">Sports</a>
            <hr class="my-2">
            <a href="women_casual.jsp" style="text-decoration:none; color:black;" class="py-2">Casual</a>
            <hr class="my-2">
            <a href="women_sandal.jsp" style="text-decoration:none; color:black;" class="py-2">Sandal</a>
            <hr class="my-2">
            <a href="women_slipper.jsp" style="text-decoration:none; color:black;" class="py-2">Slipper</a>
            <hr class="my-2">
        </div>

       
        <div class="flex justify-between items-center cursor-pointer mt-4" onclick="toggleDropdown1('brandDropdown')">
            <h2 class="text-lg font-bold mb-2">Brand</h2>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500 transform transition-transform duration-300" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M10 12a1 1 0 0 1-.707-.293l-4-4a1 1 0 0 1 1.414-1.414L10 9.586l3.293-3.293a1 1 0 0 1 1.414 1.414l-4 4A1 1 0 0 1 10 12z" clip-rule="evenodd" />
            </svg>
        </div>
        <div id="brandDropdown" class="divide-y divide-gray-200 hidden text-center">
            <a href="women_puma.jsp" style="text-decoration:none; color:black;" class="py-2">Puma</a>
            <hr class="my-2">
            <a href="women_campus.jsp" style="text-decoration:none; color:black;" class="py-2">Campus</a>
            <hr class="my-2">
            
        </div>
    </div>
    
  
    <div class="flex-1">
        <div class="container mx-auto mt-10">
            <div class="p-3 rounded-lg">
                <div class="grid grid-cols-5 gap-4">
                    <% 
                    ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
                    List<ProductDtls> list = dao.getwomensandal();
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



<script>
    function toggleDropdown1(id) {
        const dropdown = document.getElementById(id);
        dropdown.classList.toggle('hidden');
    }
</script>


<div class="mt-auto">
<%@include file="All_Component/footer.jsp" %>
</div>

</body>
</html>