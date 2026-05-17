<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<title>EduTech IT LMS</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;900&display=swap"
      rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"/>

<script>

tailwind.config = {
    darkMode: "class",
    theme: {
        extend: {
            colors: {
                "inverse-surface": "#30312f",
                "on-secondary-fixed-variant": "#474746",
                "on-primary-fixed-variant": "#384b3c",
                "on-primary": "#ffffff",
                "outline-variant": "#c3c8c1",
                "surface-container": "#efeeeb",
                "primary-fixed": "#d2e8d4",
                "on-surface-variant": "#434843",
                "primary-container": "#c2d8c4",
                "surface-container-high": "#e9e8e5",
                "on-surface": "#1b1c1a",
                "surface": "#fbf9f6",
                "outline": "#737872",
                "secondary": "#5f5e5e",
                "tertiary": "#4c6450",
                "primary": "#4f6353",
                "background": "#fbf9f6"
            },

            spacing: {
                "sidebar_width": "260px",
                "max_width": "1200px"
            }
        }
    }
}

</script>

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

<body class="text-on-surface">

<div class="flex min-h-screen w-full overflow-x-hidden">

    <!-- SIDEBAR -->
    <aside class="fixed left-0 top-0 h-full w-[260px] bg-inverse-surface text-on-primary flex flex-col z-50">

        <!-- LOGO -->
        <div class="p-6 flex items-center gap-3 border-b border-[#474746]">

            <div class="size-10 bg-primary-container rounded-full overflow-hidden flex items-center justify-center">

                <span class="material-symbols-outlined text-[#384b3c]"
                      style="font-variation-settings: 'FILL' 1;">

                    school

                </span>

            </div>

            <div class="flex flex-col">

                <h1 class="text-base font-bold leading-none">
                    EduTech IT
                </h1>

                <p class="text-[10px] uppercase tracking-widest text-outline-variant mt-1">
                    Learning Management System
                </p>

            </div>

        </div>

        <!-- NAVIGATION -->
        <nav class="flex-1 px-4 py-6 flex flex-col gap-2">

            <!-- DASHBOARD -->
            <a href="${sessionScope.user.role == 'admin' ? 'admin-dashboard' : 'student-dashboard'}"
               class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer
               ${param.activePage == 'dashboard'
               ? 'bg-primary text-on-primary shadow-xl scale-[1.03]'
               : 'text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1'}">

                <span class="material-symbols-outlined"
                      style="font-variation-settings: 'FILL' 1;">

                    dashboard

                </span>

                <p class="text-sm font-medium">
                    Dashboard
                </p>

            </a>

            <!-- COURSES -->
            <a href="courses"
               class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer
               ${param.activePage == 'courses'
               ? 'bg-primary text-on-primary shadow-xl scale-[1.03]'
               : 'text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1'}">

                <span class="material-symbols-outlined">
                    menu_book
                </span>

                <p class="text-sm font-medium">
                    Courses
                </p>

            </a>

            <!-- ADMIN NAVIGATION -->
            <c:if test="${sessionScope.user.role == 'admin'}">

                <!-- ASSIGNMENTS -->
                <a href="assignments"
                   class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer
                   ${param.activePage == 'assignments'
                   ? 'bg-primary text-on-primary shadow-xl scale-[1.03]'
                   : 'text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1'}">

                    <span class="material-symbols-outlined">
                        assignment
                    </span>

                    <p class="text-sm font-medium">
                        Assignments
                    </p>

                </a>

                <!-- SUBMISSIONS -->
                <a href="student-submissions"
                   class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer
                   ${param.activePage == 'submissions'
                   ? 'bg-primary text-on-primary shadow-xl scale-[1.03]'
                   : 'text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1'}">

                    <span class="material-symbols-outlined">
                        upload_file
                    </span>

                    <p class="text-sm font-medium">
                        Submissions
                    </p>

                </a>

            </c:if>

            <!-- STUDENT NAVIGATION -->
            <c:if test="${sessionScope.user.role == 'student'}">

                <!-- ASSIGNMENTS -->
                <a href="submission?assignment_id=${dashboardAssignments[0].id}"
                   class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer
                   ${param.activePage == 'assignments'
                   ? 'bg-primary text-on-primary shadow-xl scale-[1.03]'
                   : 'text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1'}">

                    <span class="material-symbols-outlined">

                        assignment

                    </span>

                    <p class="text-sm font-medium">

                        Assignments

                    </p>

                </a>

                <!-- SUBMISSIONS -->
                <a href="submission"
                   class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer
                   ${param.activePage == 'submissions'
                   ? 'bg-primary text-on-primary shadow-xl scale-[1.03]'
                   : 'text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1'}">

                    <span class="material-symbols-outlined">

                        upload_file

                    </span>

                    <p class="text-sm font-medium">

                        Submissions

                    </p>

                </a>

            </c:if>

            <!-- SETTINGS -->
            <div class="mt-auto pt-6 border-t border-[#474746]">

                <a href="settings"
                   class="flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 cursor-pointer text-outline-variant hover:text-on-primary hover:bg-[#474746] hover:translate-x-1">

                    <span class="material-symbols-outlined">
                        settings
                    </span>

                    <p class="text-sm font-medium">
                        Settings
                    </p>

                </a>

            </div>

        </nav>

        <!-- PROFILE -->
        <div class="p-6 border-t border-[#474746]">

            <div class="flex items-center gap-3">

                <div class="size-10 rounded-full bg-primary-container flex items-center justify-center font-bold text-[#384b3c]">

                    ${sessionScope.user.name.substring(0,1)}

                </div>

                <div class="flex-1">

                    <p class="text-sm font-bold">

                        ${sessionScope.user.name}

                    </p>

                    <p class="text-[10px] uppercase tracking-widest text-outline-variant mt-1">

                        ${sessionScope.user.role}

                    </p>

                </div>

                <a href="logout"
                   class="text-outline-variant hover:text-white transition-colors duration-200">

                    <span class="material-symbols-outlined">
                        logout
                    </span>

                </a>

            </div>

        </div>

    </aside>

    <!-- MAIN -->
    <main class="flex-1 ml-[260px] min-h-screen flex flex-col">

        <!-- TOPBAR -->
        <header class="h-16 bg-surface border-b border-outline-variant px-6 flex items-center justify-between sticky top-0 z-40">

            <div class="flex items-center gap-6 flex-1">

                <div class="max-w-md w-full relative">

                    <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline">

                        search

                    </span>

                    <input
                        type="text"
                        placeholder="Search courses, assignments, or students..."
                        class="w-full bg-[#f5f3f1] border border-outline-variant rounded-lg pl-10 pr-4 py-2 text-sm focus:ring-1 focus:ring-primary focus:border-primary outline-none"/>

                </div>

            </div>

            <div class="flex items-center gap-4">

                <button class="p-2 text-on-surface-variant hover:bg-surface-container rounded-full relative transition-all duration-200">

                    <span class="material-symbols-outlined">

                        notifications

                    </span>

                    <span class="absolute top-2 right-2 size-2 bg-red-500 rounded-full border-2 border-surface"></span>

                </button>

            </div>

        </header>

        <div class="p-6 w-full">

            <jsp:include page="${param.contentPage}" />

        </div>

    </main>

</div>

<!-- INLINE EDITING SCRIPT -->
<script>

function enableEdit(courseId) {

    const row =
        document.getElementById(
            'course-row-' + courseId
        );

    if (!row) return;

    row.querySelectorAll('.display-mode')
       .forEach(function(el) {
           el.classList.add('hidden');
       });

    row.querySelectorAll('.edit-mode')
       .forEach(function(el) {
           el.classList.remove('hidden');
       });
}

function cancelEdit(courseId) {

    const row =
        document.getElementById(
            'course-row-' + courseId
        );

    if (!row) return;

    row.querySelectorAll('.edit-mode')
       .forEach(function(el) {
           el.classList.add('hidden');
       });

    row.querySelectorAll('.display-mode')
       .forEach(function(el) {
           el.classList.remove('hidden');
       });
}

function saveCourse(courseId) {

    const row =
        document.getElementById(
            'course-row-' + courseId
        );

    const title =
        row.querySelector('input[name=\"title\"]').value;

    const category =
        row.querySelector('select[name=\"category\"]').value;

    const instructor =
        row.querySelector('input[name=\"instructor\"]').value;

    const status =
        row.querySelector('select[name=\"status\"]').value;

    fetch(window.location.origin + '/CCN/edit-course', {

        method: 'POST',

        headers: {
            'Content-Type':
                'application/x-www-form-urlencoded'
        },

        body:
            'id=' + encodeURIComponent(courseId) +
            '&title=' + encodeURIComponent(title) +
            '&category=' + encodeURIComponent(category) +
            '&instructor=' + encodeURIComponent(instructor) +
            '&status=' + encodeURIComponent(status)

    })

    .then(response => {

        if (response.ok) {

            location.reload();

        } else {

            alert('Failed to update course.');
        }
    })

    .catch(error => {

        console.error(error);

        alert('Something went wrong.');
    });
}

function deleteCourse(courseId) {

    const confirmDelete =
        confirm(
            'Are you sure you want to delete this course?'
        );

    if (!confirmDelete) {
        return;
    }

    fetch('${pageContext.request.contextPath}/delete-course', {

        method: 'POST',

        headers: {
            'Content-Type':
                'application/x-www-form-urlencoded'
        },

        body:
            'id=' + encodeURIComponent(courseId)

    })

    .then(response => {

        if (response.ok) {

            const row =
                document.getElementById(
                    'course-row-' + courseId
                );

            row.remove();

        } else {

            alert('Failed to delete course.');
        }
    })

    .catch(error => {

        console.error(error);

        alert('Something went wrong.');
    });
}

function enableAssignmentEdit(assignmentId) {

    const row =
        document.getElementById(
            'assignment-row-' + assignmentId
        );

    if (!row) return;

    row.querySelectorAll('.display-mode')
       .forEach(function(el) {
           el.classList.add('hidden');
       });

    row.querySelectorAll('.edit-mode')
       .forEach(function(el) {
           el.classList.remove('hidden');
       });
}

function cancelAssignmentEdit(assignmentId) {

    const row =
        document.getElementById(
            'assignment-row-' + assignmentId
        );

    if (!row) return;

    row.querySelectorAll('.edit-mode')
       .forEach(function(el) {
           el.classList.add('hidden');
       });

    row.querySelectorAll('.display-mode')
       .forEach(function(el) {
           el.classList.remove('hidden');
       });
}

function saveAssignment(assignmentId) {

    const row =
        document.getElementById(
            'assignment-row-' + assignmentId
        );

    const title =
        row.querySelector(
            'input[name=\"title\"]'
        ).value;

    const deadline =
        row.querySelector(
            'input[name=\"deadline\"]'
        ).value;

    const status =
        row.querySelector(
            'select[name=\"status\"]'
        ).value;

    fetch('${pageContext.request.contextPath}/edit-assignment', {

        method: 'POST',

        headers: {
            'Content-Type':
                'application/x-www-form-urlencoded'
        },

        body:
            'id=' + encodeURIComponent(assignmentId) +
            '&title=' + encodeURIComponent(title) +
            '&deadline=' + encodeURIComponent(deadline) +
            '&status=' + encodeURIComponent(status)

    })

    .then(response => {

        if (response.ok) {

            location.reload();

        } else {

            alert('Failed to update assignment.');
        }
    })

    .catch(error => {

        console.error(error);

        alert('Something went wrong.');
    });
}

</script>

</body>

</html>