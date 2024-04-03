<%@page import="com.entity.Product_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setting</title>
<%@include file="All_Component/all_css.jsp"%>
</head>
<body>

<%@include file="All_Component/navbar.jsp"%>

<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>

<c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
                         
                         <c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>

<div style="display: flex; margin: 20px;">
    <div class="flex flex-col text-center bg-gray-100" style="width:200px; margin-left:40px;">
        <label class="cursor-pointer w-full mt-5 ml-5">
            <input type="radio" name="content" value="personal" id="personal" checked hidden>
            <img src="All_Component/image/1.png" style="height:100px; width:100px; border-radius: 50%;" alt="Personal Details" class="w-full img-radio" data-value="personal">
        </label>
        Personal Details
        <hr>
        <label class="cursor-pointer w-full mt-4 ml-5">
            <input type="radio" name="content" value="profile" id="profile" hidden>
            <img src="All_Component/image/2.png" style="height:100px; width:100px; border-radius: 50%;" alt="Edit Profile" class="w-full img-radio" data-value="profile">
        </label>
        Edit Profile
        <hr>
        <label class="cursor-pointer w-full mt-4 ml-5">
            <input type="radio" name="content" value="order" id="order" hidden>
            <img src="All_Component/image/3.png" style="height:100px; width:100px; border-radius: 50%;" alt="Your Order" class="w-full img-radio" data-value="order">
        </label>
        Your Order
    </div>
  
                     <c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
                         
                         <c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
  
   <div style="flex: 1;">
    <div id="personalContent" style="display: block;">
      
     
      
<div class="bg-gray-300" style="height:600px;">
    <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0">
        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="height: 400px">

            <div class="flex flex-col p-4 ml-16">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-4xl text-center font-thin ml-16">Your Profile</h1>

                        <div class="w-full mt-4 ml-4">
                        
                        <input type="hidden" name="id" value="">
                        <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Name</Label> &nbsp;&nbsp;
                                 <input name="name" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="${userobj.name }" placeholder=" Name" readonly>
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Email</Label> &nbsp;&nbsp;
                                 <input name="email" type="email" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="${userobj.email}" placeholder="Email" readonly>
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Phone</Label> &nbsp;&nbsp;
                                 <input name="price" type="number" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="${userobj.phone}" placeholder="Phone" readonly>
                            </div>
                            
 
                    </div>
</div>
</div>
</div>
</div>
</div>
      
    </div>
    <div id="orderContent" style="display: none;">
     
      
<div>
<table class="table table-striped">
			<thead>
      <tr class="text-white">
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Order ID</th>
       
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Product Name</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Brand</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Price</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Payment Type</th>
        <th class="px-4 py-2 bg-gray-700 border border-gray-400">Action</th>
      </tr>
    </thead>
			<tbody>
			<%
				User u = (User) session.getAttribute("userobj");
				ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DBConnect.getConn());
				List<Product_Order> blist = dao.getProduct(u.getEmail());
				for (Product_Order b : blist) {
				%>
			     <tr>
        <td class="px-4 py-2 border border-gray-200"><%=b.getOrderId() %></td>
        <td class="px-4 py-2 border border-gray-200"><%=b.getProductName() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getBrand() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getPrice() %></td>
        <td class="px-4 py-2 border border-gray-300"><%=b.getPaymentType() %></td>
         <td class="px-4 py-2 border border-gray-300"><a
					href="OrderDelete?order_id=<%=b.getOrderId()%>"
					class="btn btn-sm btn-danger">
						Cancel</a></td>
      </tr>
			     
			
			
			<%
				}
			%>
			</tbody>
			
			
			</table>

</div>
    </div>
    <div id="profileContent" style="display: none;">
     
      
      
<div class="bg-gray-300" style="height:600px;">
    <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0">
        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2  bg-white sm:mx-0" style="height: 400px">

            <div class="flex flex-col p-4 ml-16">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-4xl text-center font-thin ml-16">Update Profile</h1>

                        <div class="w-full mt-4 ml-4">
                        <form class="form-horizontal w-3/4 mx-auto" method="post" action="${pageContext.request.contextPath}/update_profile">
                        

							<input type="hidden" value="${userobj.id}" name="id">
                        <input type="hidden" name="id" value="">
                        <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Name</Label> &nbsp;&nbsp;
                                 <input name="name" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="${userobj.name }" placeholder=" Name">
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Email</Label> &nbsp;&nbsp;
                                 <input name="email" type="email" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="" placeholder="Email">
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Phone</Label> &nbsp;&nbsp;
                                 <input name="phone" type="number" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="" placeholder="Phone">
                            </div>
                            <div class="flex flex-row mt-4">
                                <Label class="text-gray-700 font-semibold">Password</Label> &nbsp;&nbsp;
                                 <input name="password" type="password" class="flex-grow h-8 px-2 border rounded border-grey-400" id="name" value="" placeholder="Password">
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

    </div>
  </div>
</div>



<script>
    $(document).ready(function(){
        // Initially hide all content except Personal Details
        $("#profileContent, #orderContent").hide();
        
        // Set Personal Details as checked and show its content
        $("#personal").prop("checked", true);
        $("#personalContent").show();
        
        // Handle image click event
        $(".img-radio").click(function(){
            var inputValue = $(this).data("value");
            var targetContent = $("#" + inputValue + "Content");
            
            // Hide all content
            $("#personalContent, #profileContent, #orderContent").hide();
            
            // Show content corresponding to the clicked image
            targetContent.show();
            
            // Uncheck all radio buttons
            $('input[name="content"]').prop("checked", false);
            
            // Check the radio button corresponding to the clicked image
            $("#" + inputValue).prop("checked", true);
        });
    });
</script>






<%@include file="All_Component/index_footer.jsp"%>
</body>
</html>