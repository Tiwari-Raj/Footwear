<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="All_Component/all_css.jsp" %>
</head>
<body>


<%@include file="All_Component/navbar.jsp" %>


<!-- component -->
<div class="bg-gray-300 h-screen">
    <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0">
        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="height: 500px">
         <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url(All_Component/image/register.png); background-size: cover; margin-top:80px; background-position: center center; height:270px; width:250px;">
         </div>
   
            <div class="flex flex-col w-full md:w-1/2 p-4">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-4xl text-center font-thin">Register Here!</h1>
                    
                    
                    
                    <c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
                    
                    
                    
                    <div class="w-full mt-4">
                        <form class="form-horizontal w-3/4 mx-auto" method="post" action="register">
                        <div class="flex flex-col mt-4">
                                <input id="Name" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" name="name" value="" placeholder="Full Name">
                            </div>
                            <div class="flex flex-col mt-4">
                                <input id="email" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" name="email" value="" placeholder="Email">
                            </div>
                            <div class="flex flex-col mt-4">
                                <input id="phone" type="number" class="flex-grow h-8 px-2 border rounded border-grey-400" name="phone" value="" placeholder="Mobile No">
                            </div>
                            <div class="flex flex-col mt-4">
                                <input id="password" type="password" class="flex-grow h-8 px-2 rounded border border-grey-400" name="password" required placeholder="Password">
                            </div>
                            <div class="flex items-center mt-4">
                                <input type="checkbox" name="check" id="remember" class="mr-2"> <label for="check" class="text-sm text-grey-dark">Agree T&C</label>
                            </div>
                            <div class="flex flex-col mt-8">
                                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded">
                                    Register
                                </button>
                            </div>
                        </form>
                        <div class="text-center mt-4">
                            <a class="no-underline hover:underline text-blue-dark text-xs" href="login.jsp">
                                Already Register!
                            </a>
                        </div>
                    </div>
                </div>
            </div>
                </div>
    </div>
</div>

<%@include file="All_Component/footer.jsp" %>
</body>
</html>