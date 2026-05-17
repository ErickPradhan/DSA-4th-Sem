<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- HERO -->
<div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6">

    <div>

        <h2 class="text-3xl font-black tracking-tight">
            Dashboard Overview
        </h2>

        <p class="text-on-surface-variant mt-1">
            Real-time university LMS management metrics.
        </p>

    </div>

    <div class="flex flex-wrap items-center gap-3">

        <a href="add-course"
           class="h-11 bg-primary text-white px-4 rounded-lg text-sm font-bold flex items-center gap-2 hover:opacity-90 transition">

            <span class="material-symbols-outlined text-[20px]">
                add
            </span>

            Add Course

        </a>

        <a href="add-assignment"
           class="h-11 bg-primary-container text-[#384b3c] px-4 rounded-lg text-sm font-bold flex items-center gap-2 hover:opacity-90 transition">

            <span class="material-symbols-outlined text-[20px]">
                assignment
            </span>

            Create Assignment

        </a>

    </div>

</div>

<!-- KPI CARDS -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mt-6 mb-8">

    <!-- TOTAL STUDENTS -->
    <div class="bg-primary-container p-6 rounded-xl border border-outline-variant">

        <div class="flex justify-between items-start">

            <p class="text-sm font-bold uppercase tracking-wider text-[#384b3c]">
                Total Students
            </p>

            <span class="material-symbols-outlined text-[#384b3c] opacity-50">
                group
            </span>

        </div>

        <div class="mt-6">

            <h3 class="text-3xl font-black">
                ${totalStudents}
            </h3>

            <p class="text-xs mt-2 text-primary font-bold">
                Registered student accounts
            </p>

        </div>

    </div>

    <!-- ACTIVE COURSES -->
    <div class="bg-primary-container p-6 rounded-xl border border-outline-variant">

        <div class="flex justify-between items-start">

            <p class="text-sm font-bold uppercase tracking-wider text-[#384b3c]">
                Active Courses
            </p>

            <span class="material-symbols-outlined text-[#384b3c] opacity-50">
                menu_book
            </span>

        </div>

        <div class="mt-6">

            <h3 class="text-3xl font-black">
                ${totalCourses}
            </h3>

            <p class="text-xs mt-2 text-primary font-bold">
                Courses available in LMS
            </p>

        </div>

    </div>

    <!-- TOTAL ASSIGNMENTS -->
    <div class="bg-primary-container p-6 rounded-xl border border-outline-variant">

        <div class="flex justify-between items-start">

            <p class="text-sm font-bold uppercase tracking-wider text-[#384b3c]">
                Total Users
            </p>

            <span class="material-symbols-outlined text-[#384b3c] opacity-50">
                groups
            </span>

        </div>

        <div class="mt-6">

            <h3 class="text-3xl font-black">
                ${totalUsers}
            </h3>

            <p class="text-xs mt-2 text-primary font-bold">
                All registered platform users
            </p>

        </div>

    </div>

    <!-- TOTAL SUBMISSIONS -->
    <div class="bg-primary-container p-6 rounded-xl border border-outline-variant">

        <div class="flex justify-between items-start">

            <p class="text-sm font-bold uppercase tracking-wider text-[#384b3c]">
                Submissions
            </p>

            <span class="material-symbols-outlined text-[#384b3c] opacity-50">
                upload_file
            </span>

        </div>

        <div class="mt-6">

            <h3 class="text-3xl font-black">
                ${totalSubmissions}
            </h3>

            <p class="text-xs mt-2 text-primary font-bold">
                Student submissions uploaded
            </p>

        </div>

    </div>

</div>

<!-- RECENT SUBMISSIONS -->
<div class="bg-surface-container rounded-xl border border-outline-variant overflow-hidden w-full">

    <!-- HEADER -->
    <div class="p-6 border-b border-outline-variant flex items-center justify-between">

        <div>

            <h3 class="text-xl font-bold">
                Recent Submissions
            </h3>

            <p class="text-sm text-secondary mt-1">
                Latest assignment uploads from students
            </p>

        </div>

    </div>

    <!-- TABLE -->
    <div class="overflow-x-auto w-full">

        <table class="min-w-full">

            <thead class="bg-surface">

                <tr class="text-left">

                    <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-secondary">
                        Student
                    </th>

                    <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-secondary">
                        Course
                    </th>

                    <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-secondary">
                        Assignment
                    </th>

                    <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-secondary">
                        Submitted
                    </th>

                </tr>

            </thead>

            <tbody>

                <c:choose>

                    <c:when test="${not empty recentSubmissions}">

                        <c:forEach var="submission"
                                   items="${recentSubmissions}">

                            <tr class="border-t border-outline-variant hover:bg-surface transition-colors">

                                <td class="px-6 py-4 font-medium">
                                    ${submission.studentName}
                                </td>

                                <td class="px-6 py-4 text-sm text-secondary">
                                    ${submission.courseTitle}
                                </td>

                                <td class="px-6 py-4 text-sm">
                                    ${submission.assignmentTitle}
                                </td>

                                <td class="px-6 py-4 text-sm text-secondary">
                                    ${submission.submissionDate}
                                </td>

                            </tr>

                        </c:forEach>

                    </c:when>

                    <c:otherwise>

                        <tr>

                            <td colspan="4"
                                class="px-6 py-10 text-center text-secondary">

                                No submissions available yet.

                            </td>

                        </tr>

                    </c:otherwise>

                </c:choose>

            </tbody>

        </table>

    </div>

</div>