<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html class="light" lang="en">

<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>Assignment Submission</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
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

.sidebar-active {
    font-variation-settings: 'FILL' 1;
}

body {
    font-family: 'Inter', sans-serif;
}

</style>

<script>

tailwind.config = {

    darkMode: "class",

    theme: {

        extend: {

            colors: {

                background: "#fbf9f6",
                primary: "#4f6353",
                "primary-container": "#c2d8c4",
                surface: "#ffffff",
                outline: "#d1d5db",
                secondary: "#5f5e5e"

            }

        }

    }

}

</script>

</head>

<body class="bg-background text-[#1b1c1a] antialiased">

<!-- SIDEBAR -->
<aside class="fixed left-0 top-0 h-full w-[260px] bg-neutral-900 flex flex-col py-6 z-50">

    <!-- LOGO -->
    <div class="px-6 mb-12">

        <h1 class="text-2xl font-bold text-white tracking-tight">

            EduTech IT

        </h1>

        <p class="text-xs text-neutral-400 uppercase tracking-widest mt-1">

            Institutional Platform

        </p>

    </div>

    <!-- NAVIGATION -->
    <nav class="flex-1 px-2 space-y-1">

        <a class="flex items-center gap-3 px-4 py-3 text-neutral-400 hover:text-white hover:bg-neutral-800 transition-all"
           href="student-dashboard">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            <span class="font-medium text-sm">
                Dashboard
            </span>

        </a>

        <a class="flex items-center gap-3 px-4 py-3 text-neutral-400 hover:text-white hover:bg-neutral-800 transition-all"
           href="courses">

            <span class="material-symbols-outlined">
                school
            </span>

            <span class="font-medium text-sm">
                Courses
            </span>

        </a>

        <a class="flex items-center gap-3 px-4 py-3 text-neutral-400 hover:text-white hover:bg-neutral-800 transition-all"
           href="assignments">

            <span class="material-symbols-outlined">
                assignment
            </span>

            <span class="font-medium text-sm">
                Assignments
            </span>

        </a>

        <!-- ACTIVE -->
        <a class="flex items-center gap-3 px-4 py-3 bg-neutral-800 text-emerald-200 border-l-4 border-emerald-200"
           href="submission">

            <span class="material-symbols-outlined sidebar-active">
                upload_file
            </span>

            <span class="font-medium text-sm">
                Submission
            </span>

        </a>

    </nav>

    <!-- LOGOUT -->
    <div class="mt-auto px-2">

        <a class="flex items-center gap-3 px-4 py-3 text-neutral-400 hover:text-white hover:bg-neutral-800 transition-all"
           href="logout">

            <span class="material-symbols-outlined">
                logout
            </span>

            <span class="font-medium text-sm">
                Logout
            </span>

        </a>

    </div>

</aside>

<!-- MAIN -->
<div class="ml-[260px] min-h-screen flex flex-col">

    <!-- TOPBAR -->
    <header class="sticky top-0 z-40 bg-white border-b border-gray-200">

        <div class="h-16 px-8 max-w-[1200px] mx-auto flex items-center justify-between">

            <div class="flex items-center gap-4">

                <a href="assignments"
                   class="p-2 hover:bg-gray-100 rounded-full transition-all">

                    <span class="material-symbols-outlined">
                        arrow_back
                    </span>

                </a>

                <h2 class="text-xl font-bold">

                    Assignment Submission

                </h2>

            </div>

            <a href="assignments"
               class="text-sm font-semibold text-gray-600 hover:text-black transition-all">

                Back to Assignments

            </a>

        </div>

    </header>

    <!-- PAGE CONTENT -->
    <main class="flex-1 w-full max-w-[1200px] mx-auto px-8 py-12">

        <div class="max-w-4xl mx-auto">

            <!-- SUBMISSION CARD -->
            <div class="bg-white rounded-2xl border border-gray-200 overflow-hidden shadow-sm">

                <!-- HEADER -->
                <div class="p-10 border-b border-gray-200 bg-white">

                    <h1 class="text-4xl font-bold mb-3">

                        Upload Coursework

                    </h1>

                    <p class="text-secondary text-base max-w-2xl">

                        Submit your final coursework securely through the institutional submission portal.

                    </p>

                </div>

                <!-- CONTENT -->
                <div class="p-10 grid grid-cols-1 lg:grid-cols-3 gap-10">

                    <!-- LEFT -->
                    <div class="lg:col-span-2 space-y-8">

                        <form action="submit-assignment"
                              method="post"
                              enctype="multipart/form-data"
                              class="space-y-8">

                            <!-- ASSIGNMENT ID -->
                            <input type="hidden"
                                   name="assignmentId"
                                   value="${assignmentId}"/>

                            <!-- FILE UPLOAD -->
                            <div class="space-y-3">

                                <label class="text-xs uppercase tracking-widest font-semibold text-gray-500">

                                    Coursework Files

                                </label>

                                <div class="relative">

                                    <div class="border-2 border-dashed border-gray-300 hover:border-primary transition-all bg-[#fbf9f6] rounded-2xl p-12 flex flex-col items-center justify-center text-center space-y-5">

                                        <div class="w-16 h-16 rounded-full bg-primary-container flex items-center justify-center">

                                            <span class="material-symbols-outlined text-primary text-4xl">
                                                cloud_upload
                                            </span>

                                        </div>

                                        <div>

                                            <p class="text-xl font-semibold">

                                                Drag & Drop Files

                                            </p>

                                            <p class="text-sm text-gray-500 mt-2">

                                                Maximum upload size: 128MB

                                            </p>

                                        </div>

                                        <div class="bg-neutral-900 text-white px-6 py-3 rounded-xl font-semibold">

                                            Browse Files

                                        </div>

                                    </div>

                                    <input class="absolute inset-0 w-full h-full opacity-0 cursor-pointer"
                                           type="file"
                                           name="file"
                                           required/>

                                </div>

                            </div>

                            <!-- CHECKBOX -->
                            <div class="flex items-start gap-4 bg-primary-container/30 p-5 rounded-xl">

                                <input id="integrity"
                                       type="checkbox"
                                       required
                                       class="mt-1 w-5 h-5 accent-[#4f6353]"/>

                                <label for="integrity"
                                       class="text-sm text-[#384b3c] leading-relaxed">

                                    I confirm that this submission is my original work and complies with the university academic integrity policy.

                                </label>

                            </div>

                            <!-- ACTIONS -->
                            <div class="flex justify-end gap-4 pt-2">

                                <a href="assignments"
                                   class="px-6 py-3 border border-gray-300 rounded-xl font-semibold hover:bg-gray-100 transition-all">

                                    Cancel

                                </a>

                                <button type="submit"
                                        class="bg-primary text-white px-8 py-3 rounded-xl font-semibold hover:bg-black transition-all flex items-center gap-3">

                                    Submit Assignment

                                    <span class="material-symbols-outlined">
                                        send
                                    </span>

                                </button>

                            </div>

                        </form>

                    </div>

                    <!-- RIGHT -->
                    <div class="space-y-6">

                        <!-- DEADLINE -->
                        <div class="bg-neutral-900 text-white rounded-2xl p-6">

                            <div class="flex items-center gap-3 mb-4">

                                <span class="material-symbols-outlined text-emerald-200">
                                    schedule
                                </span>

                                <span class="text-xs uppercase tracking-widest text-neutral-400 font-semibold">

                                    Deadline Information

                                </span>

                            </div>

                            <h2 class="text-3xl font-bold text-emerald-200 mb-2">

                                14 Oct, 23:59

                            </h2>

                            <p class="text-sm text-neutral-400 mb-6">

                                Ensure submission before the deadline.

                            </p>

                            <div class="w-full h-2 rounded-full bg-neutral-700 overflow-hidden">

                                <div class="h-full w-[65%] bg-emerald-200 rounded-full"></div>

                            </div>

                        </div>

                        <!-- GUIDELINES -->
                        <div class="bg-[#f3f4f6] border border-gray-200 rounded-2xl p-6 space-y-5">

                            <h3 class="text-lg font-bold">

                                Submission Guidelines

                            </h3>

                            <ul class="space-y-4">

                                <li class="flex gap-3">

                                    <span class="material-symbols-outlined text-primary">
                                        check_circle
                                    </span>

                                    <p class="text-sm text-secondary">

                                        Include all required coursework files.

                                    </p>

                                </li>

                                <li class="flex gap-3">

                                    <span class="material-symbols-outlined text-primary">
                                        check_circle
                                    </span>

                                    <p class="text-sm text-secondary">

                                        Compress projects into ZIP format if necessary.

                                    </p>

                                </li>

                                <li class="flex gap-3">

                                    <span class="material-symbols-outlined text-primary">
                                        check_circle
                                    </span>

                                    <p class="text-sm text-secondary">

                                        Ensure documentation is included.

                                    </p>

                                </li>

                            </ul>

                        </div>

                        <!-- FORMATS -->
                        <div class="space-y-3">

                            <h3 class="text-xs uppercase tracking-widest font-semibold text-gray-500">

                                Supported Formats

                            </h3>

                            <div class="flex flex-wrap gap-2">

                                <span class="px-4 py-2 bg-gray-200 rounded-lg text-sm font-medium">
                                    PDF
                                </span>

                                <span class="px-4 py-2 bg-gray-200 rounded-lg text-sm font-medium">
                                    DOCX
                                </span>

                                <span class="px-4 py-2 bg-gray-200 rounded-lg text-sm font-medium">
                                    ZIP
                                </span>

                                <span class="px-4 py-2 bg-gray-200 rounded-lg text-sm font-medium">
                                    SQL
                                </span>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </main>

</div>

<!-- SUCCESS POPUP -->
<c:if test="${not empty sessionScope.successMessage}">

    <div id="successPopup"
         class="fixed top-6 right-6 bg-emerald-500 text-white px-6 py-4 rounded-xl shadow-2xl z-[9999] flex items-center gap-3">

        <span class="material-symbols-outlined">
            check_circle
        </span>

        <span class="font-medium">
            ${sessionScope.successMessage}
        </span>

    </div>

    <script>

        setTimeout(() => {

            document.getElementById("successPopup")
                    .style.display = "none";

        }, 3000);

    </script>

    <c:remove var="successMessage"
              scope="session"/>

</c:if>

<!-- ERROR POPUP -->
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