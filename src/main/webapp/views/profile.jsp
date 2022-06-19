<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ProfilePage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/HomePage.css" />

    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script>
</head>

<body style="display: flex; flex-direction: column">
<div class="profile-page profile-page-block layout">
    <div class="profile-page-flex layout">
        <jsp:include page='header.jsp'>
            <jsp:param name="loggedUser" value="${sessionScope.loggedUser}"/>
        </jsp:include>
        <div class="profile-page-group layout">
            <div style="--src:url(${pageContext.request.contextPath}/static/img/e618ce702e089a9d10d9781fe58dd068.png)" class="profile-page-icon1 layout"></div>
            <div style="--src:url(${pageContext.request.contextPath}/static/img/df0cabb838af4cf2d3265a5798c7a15e.png)" class="profile-page-icon2 layout1"></div>
        </div>
        <h3 class="profile-page-subtitle layout">${sessionScope.loggedUser.role}</h3>
        <form action="profile" method="post">
            <div class="profile-page-block1 layout">
                <h4 class="profile-page-highlights2 layout">Your first name</h4>
                <div class="profile-page-group layout1">
                    <hr class="profile-page-line layout" />
                    <label>
                        <input type="text" value="${sessionScope.loggedUser.first_name}" name="firstName" class="profile-page-highlights1 layout"/>
                    </label>
                </div>
            </div>
            <div class="profile-page-block1 layout1">
                <h4 class="profile-page-highlights2 layout">Your last name</h4>
                <div class="profile-page-group layout2">
                    <hr class="profile-page-line layout" />
                    <label>
                        <input type="text" value="${sessionScope.loggedUser.last_name}" name="lastName" class="profile-page-highlights1 layout"/>
                    </label>
                </div>
            </div>
            <div class="profile-page-block1 layout2">
                <h4 class="profile-page-highlights2 layout">Your email</h4>
                <div class="profile-page-group layout3">
                    <hr class="profile-page-line layout" />
                    <label>
                        <input type="text" value="${sessionScope.loggedUser.email}" name="email" class="profile-page-highlights1 layout"/>
                    </label>
                </div>
            </div>
            <div class="profile-page-block1 layout3">
                <h4 class="profile-page-highlights2 layout">Change password</h4>
                <div class="profile-page-group layout4">
                    <hr class="profile-page-line layout" />
                    <label>
                        <input type="text" value="" name="password" class="profile-page-highlights1 layout"/>
                    </label>
                </div>
                <input type="submit" value="Save Changes">
            </div>
        </form>

        <div class="massage">${requestScope.message}</div>
        <div class="error">${requestScope.error}</div>

        <div class="profile-page-flex2 layout">
            <div class="profile-page-flex2-item">
                <div style="--src:url(${pageContext.request.contextPath}/static/img/4e5d8077afaa902572627fc7f50ac383.png)" class="profile-page-icon layout"></div>
            </div>
            <div class="profile-page-flex2-spacer"></div>
            <form action="logout" method="post">
                <input type="submit" value="Log out" class="profile-page-highlights layout"/>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
