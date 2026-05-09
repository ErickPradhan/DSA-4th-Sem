<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html class="light" lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>EduTech IT - Admin Dashboard</title>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet" />

    <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
        rel="stylesheet" />

    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "background": "#fbf9f6",
                        "surface": "#ffffff",
                        "primary": "#4f6353",
                        "primary-container": "#c2d8c4",
                        "secondary": "#5f5e5e",
                        "outline": "#d1d5db",
                        "surface-container": "#f3f4f6",
                        "surface-container-high": "#e5e7eb"
                    }
                }
            }
        }
    </script>

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24;
        }

        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
        }
    </style>

</head>

<body class="bg-background text-gray-900">

    <!-- SIDEBAR -->
    <nav
        class="bg-neutral-900 fixed left-0 top-0 h-full w-[260px] border-r border-neutral-800 flex flex-col overflow-y-auto z-50">

        <!-- LOGO -->
        <div class="p-6 flex flex-col gap-1 mb-4">

            <span class="text-lg font-bold text-white">
                EduTech IT
            </span>

            <span class="text-xs uppercase tracking-widest text-neutral-500">
                Institutional Platform
            </span>

        </div>

        <!-- NAVIGATION -->
        <div class="flex-grow">

            <a class="flex items-center gap-3 w-full bg-neutral-800 text-emerald-200 border-l-4 border-emerald-200 py-3 px-4 text-sm font-medium"
                href="admin-dashboard">

                <span class="material-symbols-outlined">
                    dashboard
                </span>

                Dashboard
            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-neutral-800 transition"
                href="courses">

                <span class="material-symbols-outlined">
                    school
                </span>

                Courses
            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-neutral-800 transition"
                href="assignments">

                <span class="material-symbols-outlined">
                    assignment
                </span>

                Assignments
            </a>

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-neutral-800 transition"
                href="submissions">

                <span class="material-symbols-outlined">
                    upload_file
                </span>

                Submissions
            </a>

        </div>

        <!-- FOOTER -->
        <div class="mt-auto border-t border-neutral-800 py-4">

            <a class="flex items-center gap-3 w-full text-neutral-400 py-3 px-4 hover:text-white hover:bg-neutral-800 transition"
                href="logout">

                <span class="material-symbols-outlined">
                    logout
                </span>

                Logout
            </a>

        </div>

    </nav>

    <!-- MAIN CONTENT -->
    <div class="ml-[260px] min-h-screen flex flex-col">

        <!-- TOPBAR -->
        <header class="bg-white border-b h-16 sticky top-0 flex items-center justify-between px-8 z-40">

            <div>

                <h1 class="text-2xl font-black text-neutral-900">
                    Admin Dashboard
                </h1>

            </div>

            <div class="flex items-center gap-4">

                <div class="text-right">

                    <p class="text-sm text-gray-500">
                        Welcome Back
                    </p>

                    <p class="font-semibold">
                        ${sessionScope.user.name}
                    </p>

                </div>

                <a href="logout"
                    class="bg-black text-white px-4 py-2 rounded hover:bg-gray-800 transition text-sm font-semibold">

                    Logout

                </a>

            </div>

        </header>

        <!-- MAIN -->
        <main class="flex-1 p-8 max-w-[1400px] mx-auto w-full">

            <!-- HERO -->
            <div class="mb-10">

                <h1 class="text-4xl font-bold mb-2">
                    Institutional Overview
                </h1>

                <p class="text-gray-600 text-base">
                    Monitor platform performance, academic activities and student engagement.
                </p>

            </div>

            <!-- STATS -->
            <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6 mb-10">

                <!-- STUDENTS -->
                <div class="bg-white border border-gray-200 p-6 rounded-xl shadow-sm">

                    <div class="flex justify-between items-start mb-4">

                        <span class="uppercase tracking-wider text-sm font-semibold text-gray-500">
                            Students
                        </span>

                        <span class="material-symbols-outlined text-gray-500">
                            group
                        </span>

                    </div>

                    <h2 class="text-4xl font-bold text-gray-900 mb-2">
                        ${totalStudents}
                    </h2>

                    <p class="text-sm text-gray-500">
                        Registered learners
                    </p>

                </div>

                <!-- COURSES -->
                <div class="bg-white border border-gray-200 p-6 rounded-xl shadow-sm">

                    <div class="flex justify-between items-start mb-4">

                        <span class="uppercase tracking-wider text-sm font-semibold text-gray-500">
                            Courses
                        </span>

                        <span class="material-symbols-outlined text-gray-500">
                            school
                        </span>

                    </div>

                    <h2 class="text-4xl font-bold text-gray-900 mb-2">
                        ${totalCourses}
                    </h2>

                    <p class="text-sm text-gray-500">
                        Active academic courses
                    </p>

                </div>

                <!-- ASSIGNMENTS -->
                <div class="bg-white border border-gray-200 p-6 rounded-xl shadow-sm">

                    <div class="flex justify-between items-start mb-4">

                        <span class="uppercase tracking-wider text-sm font-semibold text-gray-500">
                            Assignments
                        </span>

                        <span class="material-symbols-outlined text-gray-500">
                            assignment
                        </span>

                    </div>

                    <h2 class="text-4xl font-bold text-gray-900 mb-2">
                        ${totalAssignments}
                    </h2>

                    <p class="text-sm text-gray-500">
                        Available coursework
                    </p>

                </div>

                <!-- SUBMISSIONS -->
                <div class="bg-green-100 border border-green-200 p-6 rounded-xl shadow-sm">

                    <div class="flex justify-between items-start mb-4">

                        <span class="uppercase tracking-wider text-sm font-semibold text-green-800">
                            Submissions
                        </span>

                        <span class="material-symbols-outlined text-green-800">
                            upload_file
                        </span>

                    </div>

                    <h2 class="text-4xl font-bold text-green-900 mb-2">
                        ${totalSubmissions}
                    </h2>

                    <p class="text-sm text-green-700">
                        Student uploads received
                    </p>

                </div>

            </div>

            <!-- QUICK ACTIONS -->
            <div class="mb-10">

                <h2 class="text-2xl font-bold mb-6">
                    Quick Actions
                </h2>

                <div class="flex flex-wrap gap-4">

                    <a href="add-course"
                        class="bg-black text-white px-5 py-3 rounded-lg font-semibold hover:bg-gray-800 transition">

                        Add Course

                    </a>

                    <a href="courses"
                        class="bg-gray-200 text-black px-5 py-3 rounded-lg font-semibold hover:bg-gray-300 transition">

                        View Courses

                    </a>

                    <a href="add-assignment"
                        class="bg-emerald-600 text-white px-5 py-3 rounded-lg font-semibold hover:bg-emerald-700 transition">

                        Add Assignment

                    </a>

                    <a href="submissions"
                        class="bg-gray-200 text-black px-5 py-3 rounded-lg font-semibold hover:bg-gray-300 transition">

                        View Submissions

                    </a>

                </div>

            </div>

            <!-- RECENT SUBMISSIONS -->
            <section class="bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden">

                <div class="p-6 border-b">

                    <h2 class="text-2xl font-bold mb-1">
                        Recent Submission Activity
                    </h2>

                    <p class="text-sm text-gray-500">
                        Latest assignment uploads from students
                    </p>

                </div>

                <div class="overflow-x-auto">

                    <table class="w-full">

                        <thead class="bg-gray-50 border-b">

                            <tr>

                                <th class="text-left px-6 py-4 text-sm font-semibold text-gray-600">
                                    Student
                                </th>

                                <th class="text-left px-6 py-4 text-sm font-semibold text-gray-600">
                                    Course
                                </th>

                                <th class="text-left px-6 py-4 text-sm font-semibold text-gray-600">
                                    Assignment
                                </th>

                                <th class="text-left px-6 py-4 text-sm font-semibold text-gray-600">
                                    Submission Date
                                </th>

                            </tr>

                        </thead>

                        <tbody>

                            <c:forEach var="submission" items="${recentSubmissions}">

                                <tr class="border-b hover:bg-gray-50 transition">

                                    <td class="px-6 py-4 font-medium">
                                        ${submission.studentName}
                                    </td>

                                    <td class="px-6 py-4 text-gray-600">
                                        ${submission.courseTitle}
                                    </td>

                                    <td class="px-6 py-4 text-gray-600">
                                        ${submission.assignmentTitle}
                                    </td>

                                    <td class="px-6 py-4 text-gray-500">
                                        ${submission.submissionDate}
                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </section>

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