<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html class="light" lang="en">

<head>

<meta charset="utf-8"/>

<meta content="width=device-width, initial-scale=1.0"
      name="viewport"/>

<title>Assignments</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
      rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"/>

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
        background-color: #fbf9f6;
    }

</style>

</head>

<body class="flex min-h-screen text-[#1b1c1a]">

<!-- SIDEBAR -->
<aside class="fixed left-0 top-0 h-full w-[260px] border-r border-neutral-800 bg-neutral-900 flex flex-col z-50">

    <div class="p-6 flex flex-col gap-1">

        <div class="flex items-center gap-3 mb-10">

            <div class="w-10 h-10 bg-emerald-200 flex items-center justify-center rounded">

                <span class="material-symbols-outlined text-neutral-900">
                    school
                </span>

            </div>

            <div>

                <h1 class="text-lg font-bold text-neutral-50 leading-tight">
                    EduTech IT
                </h1>

                <p class="text-[10px] uppercase tracking-widest text-emerald-200 opacity-70">
                    Institutional Platform
                </p>

            </div>

        </div>

        <nav class="flex flex-col gap-1">

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-neutral-50 transition-all"
               href="${sessionScope.user.role == 'admin' ? 'admin-dashboard' : 'student-dashboard'}">

                <span class="material-symbols-outlined">
                    dashboard
                </span>

                <span class="text-sm font-medium">
                    Dashboard
                </span>

            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-neutral-50 transition-all"
               href="courses">

                <span class="material-symbols-outlined">
                    school
                </span>

                <span class="text-sm font-medium">
                    Courses
                </span>

            </a>

            <a class="flex items-center gap-3 w-full bg-neutral-800 text-emerald-200 border-l-4 border-emerald-200 py-3 px-4 transition-all"
               href="assignments">

                <span class="material-symbols-outlined">
                    assignment
                </span>

                <span class="text-sm font-medium">
                    Assignments
                </span>

            </a>

        </nav>

    </div>

    <div class="mt-auto p-6 border-t border-neutral-800">

        <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-neutral-50 transition-all"
           href="logout">

            <span class="material-symbols-outlined">
                logout
            </span>

            <span class="text-sm font-medium">
                Logout
            </span>

        </a>

    </div>

</aside>

<!-- MAIN -->
<main class="flex-1 ml-[260px] min-h-screen flex flex-col">

    <!-- HEADER -->
    <header class="w-full h-16 border-b border-neutral-200 bg-white sticky top-0 z-40 flex justify-between items-center px-8">

        <div class="flex items-center gap-4">

            <span class="text-xl font-black text-neutral-900">
                EduTech IT
            </span>

            <nav class="hidden md:flex gap-6 ml-8">

                <a class="text-neutral-900 font-bold"
                   href="assignments">

                    Assignments

                </a>

                <a class="text-neutral-500 hover:text-neutral-900 transition-colors"
                   href="courses">

                    Courses

                </a>

            </nav>

        </div>

        <div class="flex items-center gap-4">

            <a href="logout"
               class="text-sm font-bold">

                Logout

            </a>

        </div>

    </header>

    <!-- CONTENT -->
    <div class="max-w-[1200px] w-full mx-auto p-6">

        <!-- PAGE HEADER -->
        <div class="mb-12 flex justify-between items-end">

            <div>

                <span class="text-xs text-[#4f6353] uppercase mb-1 block font-semibold">

                    Academic Coursework

                </span>

                <h2 class="text-4xl font-bold text-[#1b1c1a]">

                    Assignments

                </h2>

            </div>
            
            <c:if test="${sessionScope.user.role == 'admin'}">
			
			    <a href="add-assignment"
			       class="bg-[#4f6353] text-white px-5 py-3 rounded-lg font-semibold hover:bg-black transition-all">
			
			        Add Assignment
			
			    </a>
			
			</c:if>

        </div>

        <!-- TABLE -->
        <div class="bg-white border border-neutral-200 overflow-hidden rounded-xl shadow-sm">

            <div class="bg-neutral-900 px-6 py-4 flex justify-between items-center">

                <h4 class="text-white font-bold text-sm">

                    Assignment Inventory

                </h4>

            </div>

            <table class="w-full text-left border-collapse">

                <thead class="bg-neutral-100 border-b border-neutral-200">

                    <tr>

                        <th class="px-6 py-4 text-xs text-neutral-600 uppercase">
                            Course
                        </th>

                        <th class="px-6 py-4 text-xs text-neutral-600 uppercase">
                            Assignment
                        </th>

                        <th class="px-6 py-4 text-xs text-neutral-600 uppercase">
                            Description
                        </th>

                        <th class="px-6 py-4 text-xs text-neutral-600 uppercase">
                            Deadline
                        </th>

                        <th class="px-6 py-4 text-xs text-neutral-600 uppercase">
                            Action
                        </th>

                    </tr>

                </thead>

                <tbody class="divide-y divide-neutral-100">

                    <c:choose>

                        <c:when test="${not empty assignments}">

                            <c:forEach var="a"
                                       items="${assignments}">

                                <tr class="hover:bg-neutral-50 transition-colors">

                                    <!-- COURSE -->
                                    <td class="px-6 py-6 align-top">

                                        <div class="flex flex-col">

                                            <span class="font-bold text-[#1b1c1a]">

                                                ${a.courseTitle}

                                            </span>

                                        </div>

                                    </td>

                                    <!-- TITLE -->
                                    <td class="px-6 py-6 align-top">

                                        <span class="font-bold text-[#1b1c1a]">

                                            ${a.title}

                                        </span>

                                    </td>

                                    <!-- DESCRIPTION -->
                                    <td class="px-6 py-6 align-top">

                                        <p class="text-sm text-[#5f5e5e] max-w-sm">

                                            ${a.description}

                                        </p>

                                    </td>

                                    <!-- DEADLINE -->
                                    <td class="px-6 py-6 align-top">

                                        <span class="text-sm font-semibold text-red-600">

                                            ${a.deadline}

                                        </span>

                                    </td>

                                    <!-- ACTION -->
                                    <td class="px-6 py-6 align-top">

                                        <c:if test="${sessionScope.user.role == 'student'}">
										
										    <a href="submission?assignmentId=${a.id}"
										       class="bg-[#4f6353] text-white px-4 py-2 rounded text-xs font-semibold hover:bg-black transition-all inline-block">
										
										        Submit
										
										    </a>
										
										</c:if>
										
										<c:if test="${sessionScope.user.role == 'admin'}">
										
										    <a href="submissions"
										       class="bg-neutral-900 text-white px-4 py-2 rounded text-xs font-semibold hover:bg-black transition-all inline-block">
										
										        View Submissions
										
										    </a>
										
										</c:if>

                                    </td>

                                </tr>

                            </c:forEach>

                        </c:when>

                        <c:otherwise>

                            <tr>

                                <td colspan="5"
                                    class="text-center py-10 text-neutral-500">

                                    No assignments found.

                                </td>

                            </tr>

                        </c:otherwise>

                    </c:choose>

                </tbody>

            </table>

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