<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html class="light" lang="en">

<head>

<meta charset="utf-8"/>

<meta content="width=device-width, initial-scale=1.0"
      name="viewport"/>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
      rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"/>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<title>Student Dashboard</title>

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

    ::-webkit-scrollbar {
        width: 6px;
    }

    ::-webkit-scrollbar-track {
        background: transparent;
    }

    ::-webkit-scrollbar-thumb {
        background: #474746;
        border-radius: 10px;
    }

</style>

</head>

<body class="bg-[#C2D8C4] font-body text-[#222222] antialiased overflow-x-hidden">

<!-- SIDEBAR -->
<aside class="fixed left-0 top-0 h-full w-[260px] border-r border-[#222222] bg-[#222222] flex flex-col z-50">

    <div class="p-6 flex flex-col gap-2">

        <div class="flex items-center gap-3 mb-12">

            <div class="h-10 w-10 bg-emerald-200 rounded-lg flex items-center justify-center">

                <span class="material-symbols-outlined text-[#222222]"
                      style="font-variation-settings: 'FILL' 1;">

                    school

                </span>

            </div>

            <div>

                <h1 class="text-lg font-bold text-neutral-50 leading-none">
                    IT Education
                </h1>

                <p class="text-[10px] uppercase tracking-widest text-neutral-400">
                    Institutional Platform
                </p>

            </div>

        </div>

        <!-- NAVIGATION -->
        <nav class="flex flex-col gap-1">

            <a class="flex items-center gap-3 w-full bg-white/10 text-white border-l-4 border-white py-3 px-4 text-sm font-medium transition-all duration-200"
               href="student-dashboard">

                <span class="material-symbols-outlined">
                    dashboard
                </span>

                <span>
                    Dashboard
                </span>

            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-white/5 text-sm font-medium transition-all duration-200"
               href="courses">

                <span class="material-symbols-outlined">
                    school
                </span>

                <span>
                    Courses
                </span>

            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-white/5 text-sm font-medium transition-all duration-200"
               href="assignments">

                <span class="material-symbols-outlined">
                    assignment
                </span>

                <span>
                    Assignments
                </span>

            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-white/5 text-sm font-medium transition-all duration-200"
               href="#">

                <span class="material-symbols-outlined">
                    upload_file
                </span>

                <span>
                    Submissions
                </span>

            </a>

        </nav>

    </div>

    <!-- BOTTOM -->
    <div class="mt-auto p-6 border-t border-neutral-800">

        <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-white/5 text-sm font-medium transition-all duration-200"
           href="logout">

            <span class="material-symbols-outlined">
                logout
            </span>

            <span>
                Logout
            </span>

        </a>

    </div>

</aside>

<!-- MAIN WRAPPER -->
<div class="ml-[260px] flex flex-col min-h-screen">

    <!-- TOPBAR -->
    <header class="w-full h-16 border-b z-40 sticky top-0 border-[#222222]/10 bg-[#C2D8C4] flex items-center px-8">

        <div class="flex-none">

            <span class="text-xl font-black text-[#222222] tracking-tight">
                EduTech IT
            </span>

        </div>

        <div class="flex-grow flex justify-end items-center gap-6">

            <!-- SEARCH -->
            <div class="relative max-w-md w-full">

                <input class="bg-white/40 border border-[#222222]/10 px-4 py-2 text-sm w-full focus:ring-1 focus:ring-[#222222] outline-none transition-all text-[#222222] placeholder-[#222222]/60"
                       placeholder="Search courses, assignments..."
                       type="text"/>

                <span class="material-symbols-outlined absolute right-3 top-2 text-[#222222] opacity-60">

                    search

                </span>

            </div>

            <!-- LOGOUT -->
            <div class="flex items-center gap-4">

                <a href="logout"
                   class="text-[#222222] font-bold hover:bg-[#222222]/5 transition-colors cursor-pointer px-4 py-2 rounded text-sm">

                    Logout

                </a>

                <img alt="User profile"
                     class="w-10 h-10 border-2 border-[#222222] object-cover"
                     src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop"/>

            </div>

        </div>

    </header>

    <!-- CONTENT -->
    <main class="flex-grow p-12 max-w-[1200px] mx-auto w-full">

        <!-- WELCOME -->
        <section class="mb-12">

            <h1 class="text-4xl font-bold mb-1">
                Student Dashboard
            </h1>

            <p class="text-[#222222] opacity-80">

                Welcome back. Review your academic progress and upcoming deadlines.

            </p>

        </section>

        <!-- METRICS -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">

            <div class="bg-white p-6 border border-[#222222]">

                <p class="text-[10px] uppercase tracking-widest text-[#222222]/60 font-semibold mb-1">

                    Enrolled Courses

                </p>

                <p class="text-3xl font-bold">
                    6
                </p>

            </div>

            <div class="bg-white p-6 border border-[#222222]">

                <p class="text-[10px] uppercase tracking-widest text-[#222222]/60 font-semibold mb-1">

                    Pending Assignments

                </p>

                <p class="text-3xl font-bold">
                    2
                </p>

            </div>

            <div class="bg-white p-6 border border-[#222222]">

                <p class="text-[10px] uppercase tracking-widest text-[#222222]/60 font-semibold mb-1">

                    Overall Progress

                </p>

                <p class="text-3xl font-bold">
                    84%
                </p>

            </div>

        </div>

        <!-- MAIN GRID -->
        <div class="grid grid-cols-12 gap-6">

            <!-- LEFT -->
            <div class="col-span-12 lg:col-span-8 space-y-12">

                <!-- COURSES -->
                <section>

                    <div class="flex items-center justify-between mb-4">

                        <h2 class="text-2xl font-semibold">
                            Course Overview
                        </h2>

                        <a href="courses"
                           class="text-xs font-bold hover:underline uppercase tracking-wider">

                            View All

                        </a>

                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                        <!-- CARD -->
                        <a href="courses"
                           class="bg-[#C2D8C4] p-6 border border-[#222222] flex flex-col justify-between h-48 group hover:bg-[#222222] hover:text-white transition-all cursor-pointer">

                            <div>

                                <div class="flex justify-between items-start mb-2">

                                    <span class="bg-[#222222] text-white text-[10px] px-2 py-1 font-semibold group-hover:bg-white group-hover:text-[#222222]">

                                        CORE MODULE

                                    </span>

                                    <span class="material-symbols-outlined group-hover:text-white">

                                        arrow_outward

                                    </span>

                                </div>

                                <h3 class="text-xl font-semibold">
                                    Advanced Database Systems
                                </h3>

                                <p class="text-sm mt-2 line-clamp-2 opacity-80">

                                    Exploring relational structures and complex query optimization.

                                </p>

                            </div>

                            <div class="flex items-center gap-2 mt-4">

                                <div class="h-1.5 flex-grow bg-[#222222]/20 overflow-hidden">

                                    <div class="h-full bg-[#222222] group-hover:bg-white w-3/4"></div>

                                </div>

                                <span class="text-[10px] font-semibold">
                                    75%
                                </span>

                            </div>

                        </a>

                        <!-- CARD -->
                        <a href="courses"
                           class="bg-[#C2D8C4] p-6 border border-[#222222] flex flex-col justify-between h-48 group hover:bg-[#222222] hover:text-white transition-all cursor-pointer">

                            <div>

                                <div class="flex justify-between items-start mb-2">

                                    <span class="bg-[#222222] text-white text-[10px] px-2 py-1 font-semibold group-hover:bg-white group-hover:text-[#222222]">

                                        TECHNICAL ELECTIVE

                                    </span>

                                    <span class="material-symbols-outlined group-hover:text-white">

                                        arrow_outward

                                    </span>

                                </div>

                                <h3 class="text-xl font-semibold">
                                    Cloud Architecture
                                </h3>

                                <p class="text-sm mt-2 line-clamp-2 opacity-80">

                                    Designing scalable infrastructure using AWS and Azure.

                                </p>

                            </div>

                            <div class="flex items-center gap-2 mt-4">

                                <div class="h-1.5 flex-grow bg-[#222222]/20 overflow-hidden">

                                    <div class="h-full bg-[#222222] group-hover:bg-white w-1/3"></div>

                                </div>

                                <span class="text-[10px] font-semibold">
                                    32%
                                </span>

                            </div>

                        </a>

                    </div>

                </section>

                <!-- SUBMISSIONS -->
                <section>

                    <h2 class="text-2xl font-semibold mb-4">
                        Submission Status
                    </h2>

                    <div class="bg-[#C2D8C4] border border-[#222222] overflow-hidden">

                        <table class="w-full text-left">

                            <thead class="bg-[#222222] text-white">

                                <tr>

                                    <th class="px-4 py-3 text-[10px] uppercase tracking-wider">
                                        Submission ID
                                    </th>

                                    <th class="px-4 py-3 text-[10px] uppercase tracking-wider">
                                        Course
                                    </th>

                                    <th class="px-4 py-3 text-[10px] uppercase tracking-wider">
                                        Date
                                    </th>

                                    <th class="px-4 py-3 text-[10px] uppercase tracking-wider">
                                        Status
                                    </th>

                                </tr>

                            </thead>

                            <tbody class="divide-y divide-[#222222]/20 bg-white/40">

                                <tr class="hover:bg-[#C2D8C4] transition-colors">

                                    <td class="px-4 py-4 text-sm font-medium">
                                        #EDU-9281
                                    </td>

                                    <td class="px-4 py-4 text-sm">
                                        Network Security
                                    </td>

                                    <td class="px-4 py-4 text-sm opacity-70">
                                        Oct 12, 2023
                                    </td>

                                    <td class="px-4 py-4">

                                        <span class="inline-flex items-center px-2 py-0.5 text-[11px] font-bold bg-emerald-100 text-emerald-800 uppercase tracking-wider">

                                            Graded

                                        </span>

                                    </td>

                                </tr>

                                <tr class="hover:bg-[#C2D8C4] transition-colors">

                                    <td class="px-4 py-4 text-sm font-medium">
                                        #EDU-9304
                                    </td>

                                    <td class="px-4 py-4 text-sm">
                                        Java Dev II
                                    </td>

                                    <td class="px-4 py-4 text-sm opacity-70">
                                        Oct 15, 2023
                                    </td>

                                    <td class="px-4 py-4">

                                        <span class="inline-flex items-center px-2 py-0.5 text-[11px] font-bold bg-amber-100 text-amber-800 uppercase tracking-wider">

                                            Pending

                                        </span>

                                    </td>

                                </tr>

                            </tbody>

                        </table>

                    </div>

                </section>

            </div>

            <!-- RIGHT -->
            <div class="col-span-12 lg:col-span-4 flex flex-col gap-6">

                <!-- ASSIGNMENTS -->
                <div class="bg-[#222222] text-white p-6">

                    <div class="flex items-center justify-between mb-4">

                        <h2 class="text-white text-xl font-semibold">
                            Assignments
                        </h2>

                        <span class="material-symbols-outlined text-emerald-200">

                            event

                        </span>

                    </div>

                    <div class="space-y-4">

                        <div class="border-l-2 border-emerald-200 pl-4 py-1">

                            <p class="text-[10px] font-bold text-emerald-200 mb-1 uppercase tracking-widest">

                                Due in 2 days

                            </p>

                            <h4 class="text-sm font-bold">
                                SQL Optimization Lab
                            </h4>

                            <p class="text-xs text-neutral-400">
                                Database Systems
                            </p>

                        </div>

                        <div class="border-l-2 border-neutral-600 pl-4 py-1">

                            <p class="text-[10px] font-bold text-neutral-400 mb-1 uppercase tracking-widest">

                                Due in 5 days

                            </p>

                            <h4 class="text-sm font-bold">
                                Lambda Function Design
                            </h4>

                            <p class="text-xs text-neutral-400">
                                Cloud Architecture
                            </p>

                        </div>

                    </div>

                    <a href="assignments"
                       class="block w-full mt-6 bg-neutral-800 py-3 text-[10px] font-bold text-emerald-200 border border-neutral-700 hover:bg-neutral-700 transition-colors uppercase tracking-widest text-center">

                        View Assignments

                    </a>

                </div>

                <!-- PERFORMANCE -->
                <div class="bg-white p-6 border border-[#222222]">

                    <h3 class="text-[#222222] text-xl font-semibold mb-4">
                        Academic Performance
                    </h3>

                    <div class="space-y-4">

                        <div>

                            <div class="flex justify-between items-center mb-1">

                                <span class="text-xs text-[#222222]/60">
                                    Attendance Rate
                                </span>

                                <span class="text-sm font-bold">
                                    98%
                                </span>

                            </div>

                            <div class="h-2 bg-[#222222]/10">

                                <div class="h-full bg-[#222222]"
                                     style="width: 98%"></div>

                            </div>

                        </div>

                        <div>

                            <div class="flex justify-between items-center mb-1">

                                <span class="text-xs text-[#222222]/60">
                                    Grade Average
                                </span>

                                <span class="text-sm font-bold">
                                    A- (92%)
                                </span>

                            </div>

                            <div class="h-2 bg-[#222222]/10">

                                <div class="h-full bg-[#222222]"
                                     style="width: 92%"></div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </main>

</div>

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