<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="home-page-section1__flex1 layout">
    <h3 class="home-page-section1__subtitle layout"></h3>
    <div class="home-page-section1__flex1-spacer"></div>
    <h5 class="home-page-section1__highlights3 layout"><a href="home">Home</a></h5>
    <div class="home-page-section1__flex1-spacer1"></div>
    <h5 class="home-page-section1__highlights3 layout"><a href="home#aboutUs">About us</a></h5>
    <div class="home-page-section1__flex1-spacer1"></div>
    <h5 class="home-page-section1__highlights3 layout"><a href="journeys">Bus routes</a></h5>
    <div class="home-page-section1__flex1-spacer3"></div>
    <h5 class="home-page-section1__highlights3 layout"><a href="home#services">Services</a></h5>
    <div class="home-page-section1__flex1-spacer4"></div>
    <h5 class="home-page-section1__highlights3 layout"><a href="home#contacts">Contacts</a></h5>
    <div class="home-page-section1__flex1-spacer5"></div>
    <c:choose>
        <c:when test="${sessionScope.loggedUser == null}">
            <h5 class="home-page-section1__highlights4 layout"><a href="login">Sign in</a></h5>
        </c:when>
        <c:otherwise>
            <a href="profile"><div class="profile-page-flex1-item1">
                <div
                        style="--src:url(${pageContext.request.contextPath}/static/img/3d79b9f7378d6e751a9d7219c5bafa50.png)"
                        class="profile-page-cover-block layout"
                >
                    <div
                            style="--src:url(${pageContext.request.contextPath}/static/img/e17713388f92f6ff02e14669a3d21c54.png)"
                            class="profile-page-icon2 layout"
                    ></div>
                </div>
            </div></a>
        </c:otherwise>
    </c:choose>

</div>