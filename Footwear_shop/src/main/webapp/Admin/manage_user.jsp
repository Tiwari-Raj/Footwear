<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manage user Page</title>
<%@include file="all_css.jsp"%>
</head>
<body class="bg-gray-300">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h4 class="text-center text-danger">${failedMsg}</h4>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="overflow-x-auto">
		<table
			class=" w-full table-auto bg-gray-400 border-collapse border border-gray-400">
			<thead>
				<tr class="text-white">
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">ID</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Name</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Email</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Phone</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Password</th>
					<th class="px-4 py-2 bg-gray-700 border border-gray-400">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				List<User> list = dao.getAllUser();

				for (User u : list) {
				%>

				<tr>
					<td class="px-4 py-2 border border-gray-200"><%=u.getId()%></td>
					<td class="px-4 py-2 border border-gray-200"><%=u.getName()%></td>
					<td class="px-4 py-2 border border-gray-300"><%=u.getEmail()%></td>
					<td class="px-4 py-2 border border-gray-300"><%=u.getPhone()%></td>
					<td class="px-4 py-2 border border-gray-300"><%=u.getPassword()%></td>
					<td class="px-4 py-2 border border-gray-300">
						<a href="../deleteUser?id=<%=u.getId()%>"><button
								type="submit"
								class="bg-red-500 text-white text-sm font-semibold py-2 px-4 rounded">Delete</button></a>
					</td>
				</tr>

				<%
				}
				%>


			</tbody>
		</table>
	</div>


	<%@include file="footer.jsp"%>
</body>
</html>