<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout page</title>
<%@include file="All_Component/all_css.jsp"%>

<style>

[id^="forsize_"][type="radio"] {
    width: 30px;
    height: 30px;
    border-radius: 15px;
    border: 1px solid black;
    background-color: white;
    -webkit-appearance: none;
    -moz-appearance: none;
}

[id^="forsize_"][type="radio"]:focus {
    outline: none;
}

[id^="forsize_"][type="radio"]:checked {
    background-color: #1FBED6;
}

[id^="forsize_"][type="radio"]:checked ~ span:first-of-type {
    color: white;
}

label span:first-of-type {
    position: relative;
    left: 10px;
    font-size: 15px;
    color: #1FBED6;
}

label span {
    position: relative;
    top: -33px;
}



</style>


</head>
<body>
	<%@include file="All_Component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-primary" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-primary" role="alert">${failedMsg }</div>

		<c:remove var="failedMsg" scope="session" />

	</c:if>

<div class="grid sm:px-10 lg:grid-cols-2 lg:px-10 xl:px-32">
  <div class="px-4 pt-8">
    <p class="text-xl font-medium">Order Summary</p>
    <p class="text-gray-400">Check your items.</p>
    <div class="mt-8 space-y-3 rounded-lg border bg-white px-2 py-4 sm:px-6">
        <%
            User u = (User) session.getAttribute("userobj");
            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            List<Cart> cart = dao.getProductByUser(u.getId());
            Double totalPrice = 0.00;

            for (Cart c : cart) {
                totalPrice = c.getTotalPrice();
        %>
        <div class="flex flex-col rounded-lg bg-white sm:flex-row relative">
            <a href="${pageContext.request.contextPath}/remove_product?pid=<%=c.getPid()%>&&uid=<%=u.getId() %>">
                <img class="rounded-md border" src="product/<%=c.getPhoto()%>" style="width:200px; height:150px;">
                <button class="absolute top-2 right-2 focus:outline-none">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </a>
            <div class="flex w-full flex-col px-4">
                <span class="font-semibold"><%=c.getBrand() %></span>
                <span class="float-right text-gray-400"><%=c.getProductName() %></span>
                <p class="mt-auto text-lg font-bold"><%=c.getPrice() %></p>
                <div class="flex items-center space-x-4 mt-4">
                    <label class="text-gray-700 font-bold">Select Size </label>
                    <label>
                        <input type="radio" id="forsize_<%= c.getPid() %>" name="options_<%= c.getPid() %>" />
                        <span>6</span>
                    </label>
                    <br />
                    <label>
                        <input type="radio" id="forsize_<%= c.getPid() %>" name="options_<%= c.getPid() %>" />
                        <span>7</span>
                    </label>
                    <br />
                    <label>
                        <input type="radio" id="forsize_<%= c.getPid() %>" name="options_<%= c.getPid() %>" />
                        <span>8</span>
                    </label>
                    <br />
                    <label>
                        <input type="radio" id="forsize_<%= c.getPid() %>" name="options_<%= c.getPid() %>" />
                        <span>9</span>
                    </label>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <hr>
    </div>
</div>


<div class="mt-2 bg-gray-50 px-4 pt-8 lg:mt-0">

<div class="mt-2 space-y-3 rounded-lg border bg-white px-2 py-4 sm:px-6">
         
          <form action="order" method="post">

							<input type="hidden" value="${userobj.id}" name="id">
         
		<div class="px-4 pt-4">
        
			<p class="mt-2 text-lg font-medium">Personal Details</p>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4"
						class="block text-sm font-medium text-gray-700">Name</label> <input
						type="text" name="username"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputEmail4" value="" required>
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4"
						class="block text-sm font-medium text-gray-700">Email</label> <input
						type="email" name="email"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputPassword4" value="" required>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4"
						class="block text-sm font-medium text-gray-700">Mobile No</label>
					<input type="number" name="phone"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputEmail4" value="" required>
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4"
						class="block text-sm font-medium text-gray-700">Address</label> <input
						type="text" name="address"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputPassword4" value="" required>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4"
						class="block text-sm font-medium text-gray-700">Landmark</label> <input
						type="text" name="landmark"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputEmail4" value="" required>
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4"
						class="block text-sm font-medium text-gray-700">City</label> <input
						type="text" name="city"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputPassword4" value="" required>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4"
						class="block text-sm font-medium text-gray-700">State</label> <input
						type="text" name="state"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputEmail4" value="" required>
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4"
						class="block text-sm font-medium text-gray-700">Pin Code</label> <input
						name="pincode" type="number"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputPassword4" value="" required>
				</div>
			</div>
</div>
		
		<div class="mt-10 bg-gray-50 px-4 pt-8 lg:mt-0">
			<p class="text-xl font-medium">Payment Details</p>
			<p class="text-gray-400">Complete your order by providing your
				payment details.</p>
			<div class="mt-2" name="payment">
				<input type="radio" id="cashOnDelivery" name="payment"
					value="COD" style="display: inline-block; margin-right: 10px;"
					checked>
				 <label for="cashOnDelivery"
					style="display: inline-block; margin-right: 20px;">Cash on
					Delivery</label>
				 <input type="radio" id="cardPayment" name="payment"
					value="CARD PAYMENT" style="display: inline-block; margin-right: 10px;">
				<label for="cardPayment"
					style="display: inline-block; margin-right: 20px;">Card
					Payment</label>
			</div>


			<div class="mt-2" id="cardPaymentSection" style="display: none;">

				<label for="card-holder" class="mt-4 mb-2 block text-sm font-medium">Card
					Holder</label>
				<div class="relative">
					<input type="text" id="card-holder" name="card-holder"
						class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm uppercase shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
						placeholder="   full name"/>
					<div
						class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
						
					</div>
				</div>
				<label for="card-no" class="mt-4 mb-2 block text-sm font-medium">Card
					Details</label>
				<div class="flex">
					<div class="relative w-7/12 flex-shrink-0">
						<input type="text" id="card-no" name="card-no"
							class="w-full rounded-md border border-gray-200 px-2 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
							placeholder="       xxxx-xxxx-xxxx-xxxx" pattern="[4-7][0-9]{15}" />
						<div
							class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
							
						</div>
					</div>
					<input type="text" name="credit-expiry"
						class="w-full rounded-md border border-gray-200 px-2 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
						placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/\d{2}" /> <input type="text" name="credit-cvc"
						class="w-1/6 flex-shrink-0 rounded-md border border-gray-200 px-2 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
						placeholder="CVC" pattern="(?!000)\d{3}"/>
				</div>


			</div>

			<div id="cashPaymentSection">
				<div class="col-md-12 mt-4">
					<label for="inputEmail4"
						class="block text-sm font-medium text-gray-700">Name</label> <input
						type="text" name="username"
						class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
						id="inputEmail4" value="<%=u.getName() %>" readonly>
				</div>
				<div class="row ml-1 mt-3">
					<div class=" col-md-6">
						<label for="inputPassword4"
							class="block text-sm font-medium text-gray-700">Email</label> <input
							type="email" name="email"
							class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
							id="inputPassword4" value="<%=u.getEmail() %>" readonly>
					</div>

					<div class=" col-md-6">
						<label for="inputEmail4"
							class="block text-sm font-medium text-gray-700">Mobile No</label>
						<input type="number" name="phno"
							class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
							id="inputEmail4" value="<%=u.getPhone() %>" readonly>
					</div>
				</div>
			</div>


        
			<div class="mt-6 border-t border-b py-2">
				<div class="flex items-center justify-between">
					<p class="text-sm font-medium text-gray-900">Subtotal</p>
					<p class="font-semibold text-gray-900"><%=totalPrice %></p>
				</div>
				<div class="flex items-center justify-between">
					<p class="text-sm font-medium text-gray-900">Free Shipping</p>
					<p class="font-semibold text-gray-900">$0.00</p>
				</div>
			</div>
			<div class="mt-6 flex items-center justify-between">
				<p class="text-sm font-medium text-gray-900">Total</p>
				<p class="text-2xl font-semibold text-gray-900"><%=totalPrice %></p>
			</div>
  
			<button
				class="mt-4 mb-8 w-full rounded-md bg-gray-900 px-6 py-3 font-medium text-white">Place
				Order</button>

		</div>
</form>
	</div>
</div>
</div>
	<script>
    const cashRadio = document.getElementById('cashOnDelivery');
    const cardRadio = document.getElementById('cardPayment');
    const cashSection = document.getElementById('cashPaymentSection');
    const cardSection = document.getElementById('cardPaymentSection');

    // Initially show cash payment section
    cashSection.style.display = 'block';

    // Add event listeners to radio buttons
    cashRadio.addEventListener('change', () => {
        if (cashRadio.checked) {
            cashSection.style.display = 'block';
            cardSection.style.display = 'none';
        }
    });

    cardRadio.addEventListener('change', () => {
        if (cardRadio.checked) {
            cashSection.style.display = 'none';
            cardSection.style.display = 'block';
        }
    });
</script>


	<%@include file="All_Component/index_footer.jsp"%>
</body>
</html>