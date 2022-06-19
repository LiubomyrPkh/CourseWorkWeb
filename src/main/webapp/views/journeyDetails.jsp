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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/JourneyDetailsPage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ProfilePage.css" />

    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script>
</head>

<body style="display: flex; flex-direction: column">
<jsp:include page='header.jsp'>
    <jsp:param name="loggedUser" value="${sessionScope.loggedUser}"/>
</jsp:include>
<div class="journey-details-page journey-details-page-block layout">
    <div class="journey-details-page-flex layout">
        <h3 class="journey-details-page-subtitle3 layout"> </h3>
        <h1 class="journey-details-page-hero-title layout">${requestScope.journey.start_address_id.street}, ${requestScope.journey.start_address_id.house_num}   ${requestScope.journey.start_time}</h1>
        <div class="journey-details-page-block1 layout">
            <div class="journey-details-page-flex1 layout">
                <div class="journey-details-page-flex2 layout">
                    <h3 class="journey-details-page-subtitle2 layout">Sending:</h3>
                    <div class="journey-details-page-flex2-spacer"></div>
                    <h5 class="journey-details-page-highlights1 layout">${requestScope.journey.from_city}</h5>
                    <div class="journey-details-page-flex2-spacer1"></div>
                    <div class="journey-details-page-text-body layout">${requestScope.journey.start_time}</div>
                </div>
                <div class="journey-details-page-flex3 layout">
                    <h3 class="journey-details-page-subtitle2 layout">Arrival:</h3>
                    <div class="journey-details-page-flex3-spacer"></div>
                    <h5 class="journey-details-page-highlights1 layout1">${requestScope.journey.to_city}</h5>
                    <div class="journey-details-page-flex3-spacer1"></div>
                    <div class="journey-details-page-text-body layout1">${requestScope.journey.end_time}</div>
                </div>
                <div class="journey-details-page-flex4 layout">
                    <h3 class="journey-details-page-subtitle2 layout">Total time:</h3>
                    <div class="journey-details-page-flex4-spacer"></div>
                    <h5 class="journey-details-page-highlights1 layout">${Math.abs(Integer.parseInt(requestScope.journey.start_time.split(":")[0] ) - 24) + Integer.parseInt(requestScope.journey.end_time.split(":")[0]) > 24 ? Math.abs(Integer.parseInt(requestScope.journey.start_time.split(":")[0] ) - 24) + Integer.parseInt(requestScope.journey.end_time.split(":")[0]) - 24 : Math.abs(Integer.parseInt(requestScope.journey.start_time.split(":")[0] ) - 24) + Integer.parseInt(requestScope.journey.end_time.split(":")[0])} hours</h5>
                </div>
                <hr class="journey-details-page-line1 layout" />
                <div class="journey-details-page-flex5 layout">
                    <h3 class="journey-details-page-subtitle2 layout">Number of free seats:</h3>
                    <div class="journey-details-page-flex5-spacer"></div>
                    <h5 class="journey-details-page-highlights1 layout">
                        <c:if test="${requestScope.occupiedSeats == 0}">
                            ${requestScope.journey.places}
                        </c:if>
                        <c:if test="${requestScope.occupiedSeats != 0}">
                            ${requestScope.journey.places - requestScope.occupiedSeats}
                        </c:if>
                    </h5>
                </div>
                <div class="journey-details-page-flex5 layout1">
                    <h3 class="journey-details-page-subtitle2 layout">Bus number:</h3>
                    <div class="journey-details-page-flex5-spacer1"></div>
                    <h5 class="journey-details-page-highlights1 layout">${requestScope.journey.bus_number}</h5>
                </div>
                <hr class="journey-details-page-line layout" />
                <div class="journey-details-page-flex7 layout">
                    <h3 class="journey-details-page-subtitle2 layout">Collection place:</h3>
                    <div class="journey-details-page-flex7-spacer"></div>
                    <h5 class="journey-details-page-highlights1 layout">${requestScope.journey.start_address_id.street}, ${requestScope.journey.start_address_id.house_num}</h5>
                </div>
                <div class="journey-details-page-flex8 layout">
                    <h3 class="journey-details-page-subtitle2 layout">Place of disembarkation:</h3>
                    <div class="journey-details-page-flex8-spacer"></div>
                    <h5 class="journey-details-page-highlights1 layout">${requestScope.journey.end_address_id.street}, ${requestScope.journey.end_address_id.house_num}</h5>
                </div>
                <div class="journey-details-page-flex9 layout">
                    <h5 class="journey-details-page-highlights layout">Cost:</h5>
                    <div class="journey-details-page-flex9-spacer"></div>
                    <h3 class="journey-details-page-subtitle1 layout">${requestScope.journey.cost}$</h3>
                    <div class="journey-details-page-flex9-spacer1"></div>
                    <div class="journey-details-page-flex9-item">

                        <form action="journeyDetails?id=${requestScope.journey.journey_id}" method="post">
                            <div class="journey-details-page-block2 layout">
                                <c:if test="${requestScope.isUserBoughtTicket}">
                                    <input type="submit" value="Cancel ticket" class="journey-details-page-subtitle layout"/>
                                </c:if>
                                <c:if test="${!requestScope.isUserBoughtTicket}">
                                    <input type="submit" value="Buy now" class="journey-details-page-subtitle layout"/>
                                </c:if>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <c:if test="${sessionScope.loggedUser.role.toString().equals('ADMIN')}">
            <h1 class="journey-details-page-hero-title layout">Passengers</h1>
            <div class="journey-details-page-block1 layout">
                <div class="journey-details-page-flex1 layout">
                    <c:if test="${requestScope.passengers != null}">
                        <c:forEach var="passenger" items="${requestScope.passengers}">
                            <h5 class="journey-details-page-highlights layout" >${passenger.first_name} ${passenger.last_name}</h5>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.passengers == null}">
                        <h5 class="journey-details-page-highlights layout" >No passengers found</h5>
                    </c:if>
                </div>
            </div>
        </c:if>


    </div>
</div>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
