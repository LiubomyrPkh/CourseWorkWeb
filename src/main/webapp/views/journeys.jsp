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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/JourneysPage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ProfilePage.css" />

    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/px2code/posize/build/v1.00.6.js"></script>
</head>

<body style="display: flex; flex-direction: column">
<jsp:include page='header.jsp'>
    <jsp:param name="loggedUser" value="${sessionScope.loggedUser}"/>
</jsp:include>
<div class="journeys-page journeys-page-block layout">
    <div class="journeys-page-flex layout">
        <form action="journeys" method="get">
        <div class="journeys-page-block5 layout">
            <div class="journeys-page-flex1 layout">
                <div class="journeys-page-flex1-item">
                    <div class="journeys-page-block6 layout">
                        <div class="journeys-page-block7 layout">
                            <h3 class="journeys-page-subtitle2 layout">
                                <label>
                                    <input value="${requestScope.from}" type="text" name="from" placeholder="From">
                                </label>
                            </h3>
                            <div
                                    style="--src:url(${pageContext.request.contextPath}/static/img/34b80aa85ff201ad45ad1170aaf00e8e.png)"
                                    class="journeys-page-icon3 layout"
                            ></div>
                        </div>
                    </div>
                </div>
                <div class="journeys-page-flex1-spacer"></div>
                <div class="journeys-page-flex1-item">
                    <div class="journeys-page-block8 layout">
                        <div class="journeys-page-block9 layout">
                            <h3 class="journeys-page-subtitle2 layout">
                                <label>
                                    <input value="${requestScope.to}" type="text" name="to" placeholder="To">
                                </label>
                            </h3>
                            <div
                                    style="--src:url(${pageContext.request.contextPath}/static/img/34b80aa85ff201ad45ad1170aaf00e8e.png)"
                                    class="journeys-page-icon3 layout"
                            ></div>
                        </div>
                    </div>
                </div>
                <div class="journeys-page-flex1-spacer1"></div>
                <div class="journeys-page-flex1-item2">
                    <div class="journeys-page-block14 layout"><h2 class="journeys-page-medium-title2 layout"><input type="submit" value="Find"></h2></div>
                </div>
                <div class="journeys-page-flex1-item2">
                    <a href="journeys?param=my"><div class="journeys-page-block14 layout"><h2 class="journeys-page-medium-title2 layout">My routes</h2></div></a>
                </div>
                <c:if test="${sessionScope.loggedUser.role.toString().equals('ADMIN')}">
                    <div class="journeys-page-flex1-item2">
                        <a href="addJourney"><div class="journeys-page-block14 layout"><h2 class="journeys-page-medium-title2 layout">Add route</h2></div></a>
                    </div>
                </c:if>
            </div>
        </div>
        </form>


        <px-posize x="96.9px 1130fr 63.1fr" y="81px 320px 190fr">
            <div class="journeys-page-flex3">
            <c:if test="${requestScope.journeyList.size() > 0}">
                <c:forEach var="journey" items="${requestScope.journeyList}">
                <div class="journeys-page-flex3-item">
                    <div class="journeys-page-block1 layout">
                        <div class="journeys-page-flex4 layout">
                            <div class="journeys-page-flex5 layout">
                                <div class="journeys-page-flex5-item">
                                    <div class="journeys-page-flex6 layout">
                                        <h3 class="journeys-page-subtitle layout">${journey.start_time}</h3>
                                        <h5 class="journeys-page-highlights2 layout">
                                                ${Math.abs(Integer.parseInt(journey.start_time.split(":")[0] ) - 24) + Integer.parseInt(journey.end_time.split(":")[0]) > 24 ? Math.abs(Integer.parseInt(journey.start_time.split(":")[0] ) - 24) + Integer.parseInt(journey.end_time.split(":")[0]) - 24 : Math.abs(Integer.parseInt(journey.start_time.split(":")[0] ) - 24) + Integer.parseInt(journey.end_time.split(":")[0])} hours</h5>
                                        <h3 class="journeys-page-subtitle layout1">${journey.end_time}</h3>
                                    </div>
                                </div>
                                <div class="journeys-page-flex5-spacer"></div>
                                <div class="journeys-page-flex5-item1">
                                    <div class="journeys-page-group layout">
                                        <div
                                                style="--src:url(${pageContext.request.contextPath}/static/img/2ef5076c3c1b194c37c3cc85d12088dd.png)"
                                                class="journeys-page-cover-block layout"
                                        >
                                            <div
                                                    style="--src:url(${pageContext.request.contextPath}/static/img/05cdb31278b8c525f155a8597eb230e3.png)"
                                                    class="journeys-page-icon1 layout"
                                            ></div>
                                        </div>
                                        <div
                                                style="--src:url(${pageContext.request.contextPath}/static/img/05cdb31278b8c525f155a8597eb230e3.png)"
                                                class="journeys-page-icon1 layout1"
                                        ></div>
                                        <div
                                                style="--src:url(${pageContext.request.contextPath}/static/img/2ef5076c3c1b194c37c3cc85d12088dd.png)"
                                                class="journeys-page-icon layout"
                                        ></div>
                                        <div class="journeys-page-box1 layout"></div>
                                    </div>
                                </div>
                                <div class="journeys-page-flex5-spacer"></div>
                                <div class="journeys-page-flex5-item2">
                                    <div class="journeys-page-flex7 layout">
                                        <h2 class="journeys-page-medium-title layout">${journey.from_city}</h2>
                                        <h2 class="journeys-page-medium-title layout1">${journey.to_city}</h2>
                                    </div>
                                </div>
                                <div class="journeys-page-flex5-spacer1"></div>
                                <div class="journeys-page-flex5-item3">
                                    <div class="journeys-page-block2 layout">
                                        <h3 class="journeys-page-subtitle layout2">${journey.cost}$</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="journeys-page-flex8 layout">
                                <h5 class="journeys-page-highlights layout">Places:</h5>
                                <div class="journeys-page-flex8-spacer"></div>
                                <h5 class="journeys-page-highlights1 layout">${journey.places}</h5>
                            </div>
                            <div class="journeys-page-block3 layout">
                                <a href="journeys?id=${journey.journey_id}">
                                    <h3 class="journeys-page-subtitle1 layout">Details</h3>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="journeys-page-flex3-spacer"></div>
                </c:forEach>
            </c:if>

            <c:if test="${requestScope.journeyList.size() == 0}">
                <div class="noRoute">No bus route found</div>
                </c:if>


     </px-posize>
    </div>
</div>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
