<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>

    .typing-cursor {

        display: inline-block;
        margin-left: 4px;
        animation: blink 0.8s infinite;
    }

    @keyframes blink {

        0% {
            opacity: 1;
        }

        50% {
            opacity: 0;
        }

        100% {
            opacity: 1;
        }
    }

</style>

<!-- WELCOME -->
<div class="mb-10">

    <h2 id="welcomeText"
        class="text-3xl font-black tracking-tight flex items-center">
    </h2>

    <p class="text-on-surface-variant mt-1">
        Continue your academic progress and stay updated.
    </p>

</div>

<script>

    const text =
        "Welcome back, ${sessionScope.user.name}!";

    let index = 0;

    const speed = 60;

    const welcome =
        document.getElementById(
            "welcomeText"
        );

    function typeWriter() {

        if (index < text.length) {

        	welcome.innerHTML =
        	    text.substring(0, index + 1);

            index++;

            setTimeout(
                typeWriter,
                speed
            );

        } else {

        	welcome.innerHTML =
        	    text;
        }
    }

    window.addEventListener(
        "load",
        typeWriter
    );

</script>

<!-- STATS -->
<section class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">

    <!-- COURSES -->
    <a href="courses"
		class="block bg-[#dfe8dc] rounded-3xl p-6 border border-stone-200 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 cursor-pointer min-h-[170px]">

        <p class="text-xs font-bold uppercase tracking-widest text-[#384b3c] mb-2">
            Enrolled Courses
        </p>

        <div class="flex items-end justify-between">

            <h3 class="text-4xl font-black">
                ${totalCourses}
            </h3>

            <span class="material-symbols-outlined text-primary opacity-60">
                menu_book
            </span>

        </div>

	</a>
    <!-- ASSIGNMENTS -->
    <a href="assignments"
		class="block bg-[#e7ece4] rounded-3xl p-6 border border-stone-200 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 cursor-pointer min-h-[170px]">

        <p class="text-xs font-bold uppercase tracking-widest text-secondary mb-2">
            Assignments
        </p>

        <div class="flex items-end justify-between">

            <h3 class="text-4xl font-black">
                ${totalAssignments}
            </h3>

            <span class="material-symbols-outlined text-primary opacity-60">
                assignment
            </span>

        </div>

	</a>
    <!-- STATUS -->
    <div 
		class="bg-[#e2e9df] rounded-3xl p-6 border border-stone-200 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 min-h-[170px]">

        <p class="text-xs font-bold uppercase tracking-widest text-secondary mb-2">
            Learning Status
        </p>

        <div class="flex items-end justify-between">

            <h3 class="text-2xl font-black">
                Active
            </h3>

            <span class="material-symbols-outlined text-primary opacity-60">
                school
            </span>

        </div>

    </div>

</section>

<!-- MAIN GRID -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-10">

    <!-- LEFT -->
    <div class="lg:col-span-2 space-y-10">

        <!-- RECENT ASSIGNMENTS -->
        <section>

            <div class="mb-6">

                <h2 class="text-2xl font-bold">
                    Recent Assignments
                </h2>

            </div>

            <div class="bg-[#dfe8dc] border border-stone-200 rounded-3xl shadow-sm overflow-hidden">

                <div class="divide-y divide-outline-variant">

                    <c:forEach var="assignment"
                               items="${dashboardAssignments}">

                        <div class="p-6 flex items-center justify-between hover:bg-[#f5f3f1] transition-all duration-200">

                            <div>

                                <h3 class="font-bold text-lg">
                                    ${assignment.title}
                                </h3>

                                <p class="text-sm text-secondary mt-1">
                                    Deadline: ${assignment.deadline}
                                </p>

                            </div>

                            <a href="assignments"
								class="bg-primary text-white w-[94px] py-2 rounded-lg text-xs font-bold flex items-center justify-center gap-1 hover:opacity-90 transition-all duration-200">

                                View

                                <span class="material-symbols-outlined text-sm">
                                    arrow_forward
                                </span>

                            </a>

                        </div>

                    </c:forEach>

                </div>

            </div>

        </section>

        <!-- RECENT SUBMISSION ACTIVITY -->
        <section>

            <h2 class="text-2xl font-bold mb-6">
			    Recent Submission Activity
			</h2>

            <c:if test="${not empty recentSubmissions}">

                <div class="space-y-4">

                    <c:forEach var="submission"
                               items="${recentSubmissions}">

                        <div class="bg-white border border-stone-200 rounded-3xl p-6 min-h-[120px] shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300">

                            <div class="flex items-start justify-between">

                                <!-- LEFT -->
                                <div class="flex items-start gap-4">

                                    <!-- ICON -->
                                    <div class="w-14 h-14 rounded-2xl bg-primary-container flex items-center justify-center text-primary shadow-sm border border-outline-variant">

                                        <span class="text-2xl font-black uppercase">

                                            ${submission.courseTitle.substring(0,1)}

                                        </span>

                                    </div>

                                    <!-- CONTENT -->
                                    <div class="space-y-1">

                                        <h3 class="text-xl font-black text-stone-800 leading-tight">

                                            ${submission.assignmentTitle}

                                        </h3>

                                        <div class="flex items-center gap-2 text-sm text-stone-500">

                                            <span class="material-symbols-outlined text-[16px]">
                                                menu_book
                                            </span>

                                            <span>
                                                ${submission.courseTitle}
                                            </span>

                                        </div>

                                        <div class="flex items-center gap-2 text-xs text-stone-400 pt-1">

                                            <span class="material-symbols-outlined text-[14px]">
                                                schedule
                                            </span>

                                            <span>
                                                Submitted on ${submission.submissionDate}
                                            </span>

                                        </div>

                                    </div>

                                </div>

                                <!-- STATUS -->
                                <div class="flex flex-col items-end gap-3">

				    <span class="px-4 py-1.5 rounded-full bg-green-100 text-green-700 text-xs font-bold shadow-sm">
				
				        ${submission.status}
				
				    </span>
				
				    <a href="submission?assignment_id=${submission.assignmentId}#submission-history"
						class="bg-primary text-white w-[94px] py-2 rounded-lg text-xs font-bold flex items-center justify-center gap-1 hover:opacity-90 transition-all duration-200">
				        View
				
				        <span class="material-symbols-outlined text-sm">
				            arrow_forward
				        </span>
				
				    </a>
				
				</div>

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </c:if>

        </section>

    </div>

    <!-- RIGHT -->
    <div class="space-y-10">

        <!-- ANNOUNCEMENTS -->
        <div class="bg-white rounded-3xl p-6 border border-stone-200 shadow-sm min-h-[170px]">

            <h2 class="text-2xl font-bold mb-4">
                Announcements
            </h2>

            <p class="text-stone-500">
                LMS System Running Successfully.
            </p>

        </div>

    </div>

</div>