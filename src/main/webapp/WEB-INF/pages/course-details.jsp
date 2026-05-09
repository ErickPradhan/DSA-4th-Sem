<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html class="light" lang="en">

<head>

<meta charset="utf-8"/>

<meta content="width=device-width, initial-scale=1.0"
      name="viewport"/>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
      rel="stylesheet"/>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"/>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<title>${course.title}</title>

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
    }

    ::-webkit-scrollbar {
        width: 6px;
    }

    ::-webkit-scrollbar-thumb {
        background: #434843;
        border-radius: 10px;
    }

</style>

</head>

<body class="bg-[#fbf9f6] text-[#1b1c1a] antialiased">

<!-- SIDEBAR -->
<aside class="fixed left-0 top-0 h-full w-[260px] bg-neutral-900 border-r border-neutral-800 flex flex-col z-50">

    <div class="p-6">

        <h1 class="text-lg font-bold text-neutral-50 tracking-tight">
            EduTech IT
        </h1>

        <p class="text-[10px] text-neutral-500 uppercase tracking-widest mt-1">
            Institutional Platform
        </p>

    </div>

    <nav class="flex-1 px-2 mt-4">

        <div class="space-y-1">

            <a class="flex items-center gap-3 text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-neutral-50 transition-all"
               href="admin-dashboard">

                <span class="material-symbols-outlined">
                    dashboard
                </span>

                <span class="font-medium text-sm">
                    Dashboard
                </span>

            </a>

            <a class="flex items-center gap-3 bg-neutral-800 text-emerald-200 border-l-4 border-emerald-200 py-3 px-4 transition-all"
               href="courses">

                <span class="material-symbols-outlined"
                      style="font-variation-settings: 'FILL' 1;">

                    school

                </span>

                <span class="font-medium text-sm">
                    Courses
                </span>

            </a>

            <a class="flex items-center gap-3 text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-neutral-50 transition-all"
               href="assignments">

                <span class="material-symbols-outlined">
                    assignment
                </span>

                <span class="font-medium text-sm">
                    Assignments
                </span>

            </a>

        </div>

    </nav>

    <div class="px-2 mb-6">

        <div class="h-[1px] bg-neutral-800 mx-4 mb-4"></div>

        <a class="flex items-center gap-3 text-neutral-400 py-3 px-4 hover:bg-neutral-800 hover:text-neutral-50 transition-all"
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
<main class="ml-[260px] min-h-screen flex flex-col">

    <!-- TOPBAR -->
    <header class="w-full h-16 border-b sticky top-0 bg-white border-neutral-200 flex justify-between items-center px-8 z-40">

        <div class="flex items-center gap-4">

            <span class="text-xl font-black text-neutral-900">
                EduTech IT
            </span>

            <div class="hidden md:flex h-8 w-[1px] bg-neutral-200 mx-2"></div>

            <nav class="hidden md:flex gap-6">

                <a class="text-neutral-900 font-bold"
                   href="courses">

                    Catalog

                </a>

                <div class="text-neutral-400 cursor-not-allowed">
				
				    Resources
				
				</div>
				
				<div class="text-neutral-400 cursor-not-allowed">
				
				    Support
				
				</div>

            </nav>

        </div>

        <div class="flex items-center gap-6">

            <a href="logout"
               class="material-symbols-outlined text-neutral-500 text-sm">

                logout

            </a>

        </div>

    </header>

    <!-- CONTENT -->
    <div class="max-w-[1200px] mx-auto w-full px-6 py-12">

        <!-- HERO -->
        <div class="relative w-full rounded-xl overflow-hidden bg-[#c2d8c4] mb-6 border-2 border-[#4f6353]">

            <div class="flex flex-col md:flex-row h-full">

                <div class="md:w-3/5 p-12 flex flex-col justify-center z-10 relative bg-[#c2d8c4]">

                    <span class="inline-block bg-white/40 px-3 py-1 rounded-full text-xs mb-4 self-start border border-[#4f6353]/20 uppercase font-semibold">

                        Course

                    </span>

                    <h1 class="text-4xl font-bold text-[#1b1c1a] mb-4 leading-tight">

                        ${course.title}

                    </h1>

                    <p class="text-base text-[#434843] mb-6 max-w-lg">

                        ${course.description}

                    </p>

                    <div class="flex flex-wrap gap-10 mb-10">

                        <div class="flex items-center gap-2">

                            <span class="material-symbols-outlined text-[#4f6353]">
                                schedule
                            </span>

                            <span class="text-sm font-semibold">
                                12 Weeks
                            </span>

                        </div>

                        <div class="flex items-center gap-2">

                            <span class="material-symbols-outlined text-[#4f6353]">
                                person_search
                            </span>

                            <span class="text-sm font-semibold">
                                Instructor
                            </span>

                        </div>

                        <div class="flex items-center gap-2">

                            <span class="material-symbols-outlined text-[#4f6353]"
                                  style="font-variation-settings: 'FILL' 1;">

                                star

                            </span>

                            <span class="text-sm font-semibold">
                                4.8 Rating
                            </span>

                        </div>

                    </div>

                    <div class="flex gap-4">

                        <c:if test="${sessionScope.user.role == 'student'}">

						    <div class="bg-[#4f6353] text-white px-6 py-3 rounded-xl font-semibold inline-flex items-center gap-3 cursor-default">
							
							    <span class="material-symbols-outlined">
							        verified
							    </span>
							
							    Learning Access Enabled
							
							</div>
						
						</c:if>

						<c:if test="${sessionScope.user.role == 'admin'}">
						
						    <!-- ADMIN MANAGEMENT PANEL -->
						    <div class="w-full max-w-md bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden mt-8">
						
						        <!-- HEADER -->
						        <div class="px-6 pt-6 pb-4">
						
						            <div class="flex items-center gap-3 mb-2">
						
						                <span class="material-symbols-outlined text-[#4f6353]"
						                      style="font-variation-settings:'FILL' 1">
						
						                    admin_panel_settings
						
						                </span>
						
						                <h2 class="text-xl font-bold text-[#1b1c1a]">
						
						                    Course Management
						
						                </h2>
						
						            </div>
						
						            <p class="text-sm text-[#5f5e5e]">
						
						                Manage assignments, submissions and course resources.
						
						            </p>
						
						        </div>
						
						        <!-- ACTION GRID -->
						        <div class="p-6 grid grid-cols-2 gap-4">
						
						            <!-- ADD ASSIGNMENT -->
						            <a href="add-assignment"
						               class="group flex flex-col items-center justify-center p-4 bg-[#c2d8c4] text-[#384b3c] rounded-xl transition-all hover:bg-[#4f6353] hover:text-white border border-[#4f6353]/10">
						
						                <div class="mb-3 bg-white/40 p-3 rounded-full">
						
						                    <span class="material-symbols-outlined text-[28px]">
						                        add_circle
						                    </span>
						
						                </div>
						
						                <span class="text-xs font-semibold uppercase tracking-wider">
						
						                    Add Assignment
						
						                </span>
						
						            </a>
						
						            <!-- VIEW ASSIGNMENTS -->
						            <a href="assignments"
						               class="group flex flex-col items-center justify-center p-4 bg-[#f3f4f6] text-[#434843] rounded-xl transition-all hover:border-[#4f6353] border border-gray-200">
						
						                <div class="mb-3 text-[#4f6353]">
						
						                    <span class="material-symbols-outlined text-[28px]">
						                        assignment
						                    </span>
						
						                </div>
						
						                <span class="text-xs font-semibold uppercase tracking-wider">
						
						                    Assignments
						
						                </span>
						
						            </a>
						
						            <!-- VIEW SUBMISSIONS -->
						            <a href="submissions"
						               class="group flex flex-col items-center justify-center p-4 bg-[#f3f4f6] text-[#434843] rounded-xl transition-all hover:border-[#4f6353] border border-gray-200">
						
						                <div class="mb-3 text-[#4f6353]">
						
						                    <span class="material-symbols-outlined text-[28px]">
						                        upload_file
						                    </span>
						
						                </div>
						
						                <span class="text-xs font-semibold uppercase tracking-wider">
						
						                    Submissions
						
						                </span>
						
						            </a>
						
						            <!-- EDIT COURSE -->
						            <div class="group flex flex-col items-center justify-center p-4 bg-[#f3f4f6] text-[#9ca3af] rounded-xl border border-gray-200 cursor-not-allowed opacity-70">
									
									    <div class="mb-3 text-[#9ca3af]">
									
									        <span class="material-symbols-outlined text-[28px]">
									            edit
									        </span>
									
									    </div>
									
									    <span class="text-xs font-semibold uppercase tracking-wider">
									
									        Edit Course
									
									    </span>
									
									    <span class="text-[10px] mt-2 uppercase tracking-widest">
									
									        Coming Soon
									
									    </span>
									
									</div>
						
						        </div>
						
						        <!-- FOOTER -->
						        <div class="px-6 py-4 bg-[#f9fafb] border-t border-gray-200 flex items-center justify-between">
						
						            <div class="flex items-center gap-2">
						
						                <div class="w-2 h-2 rounded-full bg-[#4f6353]"></div>
						
						                <span class="text-xs uppercase tracking-wider text-[#434843] font-semibold">
						
						                    Instructor Mode
						
						                </span>
						
						            </div>
						
						            <span class="text-[10px] uppercase tracking-[0.2em] text-gray-400">
						
						                EduTech IT
						
						            </span>
						
						        </div>
						
						    </div>
						
						</c:if>

                        <a href="courses"
                           class="bg-white border-2 border-neutral-900 text-neutral-900 font-semibold py-3 px-8 rounded-xl hover:bg-neutral-50 transition-all">

                            Back to Courses

                        </a>

                    </div>

                </div>

                <!-- IMAGE -->
                <div class="md:w-2/5 relative min-h-[300px]">

                    <img class="absolute inset-0 w-full h-full object-cover"
                         src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1600&auto=format&fit=crop"
                         alt="Course Image"/>

                    <div class="absolute inset-0 bg-gradient-to-r from-[#c2d8c4] via-transparent to-transparent"></div>

                </div>

            </div>

        </div>

        <!-- CONTENT GRID -->
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">

            <!-- LEFT -->
            <div class="lg:col-span-8 space-y-6">

                <!-- OVERVIEW -->
                <section class="bg-white rounded-xl border border-neutral-200 p-6">

                    <h2 class="text-2xl font-bold mb-4">
                        Course Overview
                    </h2>

                    <div class="space-y-4 text-base text-[#5f5e5e] leading-relaxed">

                        <p>

                            ${course.description}

                        </p>

                        <h3 class="text-xl font-semibold mt-8 text-[#1b1c1a]">
                            What you'll learn
                        </h3>

                        <ul class="grid grid-cols-1 md:grid-cols-2 gap-3 mt-4">

                            <li class="flex items-start gap-2">

                                <span class="material-symbols-outlined text-[#4f6353] text-xl">
                                    check_circle
                                </span>

                                <span>
                                    Modern software architecture
                                </span>

                            </li>

                            <li class="flex items-start gap-2">

                                <span class="material-symbols-outlined text-[#4f6353] text-xl">
                                    check_circle
                                </span>

                                <span>
                                    Database integration
                                </span>

                            </li>

                            <li class="flex items-start gap-2">

                                <span class="material-symbols-outlined text-[#4f6353] text-xl">
                                    check_circle
                                </span>

                                <span>
                                    Cloud deployment
                                </span>

                            </li>

                            <li class="flex items-start gap-2">

                                <span class="material-symbols-outlined text-[#4f6353] text-xl">
                                    check_circle
                                </span>

                                <span>
                                    Full-stack development
                                </span>

                            </li>

                        </ul>

                    </div>

                </section>

                <!-- CURRICULUM -->
                <section class="space-y-4">

                    <h2 class="text-2xl font-bold">
                        Curriculum
                    </h2>

                    <div class="bg-[#c2d8c4] rounded-xl border border-[#4f6353]/20 overflow-hidden">

                        <div class="p-4 flex justify-between items-center bg-white/30">

                            <div class="flex items-center gap-4">

                                <span class="w-8 h-8 rounded-lg bg-neutral-900 text-white flex items-center justify-center font-bold">

                                    01

                                </span>

                                <div>

                                    <h4 class="font-bold">
                                        Introduction
                                    </h4>

                                    <p class="text-xs text-[#5f5e5e]">
                                        4 Lessons • 2h 15m
                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>

                </section>

            </div>

            <!-- RIGHT -->
            <aside class="lg:col-span-4 sticky top-24 space-y-6">

                <!-- INSTRUCTOR -->
                <div class="bg-neutral-900 text-white rounded-xl p-6">

                    <h3 class="text-lg font-bold mb-6 border-b border-neutral-800 pb-2">

                        Instructor

                    </h3>

                    <div class="flex items-center gap-4 mb-4">

                        <img class="w-16 h-16 rounded-full object-cover ring-2 ring-emerald-200"
                             src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop"
                             alt="Instructor"/>

                        <div>

                            <h4 class="font-bold text-emerald-200">
                                Senior Instructor
                            </h4>

                            <p class="text-xs text-neutral-400">
                                EduTech IT Faculty
                            </p>

                        </div>

                    </div>

                    <p class="text-sm text-neutral-300 leading-relaxed">

                        Experienced software engineering mentor and academic professional.

                    </p>

                </div>

                <!-- PROGRESS -->
                <div class="bg-[#c2d8c4] rounded-xl p-6 border border-[#4f6353]/10">

                    <h3 class="text-lg font-bold mb-4">
                        Course Progress
                    </h3>

                    <div class="mb-6">

                        <div class="flex justify-between text-xs font-bold mb-2">

                            <span>
                                Module Progress
                            </span>

                            <span>
                                8%
                            </span>

                        </div>

                        <div class="w-full h-2 bg-white/50 rounded-full overflow-hidden">

                            <div class="h-full bg-neutral-900 rounded-full"
                                 style="width: 8%"></div>

                        </div>

                    </div>

                    <div class="space-y-3">

                        <div class="w-full flex items-center justify-between p-3 bg-neutral-700 text-neutral-300 rounded-xl cursor-not-allowed opacity-80">
						
						    <div class="flex items-center gap-3">
						
						        <span class="material-symbols-outlined text-neutral-400">
						            download
						        </span>
						
						        <span class="text-sm font-semibold">
						            Resources Coming Soon
						        </span>
						
						    </div>
						
						    <span class="text-[10px] uppercase tracking-widest">
						
						        Pending
						
						    </span>
						
						</div>

                        <a href="assignments"
                           class="w-full flex items-center justify-between p-3 bg-white text-neutral-900 border border-neutral-200 rounded-xl hover:bg-neutral-50 transition-all">

                            <div class="flex items-center gap-3">

                                <span class="material-symbols-outlined text-[#4f6353]">
                                    assignment
                                </span>

                                <span class="text-sm font-semibold">
                                    View Assignments
                                </span>

                            </div>

                        </a>

                    </div>

                </div>

            </aside>

        </div>

    </div>

    <!-- FOOTER -->
    <footer class="mt-auto border-t border-neutral-200 py-10 bg-white">

        <div class="max-w-[1200px] mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-6">

            <div class="flex items-center gap-2">

                <span class="text-xl font-black text-neutral-900">
                    EduTech IT
                </span>

                <span class="text-xs text-[#5f5e5e]">
                    © 2026 Institutional Platform
                </span>

            </div>

            <div class="flex gap-8">

                <div class="text-sm font-semibold text-neutral-400 cursor-not-allowed">
				
				    Privacy Policy
				
				</div>
				
				<div class="text-sm font-semibold text-neutral-400 cursor-not-allowed">
				
				    Support
				
				</div>

            </div>

        </div>

    </footer>

</main>

</body>

</html>