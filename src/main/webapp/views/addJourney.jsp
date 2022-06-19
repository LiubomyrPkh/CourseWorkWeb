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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/AddJourneyPage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ProfilePage.css" />

    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script>
</head>

<body style="display: flex; flex-direction: column">
<jsp:include page='header.jsp'>
    <jsp:param name="loggedUser" value="${sessionScope.loggedUser}"/>
</jsp:include>
<div class="add-journey-page add-journey-page-block layout">
    <h3 class="add-journey-page-subtitle1 layout"> </h3>
    <div class="add-journey-page-block-spacer"></div>
    <div class="add-journey-page-block-item">
        <div class="add-journey-page-flex layout">
            <h1 class="add-journey-page-hero-title layout">Add new route</h1>
            <div class="add-journey-page-text-body layout">Here you can configure the details of the route.</div>


            <form action="addJourney" method="post">
                <div class="add-journey-page-group layout">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="City" type="text" name="from">
                        </label>
                    </div>
                    <div class="add-journey-page-block10 layout">
                        <h5 class="add-journey-page-highlights layout">From where</h5>
                    </div>
                </div>
                <div class="add-journey-page-group layout1">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="City" type="text" name="to">
                        </label>
                    </div>
                    <div class="add-journey-page-block9 layout"><h5 class="add-journey-page-highlights layout">To</h5></div>
                </div>
                <div class="add-journey-page-group layout2">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="00.0" type="text" name="price">
                        </label>
                    </div>
                    <div class="add-journey-page-block8 layout"><h5 class="add-journey-page-highlights layout">Prise</h5></div>
                </div>
                <div class="add-journey-page-group layout3">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="0" type="text" name="places">
                        </label>
                    </div>
                    <div class="add-journey-page-block7 layout">
                        <h5 class="add-journey-page-highlights layout">Number of seats</h5>
                    </div>
                </div>
                <div class="add-journey-page-group layout4">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="XX 0000 XX" type="text" name="busNumber">
                        </label>
                    </div>
                    <div class="add-journey-page-block6 layout">
                        <h5 class="add-journey-page-highlights layout">Bus number</h5>
                    </div>
                </div>
                <div class="add-journey-page-group layout5">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="Street, 0" type="text" name="startPlace">
                        </label>
                    </div>
                    <div class="add-journey-page-block5 layout">
                        <h5 class="add-journey-page-highlights layout">Collection place</h5>
                    </div>
                </div>
                <div class="add-journey-page-group layout6">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="00:00" type="text" name="startTime">
                        </label>
                    </div>
                    <div class="add-journey-page-block4 layout">
                        <h5 class="add-journey-page-highlights layout">Landing hour</h5>
                    </div>
                </div>
                <div class="add-journey-page-group layout7">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="Street, 0" type="text" name="endPlace">
                        </label>
                    </div>
                    <div class="add-journey-page-block3 layout">
                        <h5 class="add-journey-page-highlights layout">Place of disembarkation</h5>
                    </div>
                </div>
                <div class="add-journey-page-group layout8">
                    <div class="add-journey-page-box1 layout">
                        <label>
                            <input placeholder="00:00" type="text" name="endTime">
                        </label>
                    </div>
                    <div class="add-journey-page-block2 layout">
                        <h5 class="add-journey-page-highlights layout">Hour of disembarkation</h5>
                    </div>
                </div>
                <div class="add-journey-page-block1 layout">
                    <input value="Add Route" type="submit" class="add-journey-page-subtitle layout"/>
                </div>
            </form>


        </div>
    </div>
    <div class="add-journey-page-block-spacer1"></div>
    <div class="add-journey-page-block-item1">
        <div class="add-journey-page-group layout9">
            <div class="add-journey-page-box layout"></div>
            <div
                    style="--src:url(${pageContext.request.contextPath}/static/img/ec0ba4884d577a20a2c1e846ce290626.png)"
                    class="add-journey-page-image layout"
            ></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
