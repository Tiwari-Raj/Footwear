<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <%@include file="All_Component/all_css.jsp"%>
</head>
<body>

<%@include file="All_Component/navbar.jsp" %>

<!-- component -->
<div class="w-full">
    <div class="md:flex">
        <div class="md:w-1/2 bg-gradient-to-tr from-blue-800 to-purple-700 hidden md:block">
            <div class="h-screen flex flex-col justify-center items-center">
                <img src="All_Component/image/logo3.png" alt="Logo" style="height: 70px; width: 60px;">
                <h1 class="text-white font-bold text-4xl font-sans">FootWear</h1>
                <p class="text-white mt-1">
                    <i>Discover the perfect pair to walk your path, one step at a time.</i>
                </p>
                <a href="index.jsp">
                    <button type="submit" class="block w-28 bg-white text-indigo-800 mt-4 py-2 rounded-2xl font-bold mb-2">Shop Now</button>
                </a>
            </div>
        </div>
        <div class="md:w-1/2 bg-white flex justify-center items-center py-10">
            <form class="w-full md:max-w-md bg-white" action="login" method="post">
                <h1 class="text-gray-800 font-bold text-2xl mb-1 text-center">Hello Again!</h1>
                
                <c:if test="${not empty failedMsg }">
                    <p class="text-center text-danger">${failedMsg}</p>
                    <c:remove var="failedMsg" scope="session" />
                </c:if>
                         
                <c:if test="${not empty succMsg }">
                    <p class="text-center text-success">${succMsg}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>
                
                <div class="flex items-center border-2 py-2 px-3 rounded-2xl mb-4 mt-4">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
                    </svg>
                    <input class="pl-2 outline-none border-none" type="text" name="email" id="" placeholder="Email Address">
                </div>
                <div class="flex items-center border-2 py-2 px-3 rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                    </svg>
                    <input class="pl-2 outline-none border-none"  type="password" name="password" id="" placeholder="Password">
                </div>
                <a class="text-sm ml-2 hover:text-blue-500 cursor-pointer" href="forgotPassword.jsp">Forgot Password?</a>
                <button type="submit" class="block w-full bg-indigo-600 mt-4 py-2 rounded-2xl text-white font-semibold mb-2">Login</button>
                <div class="flex flex-col items-center">
                    <a href="register.jsp"><i>Don't have an account!</i></a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
