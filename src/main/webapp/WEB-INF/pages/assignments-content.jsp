<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="space-y-8">

    <!-- PAGE HEADER -->
    <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6">

        <div>

            <h1 class="text-4xl font-black text-on-background mb-2">
                Assignment Management
            </h1>

            <p class="text-outline text-lg">
                Manage coursework, deadlines, and assignment workflows.
            </p>

        </div>

        <div class="flex items-center gap-4">

            <c:if test="${sessionScope.user.role == 'admin'}">

                <a href="add-assignment"
                   class="bg-primary hover:bg-[#475a49]
                          text-on-primary px-6 py-4 rounded-xl
                          font-bold transition-colors
                          flex items-center gap-2">

                    <span class="material-symbols-outlined">
                        add
                    </span>

                    Create Assignment

                </a>

            </c:if>

        </div>

    </div>

    <!-- STATS -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

        <!-- TOTAL -->
        <div class="bg-primary-container rounded-2xl p-6 border border-outline-variant">

            <div class="flex items-start justify-between mb-5">

                <div>

                    <p class="text-sm font-bold uppercase tracking-[0.2em] text-primary mb-3">
                        Total Assignments
                    </p>

                    <h2 class="text-5xl font-black text-on-background">
                        ${totalAssignments}
                    </h2>

                </div>

                <span class="material-symbols-outlined text-primary text-4xl">
                    assignment
                </span>

            </div>

            <p class="text-outline font-medium">
                Total coursework created
            </p>

        </div>

        <!-- ACTIVE -->
        <div class="bg-white rounded-2xl p-6 border border-outline-variant">

            <div class="flex items-start justify-between mb-5">

                <div>

                    <p class="text-sm font-bold uppercase tracking-[0.2em] text-primary mb-3">
                        Active
                    </p>

                    <h2 class="text-5xl font-black text-on-background">
                        ${activeAssignments}
                    </h2>

                </div>

                <span class="material-symbols-outlined text-primary text-4xl">
                    pending_actions
                </span>

            </div>

            <p class="text-outline font-medium">
                Currently active assignments
            </p>

        </div>

        <!-- DUE SOON -->
        <div class="bg-white rounded-2xl p-6 border border-outline-variant">

            <div class="flex items-start justify-between mb-5">

                <div>

                    <p class="text-sm font-bold uppercase tracking-[0.2em] text-primary mb-3">
                        Upcoming Deadlines
                    </p>

                    <h2 class="text-5xl font-black text-on-background">
                        ${dueSoonAssignments}
                    </h2>

                </div>

                <span class="material-symbols-outlined text-primary text-4xl">
                    event
                </span>

            </div>

            <p class="text-outline font-medium">
                Pending due dates
            </p>

        </div>

    </div>

    <!-- TABLE -->
    <div class="bg-white border border-outline-variant rounded-2xl overflow-hidden">

        <!-- TABLE HEADER -->
        <div class="px-8 py-6 border-b border-outline-variant">

            <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">

                <div>

                    <h2 class="text-2xl font-black text-on-background mb-1">
                        All Assignments
                    </h2>

                    <p class="text-outline">
                        Manage and monitor assignment activity
                    </p>

                </div>

            </div>

        </div>

        <!-- TABLE -->
        <div class="overflow-x-auto">

            <table class="w-full table-fixed text-left border-collapse min-w-[1100px]">

                <thead class="bg-[#2f302e] text-white">

                    <tr>

                        <th class="px-6 py-5 text-sm font-bold uppercase tracking-[0.15em]">
                            Assignment
                        </th>

                        <th class="px-6 py-5 text-sm font-bold uppercase tracking-[0.15em]">
                            Course
                        </th>

                        <th class="px-6 py-5 text-sm font-bold uppercase tracking-[0.15em]">
                            Deadline
                        </th>

                        <th class="px-6 py-5 text-sm font-bold uppercase tracking-[0.15em]">
                            Status
                        </th>

                        <th class="px-6 py-5 text-sm font-bold uppercase tracking-[0.15em] text-center">
                            Actions
                        </th>

                    </tr>

                </thead>

                <tbody>

                    <c:choose>

                        <c:when test="${not empty assignments}">

                            <c:forEach var="assignment"
                                       items="${assignments}">

                                <tr id="assignment-row-${assignment.id}"
                                    class="border-b border-outline-variant hover:bg-[#f8faf8] transition-colors">

                                    <!-- TITLE -->
                                    <td class="px-6 py-5">

                                        <div class="display-mode">

                                            <h3 class="font-bold text-on-background text-xl mb-1">
                                                ${assignment.title}
                                            </h3>

                                            <p class="text-outline text-sm uppercase tracking-[0.18em]">
                                                Assignment Task
                                            </p>

                                        </div>

                                        <div class="edit-mode hidden">

                                            <input type="text"
                                                   name="title"
                                                   value="${assignment.title}"
                                                   class="w-full h-11 px-4 border border-outline-variant rounded-xl bg-white text-sm font-semibold focus:outline-none focus:ring-2 focus:ring-primary">

                                        </div>

                                    </td>

                                    <!-- COURSE -->
                                    <td class="px-6 py-5">

                                        <span class="font-semibold text-on-background">
                                            ${assignment.courseTitle}
                                        </span>

                                    </td>

                                    <!-- DEADLINE -->
                                    <td class="px-6 py-5">

                                        <div class="display-mode">

                                            <span class="font-medium text-on-background">
                                                ${assignment.deadline}
                                            </span>

                                        </div>

                                        <div class="edit-mode hidden">

                                            <input type="date"
                                                   name="deadline"
                                                   value="${assignment.deadline}"
                                                   class="w-full h-11 px-4 border border-outline-variant rounded-xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

                                        </div>

                                    </td>

                                    <!-- STATUS -->
                                    <td class="px-6 py-5">

                                        <div class="display-mode">

                                            <c:choose>

                                                <c:when test="${assignment.status == 'Draft'}">

                                                    <span class="inline-flex items-center
                                                                 px-4 py-1.5 rounded-full
                                                                 text-xs font-bold uppercase tracking-[0.18em]
                                                                 bg-[#e5e7eb] text-[#4b5563]">

                                                        Draft

                                                    </span>

                                                </c:when>

                                                <c:when test="${assignment.status == 'Active'}">

                                                    <span class="inline-flex items-center
                                                                 px-4 py-1.5 rounded-full
                                                                 text-xs font-bold uppercase tracking-[0.18em]
                                                                 bg-[#dcfce7] text-[#15803d]">

                                                        Active

                                                    </span>

                                                </c:when>

                                                <c:when test="${assignment.status == 'Due Soon'}">

                                                    <span class="inline-flex items-center
                                                                 px-4 py-1.5 rounded-full
                                                                 text-xs font-bold uppercase tracking-[0.18em]
                                                                 bg-[#fff3cd] text-[#b58105]">

                                                        Due Soon

                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="inline-flex items-center
                                                                 px-4 py-1.5 rounded-full
                                                                 text-xs font-bold uppercase tracking-[0.18em]
                                                                 bg-[#fee2e2] text-[#dc2626]">

                                                        Closed

                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                        <div class="edit-mode hidden">

                                            <select name="status"
                                                    class="w-full h-11 px-4 border border-outline-variant rounded-xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

                                                <option value="Draft"
                                                    ${assignment.status == 'Draft' ? 'selected' : ''}>
                                                    Draft
                                                </option>

                                                <option value="Active"
                                                    ${assignment.status == 'Active' ? 'selected' : ''}>
                                                    Active
                                                </option>

                                                <option value="Due Soon"
                                                    ${assignment.status == 'Due Soon' ? 'selected' : ''}>
                                                    Due Soon
                                                </option>

                                                <option value="Closed"
                                                    ${assignment.status == 'Closed' ? 'selected' : ''}>
                                                    Closed
                                                </option>

                                            </select>

                                        </div>

                                    </td>

                                    <!-- ACTIONS -->
                                    <td class="px-6 py-5">

                                        <c:choose>

                                            <c:when test="${sessionScope.user.role == 'admin'}">

                                                <div class="flex justify-center items-center gap-5">

                                                    <div class="display-mode flex items-center gap-5">

                                                        <button type="button"
                                                                onclick="enableAssignmentEdit(${assignment.id})"
                                                                class="material-symbols-outlined
                                                                       text-outline hover:text-primary
                                                                       transition-colors">

                                                            edit

                                                        </button>

                                                        <button type="button"
                                                                onclick="deleteAssignment(${assignment.id})"
                                                                class="material-symbols-outlined
                                                                       text-red-500 hover:text-red-600
                                                                       transition-colors">

                                                            delete

                                                        </button>

                                                    </div>

                                                    <div class="edit-mode hidden flex items-center gap-5">

                                                        <button type="button"
                                                                onclick="saveAssignment(${assignment.id})"
                                                                class="material-symbols-outlined
                                                                       text-green-600 hover:text-green-700
                                                                       transition-colors">

                                                            check_circle

                                                        </button>

                                                        <button type="button"
                                                                onclick="cancelAssignmentEdit(${assignment.id})"
                                                                class="material-symbols-outlined
                                                                       text-red-500 hover:text-red-600
                                                                       transition-colors">

                                                            cancel

                                                        </button>

                                                    </div>

                                                </div>

                                            </c:when>

                                            <c:otherwise>

                                                <div class="flex justify-center items-center">

                                                    <a href="${pageContext.request.contextPath}/submission?assignment_id=${assignment.id}"
													   class="flex items-center justify-center
													          w-11 h-11 rounded-xl
													          bg-[#eef6ef]
													          hover:bg-primary
													          text-primary hover:text-white
													          transition-all duration-200"
													   title="Submit Assignment">
													
													    <span class="material-symbols-outlined text-[22px]">
													
													        upload_file
													
													    </span>
													
													</a>

                                                </div>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>

                                </tr>

                            </c:forEach>

                        </c:when>

                        <c:otherwise>

                            <tr>

                                <td colspan="5"
                                    class="py-20 text-center">

                                    <div class="flex flex-col items-center justify-center">

                                        <span class="material-symbols-outlined
                                                     text-[64px] text-outline mb-4">

                                            assignment_late

                                        </span>

                                        <h3 class="text-2xl font-black
                                                   text-on-background mb-3">

                                            No Assignments Found

                                        </h3>

                                        <p class="text-outline max-w-md mb-6">

                                            There are currently no assignments available
                                            for this course yet.

                                        </p>

                                        <c:if test="${sessionScope.user.role == 'admin'}">

                                            <a href="add-assignment"
                                               class="bg-primary hover:bg-[#475a49]
                                                      text-on-primary px-6 py-3
                                                      rounded-xl font-bold
                                                      transition-colors">

                                                Create Assignment

                                            </a>

                                        </c:if>

                                    </div>

                                </td>

                            </tr>

                        </c:otherwise>

                    </c:choose>

                </tbody>

            </table>

        </div>

    </div>

</div>