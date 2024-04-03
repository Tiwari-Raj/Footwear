<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home Page</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>
 
	<div class="bg-gray-200 py-4 shadow-lg">
		<div class="container mx-auto">
		
			<!-- Three Cards in a Row -->
			<div class="flex flex-wrap justify-center">
				
				<div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md">
						<img src="../../All_Component/image/add_product.png" class="w-full"
							alt="Card Image"
							style="height: 220px; width: 250px; margin-left: 30px;">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<a href="Add_product.jsp" class="text-white text-lg mb-0">Add Product</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="bg-gray-200 shadow-lg">
		<div class="container mx-auto">
			<!-- Three Cards in a Row -->
			<div class="flex flex-wrap justify-center">
				<!-- First Card -->
				<div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md">
						<img src="../../All_Component/image/view_user.png" class="w-full"
							alt="Card Image"
							style="height: 180px; width: 200px; margin-left: 40px;">

						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<a href="manage_user.jsp" class="text-white text-lg mb-0">Manage User</a>
						</div>
					</div>
				</div>
				<div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md">
						<img src="../../All_Component/image/view_product.png" class="w-full"
							alt="Card Image"
							style="height: 180px; width: 200px; margin-left: 40px;">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<a href="manage_product.jsp" class="text-white text-lg mb-0">Manage Product</a>
						</div>
					</div>
				</div>
				<div class="w-full sm:w-1/2 md:w-1/3 lg:w-1/4 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md">
						<img src="../../All_Component/image/view_order.png" class="w-full"
							alt="Card Image"
							style="height: 180px; width: 200px; margin-left: 40px;">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<a href="manage_order.jsp" class="text-white text-lg mb-0">Manage Order</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




<%@include file="footer.jsp"%>
</body>
</html>