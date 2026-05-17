<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="max-w-[1200px] mx-auto mt-6">
<!-- SUCCESS MESSAGE -->
<c:if test="${not empty sessionScope.successMessage}">

    <div class="mb-6 bg-green-100 border border-green-300
                text-green-700 px-6 py-4 rounded-2xl
                font-semibold flex items-center gap-3">

        <span class="material-symbols-outlined">
            check_circle
        </span>

        ${sessionScope.successMessage}

    </div>

    <c:remove var="successMessage" scope="session"/>

</c:if>

<!-- ERROR MESSAGE -->
<c:if test="${not empty sessionScope.errorMessage}">

    <div class="mb-6 bg-red-100 border border-red-300
                text-red-700 px-6 py-4 rounded-2xl
                font-semibold flex items-center gap-3">

        <span class="material-symbols-outlined">
            error
        </span>

        ${sessionScope.errorMessage}

    </div>

    <c:remove var="errorMessage" scope="session"/>

</c:if>

<!-- PAGE HEADER -->
<div class="mb-10">

    <h1 class="text-4xl font-black text-on-background mb-3">
        Submit Assignment
    </h1>

    <p class="text-outline text-lg">
        Upload your work before the assignment deadline.
    </p>

</div>

<!-- ASSIGNMENT INFO -->
<div class="bg-white border border-outline-variant rounded-3xl p-8 mb-8">

    <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6">

        <div>

            <p class="text-outline text-sm uppercase tracking-[0.18em] font-bold mb-3">
                ${assignment.courseTitle}
            </p>

            <h2 class="text-3xl font-black text-on-background mb-4">
                ${assignment.title}
            </h2>

            <p class="text-outline leading-relaxed max-w-3xl">
                ${assignment.description}
            </p>

        </div>

        <div class="min-w-[260px]">

            <div class="bg-[#f8faf8] border border-outline-variant rounded-2xl p-6">

                <p class="text-outline text-sm uppercase tracking-[0.15em] font-bold mb-3">
                    Deadline
                </p>

                <h3 class="text-2xl font-black text-on-background mb-2">
                    ${assignment.deadline}
                </h3>

            </div>

        </div>

    </div>

</div>

<!-- FORM -->
<div class="bg-white border border-outline-variant rounded-3xl p-10">

    <form action="${pageContext.request.contextPath}/submit-assignment"
          method="post"
          enctype="multipart/form-data"
          class="space-y-8">

        <input type="hidden"
               name="assignment_id"
               value="${assignment.id}">

        <!-- UPLOAD -->
        <div>

            <label class="block text-sm font-bold uppercase tracking-[0.15em] text-outline mb-4">
                Upload Assignment Files
            </label>

            <div id="dropZone"
                 class="border-2 border-dashed border-outline-variant
                        rounded-3xl p-16 bg-[#f8faf8]
                        hover:border-primary transition-all
                        text-center">

                <div class="flex flex-col items-center justify-center">

                    <span class="material-symbols-outlined
                                 text-[72px] text-primary mb-6">
                        upload_file
                    </span>

                    <h3 class="text-4xl font-black text-on-background mb-4">
                        Drag & Drop your files
                    </h3>

                    <p class="text-outline text-lg leading-relaxed max-w-2xl mb-10">
                        Supported formats:
                        PDF, DOC, DOCX, ZIP, JPG, PNG.
                        Maximum upload size: 10MB.
                    </p>

                    <input type="file"
                           id="submission_file"
                           name="submission_file"
                           multiple
                           required
                           class="hidden">

                    <label for="submission_file"
                           class="bg-primary hover:bg-[#475a49]
                                  text-on-primary px-8 py-4
                                  rounded-2xl font-bold
                                  cursor-pointer transition-colors
                                  shadow-sm">

                        Choose Files

                    </label>

                    <!-- FILE LIST -->
                    <div id="fileList"
                         class="mt-10 flex flex-wrap
                                justify-center gap-4">

                    </div>

                </div>

            </div>

        </div>

        <!-- BUTTONS -->
        <div class="flex items-center justify-end gap-4 pt-2">

            <a href="assignments"
               class="px-6 py-3 rounded-xl border
                      border-outline-variant text-outline
                      hover:bg-[#f5f5f5]
                      transition-colors font-semibold">

                Cancel

            </a>

            <button type="submit"
            		id="submitBtn"
                    class="bg-primary hover:bg-[#475a49]
                           text-on-primary px-8 py-3
                           rounded-xl font-bold
                           transition-colors
                           flex items-center gap-2">

                <span class="material-symbols-outlined">
                    cloud_upload
                </span>

                Submit Assignment

            </button>

        </div>

    </form>

    <!-- HISTORY -->
    <div id="submission-history"
     	class="bg-white border border-outline-variant rounded-2xl p-8 mt-10">

        <div class="mb-8">

            <h2 class="text-2xl font-black text-on-background mb-2">
                Submission History
            </h2>

            <p class="text-outline">
                Track your uploaded assignments and submission status.
            </p>

        </div>

        <div class="overflow-x-auto rounded-2xl border border-outline-variant">

            <table class="w-full min-w-[850px]">

                <thead class="bg-[#2f302e] text-white">

                    <tr>

                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-[0.15em]">
                            Assignment
                        </th>

                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-[0.15em]">
                            Files
                        </th>

                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-[0.15em]">
                            Submitted Date
                        </th>

                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-[0.15em]">
                            Actions
                        </th>

                    </tr>

                </thead>

                <tbody>

				    <c:choose>
				
				        <c:when test="${not empty submissions}">
				
				            <c:forEach var="submission"
				                       items="${submissions}">
				
				                <tr class="border-b border-outline-variant
				                           hover:bg-[#f8faf8]
				                           transition-colors">
				
				                    <!-- ASSIGNMENT -->
				                    <td class="px-6 py-5">
				
				                        <div>
				
				                            <p class="text-lg font-semibold text-on-surface">
				
				                                ${submission.assignmentTitle}
				
				                            </p>
				
				                            <p class="text-xs uppercase tracking-widest
				                                      text-on-surface-variant mt-1">
				
				                                Student Submission
				
				                            </p>
				
				                        </div>
				
				                    </td>
				
				                    <!-- FILES -->
				                    <td class="px-6 py-5">
				
				                        <div class="flex flex-col gap-3">
				
				                            <c:forEach var="file"
				                                       items="${submission.submissionFiles}">
				
				                                <input type="hidden"
				                                       class="submission-file-data"
				                                       data-submission-id="${submission.id}"
				                                       data-file-id="${file.id}"
				                                       data-file-name="${file.fileName}">
				
				                                <div class="flex items-center gap-3">
				
				                                    <a href="${pageContext.request.contextPath}/uploads/${file.fileName}"
				                                       download
				                                       class="font-semibold text-primary
				                                              hover:underline
				                                              max-w-[220px] truncate">
				
				                                        ${file.fileName}
				
				                                    </a>
				
				                                </div>
				
				                            </c:forEach>
				
				                        </div>
				
				                    </td>
				
				                    <!-- DATE -->
				                    <td class="px-6 py-5">
				
				                        ${submission.submissionDate}
				
				                    </td>
				
				                    <!-- ACTIONS -->
				                    <td class="px-6 py-5">
				
				                        <div class="flex justify-center items-center gap-5">
				
				                            <!-- EDIT -->
				                            <button type="button"
				                                    onclick="openEditSubmissionModal(${submission.id})"
				                                    class="material-symbols-outlined
				                                           text-outline hover:text-primary
				                                           transition-colors">
				
				                                edit
				
				                            </button>
				
				                            <!-- DELETE -->
				                            <a href="${pageContext.request.contextPath}/delete-submission?id=${submission.id}&assignment_id=${assignment.id}"
				                               class="material-symbols-outlined
				                                      text-red-500 hover:text-red-600
				                                      transition-colors">
				
				                                delete
				
				                            </a>
				
				                        </div>
				
				                    </td>
				
				                </tr>
				
				            </c:forEach>
				
				        </c:when>
				
				        <c:otherwise>
				
				            <tr>
				
				                <td colspan="4"
				                    class="py-16 text-center">
				
				                    <div class="flex flex-col
				                                items-center
				                                justify-center">
				
				                        <span class="material-symbols-outlined
				                                     text-[60px]
				                                     text-outline
				                                     mb-4">
				
				                            upload_file
				
				                        </span>
				
				                        <h3 class="text-2xl
				                                   font-black
				                                   text-on-background
				                                   mb-3">
				
				                            No Assignment Submissions Yet
				
				                        </h3>
				
				                        <p class="text-outline
				                                  max-w-md">
				
				                            You have not submitted any assignment
				                            files for this task yet.
				
				                        </p>
				
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

<!-- EDIT MODAL -->
<div id="editSubmissionModal"
     class="fixed top-0 left-[256px] right-0 bottom-0
            bg-black/40 hidden
            flex items-center justify-center
            z-50 pl-6 pr-6">

    <div class="bg-white rounded-3xl p-8 w-full max-w-2xl">

        <div class="flex items-center justify-between mb-6">

            <h2 class="text-2xl font-black text-on-background">
                Update Submission
            </h2>

            <button type="button"
                    onclick="closeEditSubmissionModal()"
                    class="material-symbols-outlined
                           text-outline hover:text-red-500">

                close

            </button>

        </div>

        <form action="${pageContext.request.contextPath}/edit-submission"
              method="post"
              enctype="multipart/form-data"
              class="space-y-6">

            <input type="hidden"
                   id="edit_submission_id"
                   name="submission_id">

            <!-- CURRENT FILES -->
            <div>

                <label class="block text-sm font-bold uppercase
                             tracking-[0.15em] text-outline mb-4">

                    Current Files

                </label>

                <div id="existingFilesContainer"
                     class="space-y-3">

                </div>

            </div>

            <!-- NEW FILES -->
            <div>

                <label class="block text-sm font-bold uppercase
                             tracking-[0.15em] text-outline mb-3">

                    Upload New Files

                </label>

                <input type="file"
                       id="updated_file"
                       name="updated_file[]"
                       multiple
                       class="block w-full text-sm text-outline
                              file:mr-4
                              file:py-3
                              file:px-6
                              file:rounded-xl
                              file:border-0
                              file:bg-primary
                              file:text-on-primary
                              file:font-semibold
                              hover:file:bg-[#475a49]
                              cursor-pointer">

            </div>

            <!-- BUTTONS -->
            <div class="flex justify-end gap-4 pt-4">

                <button type="button"
                        onclick="closeEditSubmissionModal()"
                        class="px-6 py-3 rounded-xl
                               border border-outline-variant
                               text-outline font-semibold">

                    Cancel

                </button>

                <button type="submit"
                        class="bg-primary hover:bg-[#475a49]
                               text-on-primary px-8 py-3
                               rounded-xl font-bold">

                    Update Submission

                </button>

            </div>

        </form>

    </div>

</div>
```

<script>

    const dropZone =
        document.getElementById("dropZone");

    const fileInput =
        document.getElementById("submission_file");

    let selectedFiles = [];

    // FILE CHANGE
    fileInput.addEventListener("change", (e) => {

        const files =
            Array.from(e.target.files);

        files.forEach(file => {
            selectedFiles.push(file);
        });

        syncInputFiles();
        renderFileList();
    });

    // DRAG EVENTS
    ["dragenter", "dragover", "dragleave", "drop"]
        .forEach(eventName => {

            dropZone.addEventListener(
                eventName,
                (e) => {

                    e.preventDefault();
                    e.stopPropagation();
                },
                false
            );
        });

    // DROP
    dropZone.addEventListener(
        "drop",
        (e) => {

            const files =
                Array.from(
                    e.dataTransfer.files
                );

            files.forEach(file => {
                selectedFiles.push(file);
            });

            syncInputFiles();
            renderFileList();
        },
        false
    );

    // RENDER FILES
    function renderFileList() {

        const fileList =
            document.getElementById("fileList");

        fileList.innerHTML = "";

        selectedFiles.forEach((file, index) => {

            const chip =
                document.createElement("div");

            chip.className =
                "flex items-center gap-3 " +
                "bg-[#eef6ef] border border-[#d7e8d8] " +
                "text-primary px-4 py-3 rounded-2xl shadow-sm";

            chip.innerHTML =
                `
                <span class="material-symbols-outlined text-primary">
                    description
                </span>

                <span class="max-w-[140px] truncate font-medium text-sm">
                    ${file.name}
                </span>

                <button type="button"
                        onclick="removeFile(${index})"
                        class="material-symbols-outlined
                               text-red-500 hover:text-red-600
                               transition-colors text-[20px]">

                    close

                </button>
                `;

            fileList.appendChild(chip);
        });
    }

    // REMOVE FILE
    function removeFile(index) {

        selectedFiles.splice(index, 1);

        syncInputFiles();
        renderFileList();
    }

    // SYNC INPUT FILES
    function syncInputFiles() {

        const dt =
            new DataTransfer();

        selectedFiles.forEach(file => {
            dt.items.add(file);
        });

        fileInput.files = dt.files;
    }

    // OPEN EDIT MODAL
    function openEditSubmissionModal(
        submissionId
    ) {

        document.getElementById(
            "edit_submission_id"
        ).value = submissionId;

        const container =
            document.getElementById(
                "existingFilesContainer"
            );

        container.innerHTML = "";

        const files =
            document.querySelectorAll(
                `.submission-file-data[data-submission-id="${submissionId}"]`
            );

        files.forEach(file => {

            const fileId =
                file.dataset.fileId;

            const fileName =
                file.dataset.fileName;

            const row =
                document.createElement("div");

            row.className =
                "flex items-center justify-between " +
                "bg-[#f8faf8] border border-outline-variant " +
                "rounded-2xl px-4 py-3";

            row.innerHTML =
                `
                <div class="flex items-center gap-3">

                    <span class="material-symbols-outlined text-primary">
                        description
                    </span>

                    <span class="max-w-[220px] truncate
                                 font-medium text-on-background">

                        ${fileName}

                    </span>

                </div>

                <a href="${pageContext.request.contextPath}/delete-submission-file?file_id=${fileId}&assignment_id=${assignment.id}"
                		class="material-symbols-outlined
                          text-red-500 hover:text-red-600
                          transition-colors">

                    delete

                </a>
                `;

            container.appendChild(row);
        });

        const modal =
            document.getElementById(
                "editSubmissionModal"
            );

        modal.classList.remove("hidden");
        modal.classList.add("flex");
    }

    // CLOSE MODAL
    function closeEditSubmissionModal() {

        const modal =
            document.getElementById(
                "editSubmissionModal"
            );

        modal.classList.remove("flex");
        modal.classList.add("hidden");
    }
    
    id="submitBtn"

</script>

</div>