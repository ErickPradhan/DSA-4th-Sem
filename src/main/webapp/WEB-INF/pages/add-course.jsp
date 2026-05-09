<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html class="light" lang="en">

<head>

    <meta charset="utf-8"/>

    <meta content="width=device-width, initial-scale=1.0"
          name="viewport"/>

    <title>Add New Course | EduTech IT</title>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet"/>

    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
          rel="stylesheet"/>

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

    </style>

</head>

<body class="bg-[#fbf9f6] text-[#1b1c1a]">

<!-- SIDEBAR -->
<aside class="fixed left-0 top-0 h-full w-[260px] bg-neutral-900 border-r border-neutral-800 flex flex-col z-50">

    <div class="p-6">

        <h1 class="text-lg font-bold text-neutral-50">
            EduTech IT
        </h1>

        <p class="text-xs text-neutral-400 uppercase tracking-widest mt-1">
            Institutional Platform
        </p>

    </div>

    <nav class="flex-1 px-2 space-y-1 mt-6">

        <a class="flex items-center gap-3 w-full py-3 px-4 text-neutral-400 hover:text-neutral-50 hover:bg-neutral-800 transition-all duration-200 text-sm"
           href="admin-dashboard">

            <span class="material-symbols-outlined">
                dashboard
            </span>

            Dashboard

        </a>

        <a class="flex items-center gap-3 w-full py-3 px-4 bg-neutral-800 text-emerald-200 border-l-4 border-emerald-200 text-sm"
           href="courses">

            <span class="material-symbols-outlined">
                school
            </span>

            Courses

        </a>

        <a class="flex items-center gap-3 w-full py-3 px-4 text-neutral-400 hover:text-neutral-50 hover:bg-neutral-800 transition-all duration-200 text-sm"
           href="assignments">

            <span class="material-symbols-outlined">
                assignment
            </span>

            Assignments

        </a>

    </nav>

    <div class="mt-auto border-t border-neutral-800 py-6 px-2">

        <a class="flex items-center gap-3 w-full py-3 px-4 text-red-400 hover:bg-red-950/20 transition-all text-sm"
           href="logout">

            <span class="material-symbols-outlined">
                logout
            </span>

            Logout

        </a>

    </div>

</aside>

<!-- MAIN -->
<div class="ml-[260px] min-h-screen flex flex-col">

    <!-- TOPBAR -->
    <header class="w-full h-16 border-b border-neutral-200 bg-white sticky top-0 z-40 flex justify-between items-center px-8">

        <div>

            <span class="text-xl font-black text-neutral-900">
                EduTech IT
            </span>

        </div>

        <div class="flex items-center gap-4">

            <a href="courses"
               class="text-sm font-semibold text-neutral-900 hover:text-[#4f6353] transition-colors">

                Back to Courses

            </a>

        </div>

    </header>

    <!-- CONTENT -->
    <main class="flex-1 p-6 max-w-[1200px] mx-auto w-full">

        <!-- TITLE -->
        <div class="mb-12">

            <h2 class="text-4xl font-bold text-[#1b1c1a]">
                Add New Course
            </h2>

            <p class="text-[#5f5e5e] mt-2">
                Create and publish a new course for students.
            </p>

        </div>

        <!-- FORM CARD -->
        <div class="bg-[#c2d8c4] rounded-xl p-6 border border-[#c3c8c1] grid grid-cols-1 lg:grid-cols-12 gap-6">

            <!-- LEFT -->
            <div class="lg:col-span-4 space-y-6">

                <div class="relative aspect-video w-full rounded-lg bg-white border-2 border-dashed border-[#c3c8c1] flex flex-col items-center justify-center overflow-hidden">

                    <span class="material-symbols-outlined text-5xl text-[#4f6353] mb-3">
                        cloud_upload
                    </span>

                    <p class="text-sm font-bold text-center">
                        Upload Course Image
                    </p>

                    <p class="text-xs text-gray-500 mt-1">
                        Drag and drop or click to browse
                    </p>

                </div>

                <div class="bg-white/70 p-4 rounded-lg border border-white/40">

                    <h3 class="text-xs text-[#4f6353] uppercase tracking-widest mb-3 font-bold">
                        Publication Tips
                    </h3>

                    <ul class="space-y-3 text-sm text-[#434843]">

                        <li class="flex items-start gap-2">

                            <span class="material-symbols-outlined text-sm mt-1">
                                check_circle
                            </span>

                            Use high-quality course descriptions.

                        </li>

                        <li class="flex items-start gap-2">

                            <span class="material-symbols-outlined text-sm mt-1">
                                check_circle
                            </span>

                            Add detailed learning outcomes.

                        </li>

                    </ul>

                </div>

            </div>

            <!-- RIGHT -->
            <div class="lg:col-span-8">

                <form action="add-course"
                      method="post"
                      class="space-y-5">

                    <!-- TITLE -->
                    <div>

                        <label class="block text-xs uppercase tracking-widest mb-2 font-semibold text-[#434843]">

                            Course Title

                        </label>

                        <input type="text"
                               name="title"
                               required
                               placeholder="e.g. Advanced System Architecture"
                               class="w-full p-4 bg-white border border-[#c3c8c1] rounded-lg focus:ring-2 focus:ring-[#4f6353] outline-none">

                    </div>

                    <!-- DESCRIPTION -->
                    <div>

                        <label class="block text-xs uppercase tracking-widest mb-2 font-semibold text-[#434843]">

                            Course Description

                        </label>

                        <textarea name="description"
                                  required
                                  rows="5"
                                  placeholder="Describe the course curriculum..."
                                  class="w-full p-4 bg-white border border-[#c3c8c1] rounded-lg focus:ring-2 focus:ring-[#4f6353] outline-none"></textarea>

                    </div>

                    <!-- CATEGORY + DURATION -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                        <div>

                            <label class="block text-xs uppercase tracking-widest mb-2 font-semibold text-[#434843]">

                                Course Category

                            </label>

                            <select class="w-full p-4 bg-white border border-[#c3c8c1] rounded-lg focus:ring-2 focus:ring-[#4f6353] outline-none">

                                <option>Web Development</option>
                                <option>Data Science</option>
                                <option>Cybersecurity</option>
                                <option>Cloud Computing</option>
                                <option>UI/UX</option>
                                <option>Database Systems</option>

                            </select>

                        </div>

                        <div>

                            <label class="block text-xs uppercase tracking-widest mb-2 font-semibold text-[#434843]">

                                Course Duration

                            </label>

                            <select class="w-full p-4 bg-white border border-[#c3c8c1] rounded-lg focus:ring-2 focus:ring-[#4f6353] outline-none">

							    <option value="">
							        Select Duration
							    </option>
							    
								<option>
							        Self Paced
							    </option>
							    
							    <option>
							        4 Weeks
							    </option>
							
							    <option>
							        6 Weeks
							    </option>
							
							    <option>
							        8 Weeks
							    </option>
							
							    <option>
							        10 Weeks
							    </option>
							
							    <option>
							        12 Weeks
							    </option>
							
							    <option>
							        16 Weeks
							    </option>
							
							    <option>
							        Self Paced
							    </option>
							
							</select>
                        </div>

                    </div>

                    <!-- INSTRUCTOR + DATE -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                        <div>

                            <label class="block text-xs uppercase tracking-widest mb-2 font-semibold text-[#434843]">

                                Instructor Name

                            </label>

                            <input type="text"
                                   placeholder="Optional Instructor Name"
                                   class="w-full p-4 bg-white border border-[#c3c8c1] rounded-lg focus:ring-2 focus:ring-[#4f6353] outline-none">

                        </div>

                        <div>

                            <label class="block text-xs uppercase tracking-widest mb-2 font-semibold text-[#434843]">

                                Start Date

                            </label>

                            <input type="date"
                                   class="w-full p-4 bg-white border border-[#c3c8c1] rounded-lg focus:ring-2 focus:ring-[#4f6353] outline-none">

                        </div>

                    </div>

                    <!-- BUTTONS -->
                    <div class="pt-6 flex items-center justify-end gap-4 border-t border-white/40 mt-6">

                        <a href="courses"
                           class="px-6 py-3 border border-[#4f6353] text-[#4f6353] rounded hover:bg-[#4f6353]/5 transition-colors uppercase tracking-widest text-sm font-semibold">

                            Cancel

                        </a>

                        <button type="submit"
                                class="px-6 py-3 bg-[#30312f] text-white rounded hover:bg-black transition-all uppercase tracking-widest text-sm font-semibold shadow-lg">

                            Add Course

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </main>

</div>

</body>

</html>