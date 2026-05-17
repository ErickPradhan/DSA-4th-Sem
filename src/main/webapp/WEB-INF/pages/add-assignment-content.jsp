<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="max-w-5xl mx-auto">

    <!-- PAGE HEADER -->
    <div class="mb-10">

        <h1 class="text-4xl font-black text-on-background mb-3">
            Create Assignment
        </h1>

        <p class="text-outline text-lg">
            Create coursework and assign it to a course.
        </p>

    </div>

    <!-- FORM CARD -->
    <div class="bg-white border border-outline-variant rounded-3xl p-10">

        <form id="assignmentForm"
        	action="${pageContext.request.contextPath}/add-assignment"
        	method="post"
        	class="space-y-8">

            <!-- COURSE -->
            <div>

                <label class="block text-sm font-bold uppercase tracking-[0.15em] text-outline mb-3">

                    Select Course

                </label>

                <select name="course_id"
                        required
                        class="w-full h-14 px-5 border border-outline-variant rounded-2xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

                    <option value="">
                        Choose Course
                    </option>

                    <c:forEach var="course"
                               items="${courses}">

                        <option value="${course.id}">
                            ${course.title}
                        </option>

                    </c:forEach>

                </select>

            </div>

            <!-- TITLE -->
            <div>

                <label class="block text-sm font-bold uppercase tracking-[0.15em] text-outline mb-3">

                    Assignment Title

                </label>

                <input type="text"
                       name="title"
                       required
                       placeholder="Enter assignment title"
                       class="w-full h-14 px-5 border border-outline-variant rounded-2xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

            </div>

            <!-- DESCRIPTION -->
            <div>

                <label class="block text-sm font-bold uppercase tracking-[0.15em] text-outline mb-3">

                    Description

                </label>

                <textarea name="description"
                          rows="6"
                          required
                          placeholder="Enter assignment description"
                          class="w-full px-5 py-4 border border-outline-variant rounded-2xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary resize-none"></textarea>

            </div>

            <!-- DEADLINE -->
            <div>

                <label class="block text-sm font-bold uppercase tracking-[0.15em] text-outline mb-3">

                    Deadline

                </label>

                <input type="date"
                       name="deadline"
                       required
                       class="w-full h-14 px-5 border border-outline-variant rounded-2xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">

            </div>
			
			<!-- STATUS -->
			<div>
			
			    <label class="block text-sm font-bold uppercase tracking-[0.15em] text-outline mb-3">
			
			        Assignment Status
			
			    </label>
			
			    <select name="status"
			            required
			            class="w-full h-14 px-5 border border-outline-variant rounded-2xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-primary">
			
			
					<option value="Draft">
					    Draft
					</option>
					
					<option value="Active">
					    Active
					</option>
					
					<option value="Due Soon">
					    Due Soon
					</option>
					
					<option value="Closed">
					    Closed
					</option>
			
			    </select>
			
			</div>
			
            <!-- ACTION BUTTONS -->
            <div class="flex items-center justify-end gap-4 pt-4">

                <a href="assignments"
                   class="px-6 py-3 rounded-xl border border-outline-variant text-outline hover:bg-[#f5f5f5] transition-colors font-semibold">

                    Cancel

                </a>

                <button type="button"
        onclick="document.getElementById('assignmentForm').submit();"
        				form="assignmentForm"
        				formmethod="post"
                        class="bg-primary hover:bg-[#475a49]
                               text-on-primary px-8 py-3 rounded-xl
                               font-bold transition-colors
                               flex items-center gap-2">

                    <span class="material-symbols-outlined">
                        add
                    </span>

                    Create Assignment

                </button>

            </div>

        </form>

    </div>

</div>
