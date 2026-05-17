<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="max-w-[1200px] mx-auto mt-6">

    <!-- HERO -->
    <div class="grid grid-cols-12 gap-6 mb-6">

        <!-- MAIN CARD -->
        <div class="col-span-12 md:col-span-8 flex flex-col justify-between bg-primary-container p-6 rounded-xl border border-primary/20">

            <div>

                <h3 class="text-2xl font-bold text-[#344c39] mb-2">
                    Academic Portfolio Overview
                </h3>

                <p class="text-[#384b3c] max-w-2xl leading-relaxed">
                    Manage technical curriculums, monitor student performance trends, and analyze institutional course workflows across EduTech IT.
                </p>

            </div>

            <c:if test="${sessionScope.user.role == 'admin'}">

                <div class="flex gap-4 mt-6 flex-wrap">

                    <a href="add-course"
                       class="flex items-center gap-2 bg-inverse-surface text-white px-6 py-3 text-xs font-semibold uppercase tracking-wider rounded-lg hover:bg-black transition-colors">

                        <span class="material-symbols-outlined">
                            add
                        </span>

                        Add Course

                    </a>

                </div>

            </c:if>

        </div>

        <!-- SUMMARY -->
        <div class="col-span-12 md:col-span-4 bg-surface-container-high p-6 rounded-xl border border-outline-variant flex flex-col justify-between">

            <div>

                <div class="flex justify-between items-start">

                    <span class="text-xs uppercase tracking-widest text-on-surface-variant font-semibold">
                        Course Summary
                    </span>

                    <span class="bg-[#344c39] text-white text-[10px] px-2 py-1 rounded-full uppercase tracking-wider">
                        Live
                    </span>

                </div>

                <div class="mt-4">

                    <p class="text-3xl font-bold text-on-surface">
                        ${courses.size()}
                    </p>

                    <p class="text-xs text-primary flex items-center gap-1 font-semibold mt-1 uppercase tracking-wider">

                        <span class="material-symbols-outlined text-sm">
                            menu_book
                        </span>

                        Total Active Courses

                    </p>

                </div>

            </div>

        </div>

    </div>

    <!-- TABLE -->
    <div class="bg-white border border-outline-variant overflow-x-auto rounded-xl shadow-sm">

        <table class="w-full table-fixed text-left border-collapse min-w-[1000px]">

            <thead>

                <tr class="bg-inverse-surface text-white">

                    <th class="px-6 py-4 text-xs uppercase tracking-widest font-semibold">
                        Course
                    </th>

                    <th class="px-6 py-4 text-xs uppercase tracking-widest font-semibold">
                        Category
                    </th>

                    <th class="px-6 py-4 text-xs uppercase tracking-widest font-semibold">
                        Instructor
                    </th>

                    <th class="px-6 py-4 text-xs uppercase tracking-widest font-semibold">
                        Status
                    </th>

                    <th class="px-6 py-4 text-xs uppercase tracking-widest font-semibold text-center">
                        Actions
                    </th>

                </tr>

            </thead>

            <tbody class="divide-y divide-outline-variant">

                <c:choose>

                    <c:when test="${not empty courses}">

                        <c:forEach var="course" items="${courses}">

                            <tr id="course-row-${course.id}"
                                class="hover:bg-surface-container-low transition-colors">

                                <!-- COURSE -->
                                <td class="px-6 py-5">


                                        <div class="w-full">

                                            <!-- DISPLAY MODE -->
                                            <div class="display-mode">

                                                <p class="text-lg font-semibold text-on-surface">
                                                    ${course.title}
                                                </p>

                                                <p class="text-xs uppercase tracking-widest text-on-surface-variant mt-1">
                                                    EduTech IT Department
                                                </p>

                                            </div>

                                            <!-- EDIT MODE -->
                                            <div class="edit-mode hidden">

                                                <input type="text"
                                                       name="title"
                                                       value="${course.title}"
                                                       class="w-full h-11 min-w-[220px] px-3 py-2 border border-outline-variant rounded-lg bg-white text-sm font-semibold focus:outline-none focus:ring-2 focus:ring-primary">

                                            </div>

                                        </div>


                                </td>

                                <!-- CATEGORY -->
                                <td class="px-6 py-5">

                                    <div class="display-mode text-sm font-medium">
                                        ${course.category}
                                    </div>

                                    <div class="edit-mode hidden">

                                        <select name="category"
                                                class="w-full h-11 min-w-[220px] pr-10 px-3 py-2 border border-outline-variant rounded-lg bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

                                            <option value="Programming"
                                                ${course.category == 'Programming' ? 'selected' : ''}>
                                                Programming
                                            </option>

                                            <option value="Cybersecurity"
                                                ${course.category == 'Cybersecurity' ? 'selected' : ''}>
                                                Cybersecurity
                                            </option>

                                            <option value="Cloud Computing"
                                                ${course.category == 'Cloud Computing' ? 'selected' : ''}>
                                                Cloud Computing
                                            </option>

                                            <option value="Networking"
                                                ${course.category == 'Networking' ? 'selected' : ''}>
                                                Networking
                                            </option>

                                            <option value="Data Science"
                                                ${course.category == 'Data Science' ? 'selected' : ''}>
                                                Data Science
                                            </option>

                                            <option value="Software Engineering"
                                                ${course.category == 'Software Engineering' ? 'selected' : ''}>
                                                Software Engineering
                                            </option>

                                        </select>

                                    </div>

                                </td>

                                <!-- INSTRUCTOR -->
                                <td class="px-6 py-5">

                                    <div class="display-mode text-sm font-medium">
                                        ${course.instructor}
                                    </div>

                                    <div class="edit-mode hidden">

                                        <input type="text"
                                               name="instructor"
                                               value="${course.instructor}"
                                               class="w-full h-11 min-w-[180px] px-3 py-2 border border-outline-variant rounded-lg bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

                                    </div>

                                </td>

                                <!-- STATUS -->
                                <td class="px-6 py-5">

                                    <div class="display-mode">

                                        <span class="
                                            px-3 py-1 text-[10px] rounded-full uppercase tracking-widest font-semibold border

                                            ${course.status == 'Active'
                                            ? 'bg-green-100 text-green-700 border-green-200'

                                            : course.status == 'Draft'
                                            ? 'bg-red-100 text-red-700 border-red-200'

                                            : 'bg-yellow-100 text-yellow-700 border-yellow-200'}
                                        ">

                                            ${course.status}

                                        </span>

                                    </div>

                                    <div class="edit-mode hidden">

                                        <select name="status"
                                                class="w-full h-11 min-w-[140px] pr-10 px-3 py-2 border border-outline-variant rounded-lg bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

                                            <option value="Active"
                                                ${course.status == 'Active' ? 'selected' : ''}>
                                                Active
                                            </option>

                                            <option value="Draft"
                                                ${course.status == 'Draft' ? 'selected' : ''}>
                                                Draft
                                            </option>

                                            <option value="Archived"
                                                ${course.status == 'Archived' ? 'selected' : ''}>
                                                Archived
                                            </option>

                                        </select>

                                    </div>

                                </td>

                                <!-- ACTIONS -->
								<td class="px-6 py-5">
								
								    <c:choose>
								
								        <c:when test="${sessionScope.user.role == 'admin'}">
								
								            <div class="flex justify-center gap-3">
								
								                <div class="display-mode flex justify-center items-center gap-5">
								
								                    <!-- EDIT -->
								                    <button type="button"
								                            onclick="enableEdit(${course.id})"
								                            class="material-symbols-outlined text-outline hover:text-primary transition-colors"
								                            title="Edit Course">
								
								                        edit
								
								                    </button>
								
								                    <!-- DELETE -->
								                    <button type="button"
								                            onclick="deleteCourse(${course.id})"
								                            class="material-symbols-outlined text-red-500 hover:text-red-600 transition-colors"
								                            title="Delete Course">
								
								                        delete
								
								                    </button>
								
								                </div>
								
								                <div class="edit-mode hidden flex gap-3">
								
								                    <!-- SAVE -->
								                    <button type="button"
								                            onclick="saveCourse(${course.id})"
								                            class="material-symbols-outlined text-green-600 hover:text-green-700 transition-colors"
								                            title="Save">
								
								                        check_circle
								
								                    </button>
								
								                    <!-- CANCEL -->
								                    <button type="button"
								                            onclick="cancelEdit(${course.id})"
								                            class="material-symbols-outlined text-red-500 hover:text-red-600 transition-colors"
								                            title="Cancel">
								
								                        cancel
								
								                    </button>
								
								                </div>
								
								            </div>
								
								        </c:when>
								
								        <c:otherwise>
								
								            <div class="flex justify-center items-center">
								
								                <a href="course-details?id=${course.id}"
								                   class="material-symbols-outlined
								                          text-outline hover:text-primary
								                          transition-colors text-[22px]"
								                   title="View Course">
								
								                    visibility
								
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
                                class="px-6 py-12 text-center text-on-surface-variant">

                                No courses available yet.

                            </td>

                        </tr>

                    </c:otherwise>

                </c:choose>

            </tbody>

        </table>

    </div>

</div>