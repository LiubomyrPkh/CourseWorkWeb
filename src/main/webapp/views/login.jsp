<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link
            rel="stylesheet"
            type="text/css"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/LoginPage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ProfilePage.css" />


    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/px2code/posize/build/v1.00.5.js"></script>
</head>

<body style="display: flex; flex-direction: column">
<jsp:include page='header.jsp'>
    <jsp:param name="loggedUser" value="${sessionScope.loggedUser}"/>
</jsp:include>
<div class="login-page login-page-block layout">
    <h3 class="login-page-subtitle1 layout"> </h3>
    <div class="login-page-block-spacer"></div>
    <form action="login" method="post">
        <div class="login-page-block-item">
            <div class="login-page-flex layout">
                <h1 class="login-page-hero-title layout">Welcome back</h1>
                <div class="login-page-text-body-box layout">
                    <div class="login-page-text-body">
                        <span class="login-page-text-body-span0">Don`t have an account? </span>
                        <span class="login-page-text-body-span1"><a href="registration">Sign up</a></span>
                    </div>
                </div>
                <div class="login-page-group layout">
                    <div class="login-page-group1 layout"><label>
                        <input type="email" name="email">
                    </label></div>
                    <div class="login-page-block3 layout"><h5 class="login-page-highlights layout">Email</h5></div>
                </div>
                <div class="login-page-group layout">
                    <div class="login-page-cover-block layout">
                        <label>
                            <input type="password" name="password">
                        </label>
                    </div>
                    <div class="login-page-block2 layout"><h5 class="login-page-highlights layout">Password</h5></div>

                </div>
                <div class="login-page-small-text-body layout">Forgot password?</div>
                <div>${requestScope.error}</div>
                <div class="login-page-block1 layout"><input type="submit" value="Log in" class="login-page-subtitle layout"/></div>
            </div>
        </div>

    </form>
    <div class="login-page-block-spacer1"></div>
    <div class="login-page-block-item1">
        <div class="login-page-cover-block1 layout">
            <div style="--src:url(${pageContext.request.contextPath}/static/img/dd950cbeee9b341b090a22b1fa97c271.png)" class="login-page-image layout"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
