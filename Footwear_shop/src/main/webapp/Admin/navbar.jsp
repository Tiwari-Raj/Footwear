<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

    <!-- Navbar -->
    <nav class="navbar bg-gray-900 text-white  top-0">

        <div class="px-2 xl:px-12 py-2 flex w-full items-center">


            <div class="flex flex-col items-center">
                <div>
                    <a class="text-3xl font-bold font-heading" href="#"> <img
                            src="../../All_Component/image/logo3.png" style="height:45px; width:40px;" class="h-8">
                    </a>
                </div>
                <div><span class="ml-2 text-ml font-bold font-heading">Footwear</span></div>
            </div>
            <!-- Nav Links -->
           <ul class="flex items-center space-x-8 ml-32">
    <li><a class="hover:text-gray-200" href="home.jsp">Home</a></li>
    
</ul>


                <div class="lg:flex hidden items-center space-x-2 bg-white py-1 px-2 rounded-full ml-64">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-600 cursor-pointer" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </span>
                    <input class="outline-none" type="text" placeholder="Search" />
                </div>
            

            <div class="flex justify-end space-x-3 ml-64">

                	<c:if test="${not empty userobj }">
                
                <button class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">
                    
                    <span>${userobj.name }</span>
                </button>
                
               

              <a data-toggle="modal" data-target="#exampleModal">
                <button id="logoutButton" class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">
              <span>Logout</span><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 transform rotate-180" viewBox="0 0 20 20" fill="currentColor">
    <path fill-rule="evenodd" d="M3 3a1 1 0 011-1v12a1 1 0 11-2 0V4a1 1 0 011-1zm7.707 3.293a1 1 0 010 1.414L9.414 9H17a1 1 0 110 2H9.414l1.293 1.293a1 1 0 01-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0z" clip-rule="evenodd" />
</svg>
                </button></a>
              </c:if>
              
              <c:if test="${ empty userobj }">
                
                <a href="../login.jsp"><button class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M3 3a1 1 0 011 1v12a1 1 0 11-2 0V4a1 1 0 011-1zm7.707 3.293a1 1 0 010 1.414L9.414 9H17a1 1 0 110 2H9.414l1.293 1.293a1 1 0 01-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>Login</span>
                </button>
                </a>
               

              <a href="../register.jsp">
                <button  class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                    </svg>
                    <span>Register</span>
                </button></a>
              </c:if>
            </div>
        </div>







<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center text-danger">
                    <h3>Do you want to logout?</h3>
                    <br>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../../logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>


    </nav>


