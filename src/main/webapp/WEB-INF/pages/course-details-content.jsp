<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<div class="max-w-[1400px] mx-auto">

    <!-- BREADCRUMB -->
    <div class="flex items-center gap-3 text-sm text-outline mb-8">

        <span>
            Courses
        </span>

        <span class="material-symbols-outlined text-[16px]">
            chevron_right
        </span>

        <span class="text-primary font-semibold">
            ${course.title}
        </span>

    </div>

    <!-- HERO SECTION -->
    <section class="relative overflow-hidden rounded-3xl bg-[#c2d8c4] mb-8">

        <img src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1600&auto=format&fit=crop"
             class="absolute inset-0 w-full h-full object-cover opacity-20"
             alt="Course Banner"/>

        <div class="relative z-10 p-10 lg:p-14 bg-gradient-to-r from-[#c2d8c4] via-[#c2d8c4]/90 to-transparent">

            <!-- CATEGORY -->
            <div class="mb-5">

                <span class="bg-[#4f6353] text-white px-4 py-1 rounded-full text-xs font-semibold uppercase tracking-wider">

                    ${course.category}

                </span>

            </div>

            <!-- TITLE -->
            <h1 class="text-5xl font-black text-[#1b1c1a] max-w-4xl mb-5">

                ${course.title}

            </h1>

            <!-- DESCRIPTION -->
            <p class="text-[#384b3c] text-lg max-w-3xl leading-relaxed">

                ${course.description}

            </p>

        </div>

    </section>

    <!-- ROLE PANELS -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">

        <!-- STUDENT PANEL -->
        <c:if test="${sessionScope.user.role == 'student'}">

            <div class="bg-white border border-outline-variant rounded-2xl p-8 shadow-sm">

                <div class="flex items-center gap-3 mb-4">

                    <span class="material-symbols-outlined text-primary"
                          style="font-variation-settings:'FILL' 1">

                        verified

                    </span>

                    <h2 class="text-2xl font-black text-on-background">

                        Learning Access Enabled

                    </h2>

                </div>

                <p class="text-outline mb-8 leading-relaxed">

                    You are currently enrolled in this course and all learning materials are available.

                </p>

                <div class="flex flex-wrap gap-4">

                    <button class="bg-[#1f1f1f] text-white px-6 py-3 rounded-xl font-semibold hover:bg-black transition-all">

                        Continue Learning

                    </button>

                    <a href="assignments?courseId=${course.id}"
                       class="bg-[#c2d8c4] text-[#344c39] px-6 py-3 rounded-xl font-semibold hover:bg-[#b5ccb8] transition-all">

                        View Assignments

                    </a>

                </div>

            </div>

        </c:if>

        <!-- ADMIN PANEL -->
        <c:if test="${sessionScope.user.role == 'admin'}">

            <div class="bg-white border border-outline-variant rounded-2xl p-8 shadow-sm">

                <div class="flex items-center justify-between mb-6">

                    <h2 class="text-2xl font-black text-on-background">

                        Course Management

                    </h2>

                    <span class="bg-red-100 text-red-700 px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider">

                        Admin View

                    </span>

                </div>

                <div class="grid grid-cols-2 gap-4">

                    <a href="add-assignment"
                       class="flex items-center gap-3 p-4 rounded-xl border border-outline-variant hover:border-primary hover:bg-[#f7faf7] transition-all font-semibold">

                        <span class="material-symbols-outlined text-primary">

                            add_box

                        </span>

                        Add Assignment

                    </a>

                    <a href="assignments"
                       class="flex items-center gap-3 p-4 rounded-xl border border-outline-variant hover:border-primary hover:bg-[#f7faf7] transition-all font-semibold">

                        <span class="material-symbols-outlined text-primary">

                            assignment

                        </span>

                        Assignments

                    </a>

                    <a href="submissions"
                       class="flex items-center gap-3 p-4 rounded-xl border border-outline-variant hover:border-primary hover:bg-[#f7faf7] transition-all font-semibold">

                        <span class="material-symbols-outlined text-primary">

                            grading

                        </span>

                        Submissions

                    </a>

                    <div class="flex items-center gap-3 p-4 rounded-xl border border-outline-variant opacity-50 cursor-not-allowed font-semibold">

                        <span class="material-symbols-outlined">

                            edit_note

                        </span>

                        Edit Course

                    </div>

                </div>

            </div>

        </c:if>

    </div>

    <!-- CONTENT GRID -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- LEFT SIDE -->
        <div class="lg:col-span-2 space-y-8">

            <!-- OVERVIEW -->
            <section class="bg-white border border-outline-variant rounded-2xl p-8 shadow-sm">

                <h2 class="text-3xl font-black text-on-background mb-6">

                    Course Overview

                </h2>

                <p class="text-outline leading-relaxed">

                    ${course.description}

                </p>

            </section>

        </div>

        <!-- RIGHT SIDE -->
        <div class="space-y-8">

            <!-- COURSE INFO -->
            <section class="bg-white border border-outline-variant rounded-2xl p-8 shadow-sm">

                <h2 class="text-2xl font-black text-on-background mb-6">

                    Course Information

                </h2>

                <div class="space-y-5">

                    <!-- INSTRUCTOR -->
                    <div>

                        <p class="text-outline text-sm uppercase tracking-wider mb-1">

                            Instructor

                        </p>

                        <p class="font-semibold text-on-background">

                            ${course.instructor}

                        </p>

                    </div>

                    <!-- CATEGORY -->
                    <div>

                        <p class="text-outline text-sm uppercase tracking-wider mb-1">

                            Category

                        </p>

                        <p class="font-semibold text-on-background">

                            ${course.category}

                        </p>

                    </div>

                    <!-- STATUS -->
                    <div>

                        <p class="text-outline text-sm uppercase tracking-wider mb-1">

                            Status

                        </p>

                        <p class="font-semibold text-on-background">

                            ${course.status}

                        </p>

                    </div>

                </div>

            </section>

        </div>

    </div>

</div>