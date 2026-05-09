<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html class="light" lang="en">

<head>

    <meta charset="utf-8"/>

    <meta content="width=device-width, initial-scale=1.0"
          name="viewport"/>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet"/>

    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
          rel="stylesheet"/>

    <title>Courses</title>

    <style>

        .material-symbols-outlined {
            font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24;
        }

        body {
            font-family: 'Inter', sans-serif;
        }

    </style>

</head>

<body class="bg-[#fbf9f6] min-h-screen flex">

<!-- SIDEBAR -->
<aside class="fixed left-0 top-0 h-full w-[260px] bg-neutral-900 border-r border-neutral-800 flex flex-col z-50">

    <div class="p-6">

        <h1 class="text-xl font-bold text-neutral-50">
            EduTech IT
        </h1>

        <p class="text-[10px] text-neutral-500 uppercase tracking-widest mt-1">
            Institutional Platform
        </p>

    </div>

    <nav class="flex-1 px-2 space-y-1">

        <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-neutral-50 transition-all duration-200 font-medium text-sm"
           href="admin-dashboard">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            Dashboard

        </a>

        <a class="flex items-center gap-3 w-full bg-[#4f6353]/10 text-[#b6ccb8] border-l-4 border-[#b6ccb8] py-3 px-4 transition-all duration-200 font-medium text-sm"
           href="courses">

            <span class="material-symbols-outlined">
                school
            </span>

            Courses

        </a>

        <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-neutral-50 transition-all duration-200 font-medium text-sm"
           href="assignments">

            <span class="material-symbols-outlined">
                assignment
            </span>

            Assignments

        </a>

    </nav>

    <div class="mt-auto border-t border-neutral-800 p-2">

        <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-neutral-50 transition-all duration-200 font-medium text-sm"
           href="logout">

            <span class="material-symbols-outlined">
                logout
            </span>

            Logout

        </a>

    </div>

</aside>

<!-- MAIN -->
<main class="ml-[260px] flex-1 min-h-screen">

    <!-- HEADER -->
    <header class="w-full h-16 border-b bg-white border-neutral-200 flex justify-between items-center px-6 sticky top-0 z-40">

        <div class="flex items-center gap-4">

            <span class="text-xl font-bold text-neutral-900">
                Available Courses
            </span>

        </div>

        <div class="flex items-center gap-4">

            <c:if test="${sessionScope.user.role == 'admin'}">
			
			    <a href="add-course"
			       class="bg-[#4f6353] text-white px-5 py-2 rounded font-semibold hover:brightness-110 transition-all uppercase text-sm">
			
			        Add Course
			
			    </a>
			
			</c:if>
            <a href="logout"
               class="text-sm font-semibold text-neutral-900 hover:text-[#4f6353] transition-colors">

                Logout

            </a>

        </div>

    </header>

    <!-- CONTENT -->
    <div class="max-w-[1200px] mx-auto p-6 py-12">

        <!-- TITLE -->
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-6">

            <div>

                <h2 class="text-4xl font-bold text-[#1b1c1a]">
                    Course Catalog
                </h2>

                <p class="text-[#5f5e5e] mt-2">
                    Explore all available institutional IT courses.
                </p>

            </div>

        </div>

        <!-- COURSE GRID -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <c:choose>

                <c:when test="${not empty courses}">

                    <c:forEach var="c"
                               items="${courses}">

                        <a href="course-details?id=${c.id}"
							   class="bg-white rounded-xl shadow-sm border border-neutral-200 overflow-hidden flex flex-col group hover:shadow-md transition-all duration-300">
							
							    <div class="p-6 flex flex-col flex-grow">
							
							        <div class="flex items-center gap-2 mb-3 text-[#4f6353] text-[10px] uppercase tracking-widest font-semibold">
							
							            <span class="material-symbols-outlined text-[14px]">
							                school
							            </span>
							
							            Course
							
							        </div>
							
							        <h3 class="text-2xl font-bold text-[#1b1c1a] mb-3">
							
							            ${c.title}
							
							        </h3>
							
							        <p class="text-sm text-[#434843] flex-grow mb-6">
							
							            ${c.description}
							
							        </p>
							
							        <div class="flex items-center justify-between pt-4 border-t border-neutral-100">
							
							            <span class="text-xs uppercase tracking-wider text-neutral-500 font-semibold">
							
							                View Details
							
							            </span>
							
							            <span class="material-symbols-outlined text-[#4f6353] group-hover:translate-x-1 transition-transform">
							                arrow_forward
							            </span>
							
							        </div>
							
							    </div>
							
							</a>

                        </div>

                    </c:forEach>

                </c:when>

                <c:otherwise>

                    <div class="col-span-3 bg-white p-10 rounded-xl border border-neutral-200 text-center">

                        <h2 class="text-3xl font-bold mb-3">
                            No Courses Found
                        </h2>

                        <p class="text-neutral-500 mb-6">
                            Add courses to display them here.
                        </p>

                        <a href="add-course"
                           class="bg-[#4f6353] text-white px-5 py-3 rounded font-semibold hover:brightness-110 transition-all">

                            Add First Course

                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</main>

</main>

<c:if test="${not empty sessionScope.errorMessage}">

    <div id="errorPopup"
         class="fixed top-6 right-6 bg-red-500 text-white px-6 py-4 rounded-xl shadow-2xl z-[9999] flex items-center gap-3">

        <span class="material-symbols-outlined">
            error
        </span>

        <span class="font-medium">
            ${sessionScope.errorMessage}
        </span>

    </div>

    <script>

        setTimeout(() => {

            document.getElementById("errorPopup")
                    .style.display = "none";

        }, 3000);

    </script>

    <c:remove var="errorMessage"
              scope="session"/>

</c:if>

</body>

</html>

</body>

</html>