<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html class="light" lang="en">

<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>EduTech IT - Submission Management</title>

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

    vertical-align: middle;
}

body {
    font-family: 'Inter', sans-serif;
}

</style>

</head>

<body class="bg-[#fbf9f6] text-[#1b1c1a] min-h-screen flex">

<!-- SIDEBAR -->
<aside class="bg-neutral-900 fixed left-0 top-0 h-full w-[260px] border-r border-neutral-800 flex flex-col z-50">

    <div class="p-6">

        <!-- LOGO -->
        <div class="flex items-center gap-3 mb-12">

            <div class="w-10 h-10 bg-emerald-200 rounded-xl flex items-center justify-center">

                <span class="material-symbols-outlined text-neutral-900"
                      style="font-variation-settings: 'FILL' 1;">

                    school

                </span>

            </div>

            <div>

                <h1 class="text-lg font-bold text-neutral-50 leading-tight">

                    EduTech IT

                </h1>

                <p class="text-xs text-neutral-400 uppercase tracking-widest font-semibold">

                    Institutional Platform

                </p>

            </div>

        </div>

        <!-- NAVIGATION -->
        <nav class="flex flex-col gap-1">

            <!-- ADMIN -->
            <c:if test="${user.role == 'admin'}">

                <a href="admin-dashboard"
                   class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

                    <span class="material-symbols-outlined">
                        dashboard
                    </span>

                    <span class="text-sm font-medium">
                        Dashboard
                    </span>

                </a>

                <a href="courses"
                   class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

                    <span class="material-symbols-outlined">
                        school
                    </span>

                    <span class="text-sm font-medium">
                        Courses
                    </span>

                </a>

                <a href="assignments"
                   class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

                    <span class="material-symbols-outlined">
                        assignment
                    </span>

                    <span class="text-sm font-medium">
                        Assignments
                    </span>

                </a>

                <!-- ACTIVE -->
                <a href="submissions"
                   class="flex items-center gap-3 w-full bg-neutral-800 text-emerald-200 border-l-4 border-emerald-200 py-3 px-4">

                    <span class="material-symbols-outlined"
                          style="font-variation-settings: 'FILL' 1;">

                        upload_file

                    </span>

                    <span class="text-sm font-medium">
                        Submissions
                    </span>

                </a>

            </c:if>

            <!-- STUDENT -->
            <c:if test="${user.role == 'student'}">

                <a href="student-dashboard"
                   class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

                    <span class="material-symbols-outlined">
                        dashboard
                    </span>

                    <span class="text-sm font-medium">
                        Dashboard
                    </span>

                </a>

                <a href="courses"
                   class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

                    <span class="material-symbols-outlined">
                        school
                    </span>

                    <span class="text-sm font-medium">
                        Courses
                    </span>

                </a>

                <a href="assignments"
                   class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

                    <span class="material-symbols-outlined">
                        assignment
                    </span>

                    <span class="text-sm font-medium">
                        Assignments
                    </span>

                </a>

            </c:if>

        </nav>

    </div>

    <!-- LOGOUT -->
    <div class="mt-auto p-6 border-t border-neutral-800">

        <a href="logout"
           class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-white transition-all">

            <span class="material-symbols-outlined">
                logout
            </span>

            <span class="text-sm font-medium">
                Logout
            </span>

        </a>

    </div>

</aside>

<!-- MAIN CONTENT -->
<div class="ml-[260px] flex-1 flex flex-col min-w-0">

    <!-- TOP BAR -->
    <header class="w-full h-16 border-b border-neutral-200 bg-white sticky top-0 z-40 flex justify-between items-center px-8">

        <div>

            <h2 class="text-xl font-black text-neutral-900">
                EduTech IT
            </h2>

        </div>

        <div class="flex items-center gap-6">

            <div class="relative hidden md:block">

                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-neutral-400">
                    search
                </span>

                <input class="bg-neutral-100 border-none rounded-full pl-10 pr-4 py-2 w-64 text-sm focus:ring-2 focus:ring-[#4f6353] focus:outline-none"
                       placeholder="Search submissions..."
                       type="text"/>

            </div>

            <a href="logout"
               class="flex items-center gap-2 px-4 py-2 bg-neutral-900 text-white rounded hover:bg-black transition-all">

                <span class="material-symbols-outlined text-[18px]">
                    logout
                </span>

                <span class="text-sm font-medium">
                    Logout
                </span>

            </a>

        </div>

    </header>

    <!-- PAGE CONTENT -->
    <main class="p-6 max-w-[1440px] mx-auto w-full grid grid-cols-12 gap-6">

        <!-- MAIN -->
        <div class="col-span-12 xl:col-span-9 space-y-6">

            <!-- PAGE HEADER -->
            <div>

                <h1 class="text-4xl font-bold text-neutral-900">

                    Submission Management

                </h1>

                <p class="text-neutral-500 mt-2">

                    Review and manage student coursework submissions across all active courses.

                </p>

            </div>

            <!-- METRICS -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">

                <!-- TOTAL -->
                <div class="bg-[#c2d8c4] p-5 rounded-xl border border-[#bed9c0]">

                    <p class="text-xs uppercase font-bold text-neutral-600 mb-2">
                        Total Submissions
                    </p>

                    <h2 class="text-4xl font-black text-neutral-900">

                        ${submissions.size()}

                    </h2>

                </div>

                <!-- PENDING -->
                <div class="bg-white p-5 rounded-xl border border-neutral-200">

                    <p class="text-xs uppercase font-bold text-neutral-500 mb-2">
                        Pending Reviews
                    </p>

                    <h2 class="text-4xl font-black text-neutral-900">

                        ${submissions.size()}

                    </h2>

                </div>

                <!-- RECENT -->
                <div class="bg-white p-5 rounded-xl border border-neutral-200">

                    <p class="text-xs uppercase font-bold text-neutral-500 mb-2">
                        Recent Uploads
                    </p>

                    <h2 class="text-4xl font-black text-neutral-900">

                        ${submissions.size()}

                    </h2>

                </div>

                <!-- REVIEWED -->
                <div class="bg-white p-5 rounded-xl border border-neutral-200">

                    <p class="text-xs uppercase font-bold text-neutral-500 mb-2">
                        Reviewed
                    </p>

                    <h2 class="text-4xl font-black text-neutral-900">

                        ${submissions.size()}

                    </h2>

                </div>

            </div>

            <!-- TABLE -->
            <section class="bg-white rounded-xl border border-neutral-200 overflow-hidden">

                <div class="overflow-x-auto">

                    <table class="w-full text-left border-collapse">

                        <thead>

                            <tr class="bg-neutral-900 text-white">

                                <th class="px-6 py-4 text-xs uppercase tracking-widest">
                                    ID
                                </th>

                                <th class="px-6 py-4 text-xs uppercase tracking-widest">
                                    Student
                                </th>

                                <th class="px-6 py-4 text-xs uppercase tracking-widest">
                                    Course & Assignment
                                </th>

                                <th class="px-6 py-4 text-xs uppercase tracking-widest">
                                    Date
                                </th>

                                <th class="px-6 py-4 text-xs uppercase tracking-widest text-center">
                                    Status
                                </th>

                                <th class="px-6 py-4 text-xs uppercase tracking-widest text-right">
                                    Actions
                                </th>

                            </tr>

                        </thead>

                        <tbody class="divide-y divide-neutral-200">

                            <c:choose>

                                <c:when test="${not empty submissions}">

                                    <c:forEach var="s"
                                               items="${submissions}">

                                        <tr class="hover:bg-neutral-50 transition-all">

                                            <!-- ID -->
                                            <td class="px-6 py-5 text-sm font-bold text-neutral-500">

                                                #SUB-${s.id}

                                            </td>

                                            <!-- STUDENT -->
                                            <td class="px-6 py-5">

                                                <div class="flex items-center gap-3">

                                                    <div class="w-8 h-8 rounded-full bg-neutral-200 flex items-center justify-center font-bold text-xs">

                                                        ${s.studentName.substring(0,1)}

                                                    </div>

                                                    <div>

                                                        <p class="text-sm font-bold text-neutral-900">

                                                            ${s.studentName}

                                                        </p>

                                                    </div>

                                                </div>

                                            </td>

                                            <!-- COURSE -->
                                            <td class="px-6 py-5">

                                                <p class="text-sm font-bold text-neutral-900">

                                                    ${s.assignmentTitle}

                                                </p>

                                                <p class="text-xs text-neutral-500">

                                                    ${s.courseTitle}

                                                </p>

                                            </td>

                                            <!-- DATE -->
                                            <td class="px-6 py-5 text-sm text-neutral-700">

                                                ${s.submissionDate}

                                            </td>

                                            <!-- STATUS -->
                                            <td class="px-6 py-5 text-center">

                                                <span class="px-3 py-1 bg-[#ceead0] text-[#47604c] rounded-full text-[11px] font-bold uppercase">

                                                    Submitted

                                                </span>

                                            </td>

                                            <!-- ACTIONS -->
                                            <td class="px-6 py-5 text-right">

                                                <div class="flex justify-end gap-2">

                                                    <!-- VIEW -->
                                                    <a href="uploads/${s.filePath}"
                                                       target="_blank"
                                                       class="p-2 hover:bg-neutral-200 rounded-lg transition-all">

                                                        <span class="material-symbols-outlined text-[20px] text-neutral-600">

                                                            visibility

                                                        </span>

                                                    </a>

                                                    <!-- DOWNLOAD -->
                                                    <a href="uploads/${s.filePath}"
                                                       download
                                                       class="p-2 hover:bg-neutral-200 rounded-lg transition-all">

                                                        <span class="material-symbols-outlined text-[20px] text-[#4f6353]">

                                                            download

                                                        </span>

                                                    </a>

                                                </div>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>

                                <c:otherwise>

                                    <tr>

                                        <td colspan="6"
                                            class="text-center py-10 text-neutral-500">

                                            No submissions found.

                                        </td>

                                    </tr>

                                </c:otherwise>

                            </c:choose>

                        </tbody>

                    </table>

                </div>

            </section>

        </div>

        <!-- RIGHT PANEL -->
        <aside class="col-span-12 xl:col-span-3 space-y-6">

            <!-- RECENT ACTIVITY -->
            <section class="bg-white p-5 rounded-xl border border-neutral-200">

                <h3 class="text-xl font-bold mb-4">

                    Recent Activity

                </h3>

                <div class="space-y-4">

                    <c:forEach var="s"
                               items="${submissions}"
                               begin="0"
                               end="2">

                        <div class="border-b border-neutral-100 pb-3">

                            <p class="text-sm font-bold">

                                ${s.studentName} submitted

                            </p>

                            <p class="text-xs text-neutral-500 mt-1">

                                ${s.assignmentTitle}

                            </p>

                        </div>

                    </c:forEach>

                </div>

            </section>

        </aside>

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