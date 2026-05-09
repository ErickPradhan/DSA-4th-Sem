<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>EduTech IT - Register</title>

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/auth.css">

</head>

<body>

    <!-- HEADER -->
    <header class="header">

        <h1 class="header-title">

            EduTech IT

        </h1>

    </header>

    <!-- MAIN -->
    <main class="main-container">

        <div class="login-card">

            <!-- TITLE -->
            <div class="title-container">

                <h2 class="main-title">

                    Create Account

                </h2>

                <p class="subtitle">

                    Join our learning platform today

                </p>

            </div>

            <!-- ERROR -->
            <% if(request.getAttribute("error") != null){ %>

                <div class="error-message">

                    <%= request.getAttribute("error") %>

                </div>

            <% } %>

            <!-- SUCCESS -->
            <% if(request.getAttribute("success") != null){ %>

                <div class="success-message">

                    <%= request.getAttribute("success") %>

                </div>

            <% } %>

            <!-- FORM -->
            <form
                action="register"
                method="post"
                autocomplete="off"
                class="login-form"
                id="registerForm">

                <!-- NAME -->
                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label">

                            First Name

                        </label>

                        <input
                            type="text"
                            name="firstName"
                            required
                            value="${param.firstName}"
                            placeholder="John"
                            class="form-input">

                    </div>

                    <div class="form-group">

                        <label class="form-label">

                            Last Name

                        </label>

                        <input
                            type="text"
                            name="lastName"
                            required
                            value="${param.lastName}"
                            placeholder="Doe"
                            class="form-input">

                    </div>

                </div>

                <!-- EMAIL -->
                <div class="form-group">

                    <label class="form-label">

                        Email Address

                    </label>

                    <input
                        type="email"
                        name="email"
                        required
                        value="${param.email}"
                        placeholder="name@university.edu"
                        class="form-input">

                </div>

                <!-- PASSWORD -->
                <div class="form-group">

                    <label class="form-label">

                        Password

                    </label>

                    <input
                        type="password"
                        name="password"
                        required
                        id="password"
                        placeholder="Create a strong password"
                        class="form-input">

                    <div class="password-strength">

                        <div
                            class="strength-bar"
                            id="strengthBar">
                        </div>

                    </div>

                    <div
                        class="strength-text"
                        id="strengthText">
                    </div>

                </div>

                <!-- CONFIRM PASSWORD -->
                <div class="form-group">

                    <label class="form-label">

                        Confirm Password

                    </label>

                    <input
                        type="password"
                        name="confirmPassword"
                        required
                        id="confirmPassword"
                        placeholder="Confirm your password"
                        class="form-input">

                    <div
                        class="password-match-error"
                        id="passwordMatchError">

                        ⚠️ Passwords do not match

                    </div>

                    <p class="password-hint">

                        Passwords must be at least
                        8 characters with uppercase,
                        lowercase, and numbers.

                    </p>

                </div>

                <!-- ROLE -->
                <div class="role-group">

                    <label class="role-label">

                        I am a:

                    </label>

                    <div class="role-options">

                        <label class="role-option">

                            <input
                                type="radio"
                                name="role"
                                value="student"
                                checked
                                class="role-radio">

                            <span class="role-text">

                                Student

                            </span>

                        </label>

                        <label class="role-option">

                            <input
                                type="radio"
                                name="role"
                                value="admin"
                                class="role-radio">

                            <span class="role-text">

                                Administrator

                            </span>

                        </label>

                    </div>

                </div>

                <!-- ADMIN KEY -->
                <div
                    class="admin-key-container"
                    id="adminKeyContainer"
                    style="display: none;">

                    <label class="form-label admin-key-label">

                        Admin Access Key

                    </label>

                    <input
                        type="password"
                        name="adminKey"
                        id="adminKey"
                        placeholder="Enter admin access key"
                        class="form-input">

                </div>

                <!-- TERMS -->
                <div class="terms-container">

                    <input
                        type="checkbox"
                        name="termsAccepted"
                        required
                        class="terms-checkbox"
                        id="termsCheckbox">

                    <label
                        class="terms-label"
                        for="termsCheckbox">

                        I agree to the

                        <a href="#" class="terms-link">

                            Terms of Service

                        </a>

                        and

                        <a href="#" class="terms-link">

                            Privacy Policy

                        </a>

                    </label>

                </div>

                <!-- BUTTON -->
                <button
                    type="submit"
                    class="login-button">

                    Create Account

                </button>

            </form>

            <!-- LOGIN -->
            <div class="register-container">

                Already have an account?

                <a
                    href="login"
                    class="register-link">

                    Sign in here

                </a>

            </div>

        </div>

    </main>

    <!-- SCRIPT -->
    <script>

        const passwordInput =
            document.getElementById('password');

        const confirmInput =
            document.getElementById('confirmPassword');

        const strengthBar =
            document.getElementById('strengthBar');

        const strengthText =
            document.getElementById('strengthText');

        const matchError =
            document.getElementById('passwordMatchError');

        // PASSWORD STRENGTH
        function checkPasswordStrength(password) {

            let strength = 0;

            if (password.length >= 8) strength++;

            if (
                password.match(/[a-z]/) &&
                password.match(/[A-Z]/)
            ) strength++;

            if (password.match(/\d/)) strength++;

            if (password.match(/[^a-zA-Z\d]/)) strength++;

            return strength;
        }

        // UPDATE STRENGTH
        function updateStrengthIndicator() {

            const password =
                passwordInput.value.trim();

            const strength =
                checkPasswordStrength(password);

            strengthBar.className =
                'strength-bar';

            strengthText.textContent = '';

            if (password.length === 0) {

                return;
            }

            if (strength === 1) {

                strengthBar.classList.add(
                    'strength-weak'
                );

                strengthText.textContent =
                    'Weak password';

            } else if (strength === 2) {

                strengthBar.classList.add(
                    'strength-medium'
                );

                strengthText.textContent =
                    'Medium password';

            } else {

                strengthBar.classList.add(
                    'strength-strong'
                );

                strengthText.textContent =
                    'Strong password';
            }
        }

        // PASSWORD MATCH
        function validatePasswordMatch() {

            if (
                confirmInput.value.length > 0 &&
                passwordInput.value !==
                confirmInput.value
            ) {

                matchError.classList.add('show');

                confirmInput.style.borderColor =
                    '#ef4444';

            } else {

                matchError.classList.remove('show');

                confirmInput.style.borderColor =
                    '#d1d5db';
            }
        }

        // PASSWORD EVENTS
        passwordInput.addEventListener(
            'input',
            function() {

                updateStrengthIndicator();

                validatePasswordMatch();
            }
        );

        confirmInput.addEventListener(
            'input',
            validatePasswordMatch
        );

        // FORM VALIDATION
        document.getElementById('registerForm')
            .addEventListener('submit', function(e) {

            if (
                passwordInput.value !==
                confirmInput.value
            ) {

                e.preventDefault();

                matchError.classList.add('show');

                confirmInput.style.borderColor =
                    '#ef4444';

                confirmInput.focus();
            }
        });

        // ROLE TOGGLE
        const roleRadios =
            document.querySelectorAll(
                'input[name="role"]'
            );

        const adminKeyContainer =
            document.getElementById(
                'adminKeyContainer'
            );

        roleRadios.forEach(radio => {

            radio.addEventListener('change', () => {

                if (
                    radio.value === 'admin' &&
                    radio.checked
                ) {

                    adminKeyContainer.style.display =
                        'block';

                } else {

                    adminKeyContainer.style.display =
                        'none';
                }
            });
        });

    </script>

    <!-- SUCCESS MODAL -->
    <c:if test="${registrationSuccess}">

        <div class="modal-overlay">

            <div class="modal-container animate-entrance">

                <div class="glass-panel">

                    <div class="modal-logo">

                        <span class="modal-logo-text">

                            EduTech IT

                        </span>

                    </div>

                    <div class="icon-circle glow-circle">

                        <svg
                            class="icon-success"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                            stroke-width="2">

                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                d="M5 13l4 4L19 7" />

                        </svg>

                    </div>

                    <div class="modal-text">

                        <h2 class="modal-title">

                            Welcome!

                        </h2>

                        <p class="modal-message">

                            Account created successfully.
                            Redirecting to login...

                        </p>

                    </div>

                    <div class="progress-container">

                        <div
                            class="progress-bar animate-progress">

                            <div class="progress-shimmer">
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script>

            setTimeout(() => {

                window.location.href =
                    "${pageContext.request.contextPath}/login";

            }, 2000);

        </script>

    </c:if>

</body>

</html>