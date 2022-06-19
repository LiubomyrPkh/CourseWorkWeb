<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/RegistrationPage.css" />
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
<div class="registration-page registration-page-block layout">
    <h3 class="registration-page-subtitle1 layout"> </h3>
    <div class="registration-page-block-spacer"></div>
    <div class="registration-page-block-item">
        <div class="registration-page-flex layout">
            <h1 class="registration-page-hero-title layout">Create new account</h1>
            <div class="registration-page-text-body1-box layout">
                <div class="registration-page-text-body1">
              <span class="registration-page-text-body1-span0">Already have an account? </span
              ><span class="registration-page-text-body1-span1"><a href="login">Log in</a></span>
                </div>
            </div>
            <form action="registration" method="post">
                <div class="registration-page-group layout">
                    <div class="registration-page-box1 layout">
                        <label>
                            <input type="text" name="firstName">
                        </label>
                    </div>
                    <div class="registration-page-block5 layout">
                        <h5 class="registration-page-highlights layout">First name</h5>
                    </div>
                </div>
                <div class="registration-page-group layout1">
                    <div class="registration-page-box1 layout">
                        <label>
                            <input type="text" name="lastName">
                        </label>
                    </div>
                    <div class="registration-page-block4 layout">
                        <h5 class="registration-page-highlights layout">Last name</h5>
                    </div>
                </div>
                <div class="registration-page-group layout2">
                    <div class="registration-page-box1 layout">
                        <label>
                            <input type="email" name="email">
                        </label>
                    </div>
                    <div class="registration-page-block3 layout">
                        <h5 class="registration-page-highlights layout">Email</h5>
                    </div>
                </div>
                <div class="registration-page-group layout3">
                    <div class="registration-page-cover-block layout">
                        <label>
                            <input type="text" name="password">
                        </label>
                    </div>
                    <div class="registration-page-block2 layout">
                        <h5 class="registration-page-highlights layout">Password</h5>
                    </div>
                </div>
                <div class="registration-page-flex1 layout">
                    <div class="registration-page-flex1-item">
                        <div
                                style="--src:url(${pageContext.request.contextPath}/static/img/001c2105e93d12aab4dad80936404819.png)"
                                class="registration-page-icon layout">
                            <label>
                                <input type="checkbox" name="terms">
                            </label>
                        </div>
                    </div>
                    <div class="registration-page-flex1-spacer"></div>
                    <div class="registration-page-text-body layout">I agree with Term of Service and Pivacy Policy</div>
                </div>
                <div class="registration-page-block1 layout">
                    <input type="submit" value="Create an account" class="registration-page-subtitle layout"/>
                </div>
                <div>${requestScope.error}</div>
            </form>
        </div>
    </div>
    <div class="registration-page-block-item1">
        <div class="registration-page-cover-block1 layout">
            <div
                    style="--src:url(${pageContext.request.contextPath}/static/img/623c1a5b5fbeed320df2d6762172ed50.png)"
                    class="registration-page-image layout"
            ></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
