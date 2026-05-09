<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTech IT - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>

<body>

    <!-- HEADER -->
    <header class="header">
        <h1 class="header-title">EduTech IT</h1>
    </header>

    <!-- MAIN -->
    <main class="main-container">
        <div class="login-card">
            
            <!-- TITLE -->
            <div class="title-container">
                <h2 class="main-title">Welcome Back</h2>
                <p class="subtitle">Access your institutional learning platform.</p>
            </div>

            <!-- ERROR MESSAGE -->
            <% if(request.getAttribute("error") != null){ %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <!-- LOGIN FORM -->
            <form action="login" method="post" autocomplete="new-password" class="login-form">
                
                <!-- EMAIL -->
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <input type="email" autocomplete="off" name="email" required 
                           placeholder="name@university.edu" class="form-input">
                </div>

                <!-- PASSWORD WITH TOGGLE - ONLY ONE VERSION -->
                <div class="form-group">
				
				    <label class="form-label">
				
				        Password
				
				    </label>
				
				    <input
				        type="password"
				        id="loginPassword"
				        name="password"
				        autocomplete="new-password"
				        required
				        autocomplete="current-password"
				        placeholder="••••••••"
				        class="form-input">
				
				</div>

                <!-- BUTTON -->
                <button type="submit" class="login-button">Login</button>
            </form>

            <!-- REGISTER -->
            <div class="register-container">
                Don't have an account?
                <a href="register" class="register-link">Register here</a>
            </div>
        </div>
    </main>

    <!-- LOGOUT SUCCESS MODAL -->
    <c:if test="${logoutSuccess}">
        <div class="modal-overlay">
            <div class="modal-container animate-entrance">
                <div class="glass-panel">
                    <div class="modal-logo">
                        <span class="modal-logo-text">EduTech IT</span>
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
                        <h2 class="modal-title">Logged Out</h2>
                        <p class="modal-message">Redirecting to login...</p>
                    </div>
                    <div class="progress-container">
                        <div class="progress-bar animate-progress">
                            <div class="progress-shimmer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            setTimeout(() => {
                window.location.href = "${pageContext.request.contextPath}/login";
            }, 1600);
        </script>
    </c:if>

    <!-- LOGIN SUCCESS MODAL -->
    <c:if test="${loginSuccess}">
        <div class="modal-overlay">
            <div class="modal-container animate-entrance">
                <div class="glass-panel">
                    <div class="modal-logo">
                        <span class="modal-logo-text">EduTech IT</span>
                    </div>
                    <div class="icon-circle glow-circle">
                        <svg class="icon-success" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                        </svg>
                    </div>
                    <div class="modal-text">
                        <h2 class="modal-title">Login Successful</h2>
                        <p class="modal-message">Redirecting to your dashboard...</p>
                    </div>
                    <div class="progress-container">
                        <div class="progress-bar animate-progress">
                            <div class="progress-shimmer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            setTimeout(() => {
                window.location.href = "${redirectUrl}";
            }, 1800);
        </script>
    </c:if>

    

</body>

</html>