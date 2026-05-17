<!-- PAGE HEADER -->
<div class="flex items-center justify-between mb-10">

    <div>

        <h2 class="text-3xl font-black tracking-tight">
            Add New Course
        </h2>

        <p class="text-on-surface-variant mt-1">
            Create and publish a new course for students.
        </p>

    </div>

    <a href="courses"
       class="text-sm font-bold text-primary hover:underline">

        Back to Courses

    </a>

</div>

<!-- FORM CONTAINER -->
<div class="bg-primary-container border border-outline-variant rounded-2xl p-8">

    <form action="add-course"
          method="post"
          class="space-y-6">

        <!-- COURSE TITLE -->
        <div>

            <label class="block text-xs uppercase tracking-widest font-bold mb-2 text-[#384b3c]">

                Course Title

            </label>

            <input type="text"
                   name="title"
                   required
                   placeholder="e.g. Advanced Java Programming"
                   class="w-full h-14 px-4 rounded-xl border border-outline-variant bg-white focus:outline-none focus:ring-2 focus:ring-primary">

        </div>

        <!-- COURSE DESCRIPTION -->
        <div>

            <label class="block text-xs uppercase tracking-widest font-bold mb-2 text-[#384b3c]">

                Course Description

            </label>

            <textarea name="description"
                      rows="6"
                      required
                      placeholder="Describe the course curriculum, learning outcomes, and topics covered..."
                      class="w-full p-4 rounded-xl border border-outline-variant bg-white resize-none focus:outline-none focus:ring-2 focus:ring-primary"></textarea>

        </div>

        <!-- CATEGORY + STATUS -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

            <!-- CATEGORY -->
            <div>

                <label class="block text-xs uppercase tracking-widest font-bold mb-2 text-[#384b3c]">

                    Course Category

                </label>

                <select name="category"
                        required
                        class="w-full h-14 px-4 rounded-xl border border-outline-variant bg-white focus:outline-none focus:ring-2 focus:ring-primary">

                    <option value="">
                        Select Category
                    </option>

                    <option value="Programming">
                        Programming
                    </option>

                    <option value="Cybersecurity">
                        Cybersecurity
                    </option>

                    <option value="Cloud Computing">
                        Cloud Computing
                    </option>

                    <option value="Networking">
                        Networking
                    </option>

                    <option value="Data Science">
                        Data Science
                    </option>

                    <option value="Software Engineering">
                        Software Engineering
                    </option>

                </select>

            </div>

            <!-- STATUS -->
            <div>

                <label class="block text-xs uppercase tracking-widest font-bold mb-2 text-[#384b3c]">

                    Course Status

                </label>

                <select name="status"
                        required
                        class="w-full h-14 px-4 rounded-xl border border-outline-variant bg-white focus:outline-none focus:ring-2 focus:ring-primary">

                    <option value="">
                        Select Status
                    </option>

                    <option value="Active">
                        Active
                    </option>

                    <option value="Draft">
                        Draft
                    </option>

                    <option value="Archived">
                        Archived
                    </option>

                </select>

            </div>

        </div>

        <!-- INSTRUCTOR -->
        <div>

            <label class="block text-xs uppercase tracking-widest font-bold mb-2 text-[#384b3c]">

                Instructor Name

            </label>

            <input type="text"
                   name="instructor"
                   required
                   placeholder="e.g. Dr. Sharma"
                   class="w-full h-14 px-4 rounded-xl border border-outline-variant bg-white focus:outline-none focus:ring-2 focus:ring-primary">

        </div>

        <!-- BUTTONS -->
        <div class="flex items-center justify-end gap-4 pt-6 border-t border-outline-variant">

            <a href="courses"
               class="h-12 px-6 rounded-xl border border-primary text-primary font-bold flex items-center">

                Cancel

            </a>

            <button type="submit"
                    class="h-12 px-6 rounded-xl bg-primary text-white font-bold hover:opacity-90 transition">

                Add Course

            </button>

        </div>

    </form>

</div>