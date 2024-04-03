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
<title>Edit Product Page</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-gray-300">
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>


 <div class="bg-gray-300 mt-4">
    <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0">
        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="height: 600px">

            <div class="flex flex-col p-4 ml-32">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-4xl text-center font-thin ml-16">Update Product</h1>
                    
                    
						
						
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConn());
						ProductDtls b= dao.getProductById(id);
						
						%>
				
                    
                    <div class="w-full mt-4 ml-4">
                        <form class="form-horizontal w-3/4 mx-auto" method="post" action="${pageContext.request.contextPath}/editproducts">
                        
                        <input type="hidden" name="id" value="<%=b.getProductId()%>">
                        <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Name</Label> &nbsp;&nbsp; <input name="productname" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="<%=b.getProductname() %>" placeholder="Product Name">
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Brand</Label> &nbsp;&nbsp; <input name="brand" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="<%=b.getBrand() %>" placeholder="Brand Name">
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Price</Label> &nbsp;&nbsp; <input name="price" type="number" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="<%=b.getPrice() %>" placeholder="Price">
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Category</Label> &nbsp;&nbsp; <select name="category" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name">
                                <option value=""><%=b.getCategory() %></option>
                                <option value="Men">Men</option>
                                <option value="Women">Women</option>
                                <option value="Kids">Kid's</option>
                                </select>
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Type</Label> &nbsp;&nbsp; <select name="type"  class="flex-grow h-8 px-2 border rounded border-grey-400" id="name">
                                <option value=""><%=b.getType() %></option>
                                <option value="Running">Running</option>
                                <option value="Casual">Casual</option>
                                <option value="Sports">Sports</option>
                                <option value="Slipper">Slipper</option>
                                <option value="Sandal">Sandal</option> 
                                </select>
                            </div>
                            
                            <div class="flex flex-col mt-8">
                                <button type="submit" class="bg-green-500 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded">
                                    Update
                                </button>
                            </div>
                        </form>
                       
                    </div>
                </div>
            </div>
          </div>
    </div>
</div>




<%@include file="footer.jsp"%>
</body>
</html>















