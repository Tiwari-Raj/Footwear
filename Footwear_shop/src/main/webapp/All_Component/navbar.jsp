<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
.dropdown-menu {
	display: none;
}
</style>
</head>

<body>

	<nav class="navbar bg-gray-900 text-white  top-0">

		<div class="px-2 xl:px-12 py-2 flex w-full items-center">


			<div class="flex flex-col items-center">
				<div>
					<a class="text-3xl font-bold font-heading" href="#"> <img
						src="All_Component/image/logo3.png"
						style="height: 45px; width: 40px;" class="h-8">
					</a>
				</div>
				<div>
					<span class="ml-2 text-ml font-bold font-heading">Footwear</span>
				</div>
			</div>

			<ul class="flex items-center space-x-8 ml-32">
				<li><a class="hover:text-gray-200" href="index.jsp">Home</a></li>
				<li class="relative inline-block text-left">
					<button
						class="text-white bg-gray-900 px-4 py-2 rounded-md flex items-center justify-between"
						id="options-menu" aria-haspopup="true" aria-expanded="true"
						onclick="toggleDropdown()">
						Category

						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-2"
							viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd"
								d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
								clip-rule="evenodd" />
            </svg>
					</button>

					<div
						class="dropdown-menu origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 hidden"
						id="dropdown-menu">
						<div class="py-1" role="menu" aria-orientation="vertical"
							aria-labelledby="options-menu">
							<a href="men.jsp"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
								role="menuitem">Men</a> <a href="women.jsp"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
								role="menuitem">Women</a> <a href="kids.jsp"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
								role="menuitem">Kid's</a>

						</div>
					</div>
				</li>
			</ul>


			<div
				class="lg:flex hidden items-center space-x-2 bg-white py-1 px-2 rounded-full ml-32">
				<span> <svg xmlns="http://www.w3.org/2000/svg"
						class="h-6 w-6 text-gray-600 cursor-pointer" fill="none"
						viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
				</span> <input class="outline-none" type="text" placeholder="Search" />
			</div>

			<c:if test="${not empty userobj}">
				<div class="flex justify-end space-x-3 ml-64">


					<a href="setting.jsp"><button
							class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">

							<span>${userobj.name }</span>
						</button> </a> <a href="logout">
						<button
							class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">


							<span>Logout</span>
							<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5"
								viewBox="0 0 20 20" fill="currentColor">
                               <path fill-rule="evenodd"
									d="M17 17a1 1 0 01-1-1V4a1 1 0 112 0v12a1 1 0 01-1 1zm-7.707-3.293a1 1 0 010-1.414L10.586 11H3a1 1 0 110-2h7.586l-1.293-1.293a1 1 0 011.414-1.414l3 3a1 1 0 010 1.414l-3 3a1 1 0 01-1.414 0z"
									clip-rule="evenodd" />
                               </svg>


						</button>
					</a>

				</div>
			</c:if>




			<c:if test="${ empty userobj}">
				<div class="flex justify-end space-x-3 ml-64">


					<a href="login.jsp"><button
							class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">

							<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5"
								viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd"
									d="M3 3a1 1 0 011 1v12a1 1 0 11-2 0V4a1 1 0 011-1zm7.707 3.293a1 1 0 010 1.414L9.414 9H17a1 1 0 110 2H9.414l1.293 1.293a1 1 0 01-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0z"
									clip-rule="evenodd" />
                    </svg>
							<span>Login</span>
						</button> </a> <a href="register.jsp">
						<button
							class="px-4 py-2 bg-gray-500 hover:bg-indigo-500 text-gray-50 rounded-xl flex items-center gap-2">

							<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
								fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                    </svg>
							<span>Register</span>
						</button>
					</a>

				</div>
			</c:if>
		</div>

	</nav>

	<script>
		function toggleDropdown() {
			var dropdownMenu = document.getElementById("dropdown-menu");
			dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none"
					: "block";
		}
	</script>

</body>

</html>
