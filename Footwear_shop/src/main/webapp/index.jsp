
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footwear index Page</title>

<%@include file="All_Component/all_css.jsp" %>

 
</head>
<body style="background-color: #fcfcfc;">
<%@include file="All_Component/navbar.jsp" %>

<%
	User u = (User) session.getAttribute("userobj");
	%>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-screen h-300 object-cover" src="All_Component/image/login2.png" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-screen h-300 object-cover" src="All_Component/image/login4.png" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-screen h-300 object-cover" src="All_Component/image/login3.png" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


	
<div class="card row" style="width: calc(99% - 6px); height: 300px; margin: 10px; padding: 0 3px; background: linear-gradient(to right, #6b6a6a, #706e6e); box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">

 <div class="card w-48 relative rounded-lg shadow-xl" style="margin-left: 40px; margin-top: 40px; transition: transform 0.3s;">
    <div class="absolute top-0 left-0 right-0 transform bg-red-500 text-white font-bold py-1 px-2" style="clip-path: polygon(0% 0%, 100% 0%, 75% 50%, 100% 100%, 0% 100%); box-shadow: 0 3px 6px rgba(0, 0, 0, 0.4); transition: inherit; z-index: 1;">
      SALE
    </div>
    <img src="All_Component/image/KS1.jpg" class="card-img-top rounded-lg" alt="..." style="transition: inherit;" onmouseover="this.style.transform='scale(1.05)'; this.parentElement.querySelector('.transform').style.transform = 'scale(1.05)'" onmouseout="this.style.transform='scale(1)'; this.parentElement.querySelector('.transform').style.transform = 'scale(1)'">
</div>

 <div class="card w-48 relative rounded-lg shadow-xl" style="margin-left: -400px; margin-top: 60px; transition: transform 0.3s;">
    <div class="absolute top-0 left-0 right-0 transform bg-red-500 text-white font-bold py-1 px-2" style="clip-path: polygon(0% 0%, 100% 0%, 75% 50%, 100% 100%, 0% 100%); box-shadow: 0 3px 6px rgba(0, 0, 0, 0.4); transition: inherit; z-index: 1;">
      SALE
    </div>
    <img src="All_Component/image/WS2.jpg" class="card-img-top rounded-lg" alt="..." style="transition: inherit;" onmouseover="this.style.transform='scale(1.05)'; this.parentElement.querySelector('.transform').style.transform = 'scale(1.05)'" onmouseout="this.style.transform='scale(1)'; this.parentElement.querySelector('.transform').style.transform = 'scale(1)'">
</div>
 <div class="card w-48 relative rounded-lg shadow-xl" style="margin-left: -600px; margin-top: 40px; transition: transform 0.3s;">
    <div class="absolute top-0 left-0 right-0 transform bg-red-500 text-white font-bold py-1 px-2" style="clip-path: polygon(0% 0%, 100% 0%, 75% 50%, 100% 100%, 0% 100%); box-shadow: 0 3px 6px rgba(0, 0, 0, 0.4); transition: inherit; z-index: 1;">
      SALE
    </div>
    <img src="All_Component/image/WS1.jpg" class="card-img-top rounded-lg" alt="..." style=" transition: inherit;" onmouseover="this.style.transform='scale(1.05)'; this.parentElement.querySelector('.transform').style.transform = 'scale(1.05)'" onmouseout="this.style.transform='scale(1)'; this.parentElement.querySelector('.transform').style.transform = 'scale(1)'">
</div>

    <div class= "absolute top-16 right-32">
      <div class="col">
        <img src="All_Component/image/sale2.png" class="w-full" alt="Card Image" style="height:100px;width:300px;">
        <img src="All_Component/image/shopNow.png" class="w-full" alt="Card Image" style=" margin-left:40px;height:50px;width:200px;">
       </div>
    </div>
</div>
	
  
 
 
 <div class="bg-gray-200 py-4 shadow-lg mt-2">
    <div class="container mx-auto">
        <!-- Three Cards in a Row -->
        <div class="flex flex-wrap justify-center">
            <!-- First Card -->
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4">
               <a href="men.jsp"> <div class="relative bg-white rounded-lg overflow-hidden shadow-md">
                    <img src="All_Component/image/men3.jpg" class="w-full" alt="Card Image">
                    <!-- Text at the bottom -->
                    <div class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
                        <p class="text-white text-sm mb-0">MEN'S</p>
                    </div>
                </div></a>
            </div>
            <!-- Second Card -->
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4 ml-3">
                <a href="women.jsp"><div class="relative bg-white rounded-lg overflow-hidden shadow-md">
                    <img src="All_Component/image/women1.jpg" class="w-full" alt="Card Image">
                    <!-- Text at the bottom -->
                    <div class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
                        <p class="text-white text-sm mb-0">WOMEN'S</p>
                    </div>
                </div></a>
            </div>
            <!-- Third Card -->
            <div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4 ml-3">
                <a href="kids.jsp"><div class="relative bg-white rounded-lg overflow-hidden shadow-md">
                    <img src="All_Component/image/kids1.jpg" class="w-full" alt="Card Image">
                    <!-- Text at the bottom -->
                    <div class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
                        <p class="text-white text-sm mb-0">KID'S</p>
                    </div>
                </div></a>
            </div>
        </div>
    </div>
</div>
 
 
 
   <div class="container mx-auto mt-4">
    <div class="bg-gray-200 p-4 rounded-lg">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
            <% 
            ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
            List<ProductDtls> list = dao.getAllShoes();
            for (ProductDtls b : list) { 
            %>
            <div class="max-w-xs mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative" style="width: 250px; height: fit-content;">
                <a href="view_product.jsp?pid=<%=b.getProductId()%>" class="text-dark block ml-4">
                    <img class="w-full" src="product/<%=b.getPhotoName()%>" alt="<%=b.getProductname()%>" style="height: 200px; width:200px;">
                </a>
                <% if (session.getAttribute("userobj") != null) { %>
                <a class="absolute top-0 right-0 mt-2 mr-2 text-red-600 bg-white rounded-full p-2" href="${pageContext.request.contextPath}/cart?pid=<%=b.getProductId()%>&&uid=<%=((User)session.getAttribute("userobj")).getId() %>">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                <% } %>
                <div class="mt-2 ml-3">
                    <p class="font-bold text-xl"><%=b.getBrand() %></p>
                    <p class="text-gray-700 text-xs"><%=b.getProductname() %></p>
                    <p class="text-gray-700 font-semibold text-base text-sm mt-2">Rs. <%=b.getPrice()%></p>
                </div>
                <% if (session.getAttribute("userobj") != null) { %>
                <div class="px-6 pt-2 pb-2">
                    <a href="${pageContext.request.contextPath}/cart?pid=<%=b.getProductId()%>&&uid=<%=((User)session.getAttribute("userobj")).getId() %>" class="block bg-blue-500 text-white text-center py-1 rounded">Add to Cart</a>
                </div>
                <% } else { %>
                <div class="px-6 pt-2 pb-2">
                    <a href="view_product.jsp?pid=<%=b.getProductId() %>" class="block bg-blue-500 text-white text-center py-1 rounded">View</a>
                </div>
                <% } %>
            </div>
            <% } %>
            <% 
            List<ProductDtls> list2 = dao.getAllSandal();
            for (ProductDtls b : list2) { 
            %>
            <div class="max-w-xs mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative" style="width: 250px; height: fit-content;">
                <a href="view_product.jsp?pid=<%=b.getProductId()%>" class="text-dark block ml-4">
                    <img class="w-full" src="product/<%=b.getPhotoName()%>" alt="<%=b.getProductname()%>" style="height: 200px; width:200px;">
                </a>
                <% if (session.getAttribute("userobj") != null) { %>
                <a class="absolute top-0 right-0 mt-2 mr-2 text-red-600 bg-white rounded-full p-2" href="${pageContext.request.contextPath}/cart?pid=<%=b.getProductId()%>&&uid=<%=((User)session.getAttribute("userobj")).getId() %>">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                <% } %>
                <div class="mt-2 ml-3">
                    <p class="font-bold text-xl"><%=b.getBrand() %></p>
                    <p class="text-gray-700 text-xs"><%=b.getProductname() %></p>
                    <p class="text-gray-700 font-semibold text-base text-sm mt-2">Rs. <%=b.getPrice()%></p>
                </div>
                <% if (session.getAttribute("userobj") != null) { %>
                <div class="px-6 pt-2 pb-2">
                    <a href="${pageContext.request.contextPath}/cart?pid=<%=b.getProductId()%>&&uid=<%=((User)session.getAttribute("userobj")).getId() %>" class="block bg-blue-500 text-white text-center py-1 rounded">Add to Cart</a>
                </div>
                <% } else { %>
                <div class="px-6 pt-2 pb-2">
                    <a href="view_product.jsp?pid=<%=b.getProductId() %>" class="block bg-blue-500 text-white text-center py-1 rounded">View</a>
                </div>
                <% } %>
            </div>
            <% } %>
        </div>
    </div>
</div>
   
 
	
<div class="bottom-0 w-full bg-gray-900 text-white h-30 mt-8">
<%@include file="All_Component/index_footer.jsp" %>
</div>
</body>
</html>