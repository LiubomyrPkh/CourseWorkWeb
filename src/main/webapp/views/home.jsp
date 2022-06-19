<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/HomePage.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ProfilePage.css" />

    <script type="text/javascript" src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="https://unpkg.com/headroom.js@0.12.0/dist/headroom.min.js"></script>
</head>

<body style="display: flex; flex-direction: column">
<main class="home-page home-page-main layout">
    <!-- ======= section1 ======= -->
    <section class="home-page-section1__section1 layout">
        <div class="home-page-section1__flex layout">
            <jsp:include page='header.jsp'>
                <jsp:param name="loggedUser" value="${sessionScope.loggedUser}"/>
            </jsp:include>
            <div class="home-page-section1__block1 layout">
                <div class="home-page-section1__flex2 layout">
                    <div class="home-page-section1__flex3 layout">
                        <div class="home-page-section1__flex3-item">
                            <div class="home-page-section1__flex4 layout">
                                <h1 class="home-page-section1__hero-title layout">Transportation by bus</h1>
                                <h5 class="home-page-section1__highlights2 layout">
                                    Our campaign ensures the safe transportation of our passengers. We will ensure a comfortable move
                                    at the best price.
                                </h5>
                            </div>
                        </div>
                        <div class="home-page-section1__flex3-spacer"></div>
                        <div class="home-page-section1__flex3-item1">
                            <div
                                    style="--src:url(${pageContext.request.contextPath}/static/img/6e817aeaf6026a7808218cc2e9f3391d.png)"
                                    class="home-page-section1__image layout"
                            ></div>
                        </div>
                    </div>
                    <div class="home-page-section1__block2 layout">
                        <form action="journeys" method="get" class="home-page-section1__flex5 layout">
                            <div class="home-page-section1__flex5-item">
                                <div class="home-page-section1__block3 layout">
                                    <div class="home-page-section1__block4 layout">
                                        <input name="from" placeholder="From" class="home-page-section1__subtitle2 layout"/>
                                        <div
                                                style="--src:url(${pageContext.request.contextPath}/static/img/34b80aa85ff201ad45ad1170aaf00e8e.png)"
                                                class="home-page-section1__icon layout"
                                        ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="home-page-section1__flex5-spacer"></div>
                            <div class="home-page-section1__flex5-item">
                                <div class="home-page-section1__block5 layout">
                                    <div class="home-page-section1__block6 layout">
                                        <input name="to" placeholder="To" class="home-page-section1__subtitle2 layout">
                                        <div
                                                style="--src:url(${pageContext.request.contextPath}/static/img/34b80aa85ff201ad45ad1170aaf00e8e.png)"
                                                class="home-page-section1__icon layout"
                                        ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="home-page-section1__flex5-spacer"></div>
                            <div class="home-page-section1__flex5-spacer"></div>
                            <div class="home-page-section1__flex5-item1">
                                <div class="home-page-section1__block9 layout">
                                    <div class="home-page-section1__block10 layout">
                                        <div class="home-page-section1__block10-item">
                                            <div
                                                    style="--src:url(${pageContext.request.contextPath}/static/img/4d77e70e75be80ad92b11f8052436e6a.png)"
                                                    class="home-page-section1__icon layout2"
                                            ></div>
                                        </div>
                                        <div class="home-page-section1__block10-spacer"></div>
                                        <h3 class="home-page-section1__subtitle2 layout2">1</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="home-page-section1__flex5-spacer1"></div>
                            <div class="home-page-section1__flex5-item2">
                                <div class="home-page-section1__block11 layout">
                                    <input type="submit" value="Find" class="home-page-section1__medium-title layout"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <comment content="======= End section1 =======" break="true"></comment
    ><!-- ======= section2 ======= -->
    <section id="aboutUs" class="home-page-section2__section2 layout">
        <div class="home-page-section2__flex6 layout">
            <div class="home-page-section2__flex6-item">
                <div
                        style="--src:url(${pageContext.request.contextPath}/static/img/f403feb276ae1bfa4816344fc21cbddb.png)"
                        class="home-page-section2__image2 layout"
                ></div>
            </div>
            <div class="home-page-section2__flex6-spacer"></div>
            <div class="home-page-section2__flex6-item1">
                <div class="home-page-section2__flex7 layout">
                    <h1 class="home-page-section2__hero-title1 layout">About us</h1>
                    <h5 class="home-page-section2__highlights2-box layout">
                <pre class="home-page-section2__highlights2">
Passenger transportation in our bus company is provided by highly professional drivers who are well aware of the optimal bus transportation routes. </pre
                >
                    </h5>
                    <h5 class="home-page-section2__highlights21 layout">
                        Ordering a bus in our company means ordering a bus in excellent technical condition with a professional
                        driver, clean cabin and high-class comfort. Our customers will not remain indifferent and will be
                        satisfied with the trip.
                    </h5>
                    <div class="home-page-section2__block12 layout">
                        <h3 class="home-page-section2__subtitle3 layout">Know more</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <comment content="======= End section2 =======" break="true"></comment
    ><!-- ======= section3 ======= -->
    <section id="services" class="home-page-section3__section3 layout">
        <div class="home-page-section3__flex8 layout">
            <div class="home-page-section3__flex8-item">
                <div class="home-page-section3__flex9 layout">
                    <h1 class="home-page-section3__hero-title1 layout">Services</h1>
                    <div class="home-page-section3__block13 layout">
                        <h3 class="home-page-section3__subtitle4 layout">Rent a bus with a driver</h3>
                        <div class="home-page-section3__block13-spacer"></div>
                        <div class="home-page-section3__block13-item">
                            <div class="home-page-section3__block14 layout">
                                <h3 class="home-page-section3__subtitle3 layout">100$</h3>
                            </div>
                        </div>
                    </div>
                    <div class="home-page-section3__block13 layout1">
                        <h3 class="home-page-section3__subtitle4 layout1">Passenger transportation</h3>
                        <div class="home-page-section3__block13-spacer1"></div>
                        <div class="home-page-section3__block13-item">
                            <div class="home-page-section3__block14 layout">
                                <h3 class="home-page-section3__subtitle3 layout1">15$</h3>
                            </div>
                        </div>
                    </div>
                    <div class="home-page-section3__block13 layout2">
                        <h3 class="home-page-section3__subtitle4 layout2">Bus transportation</h3>
                        <div class="home-page-section3__block13-spacer2"></div>
                        <div class="home-page-section3__block13-item">
                            <div class="home-page-section3__block14 layout">
                                <h3 class="home-page-section3__subtitle3 layout2">70$</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="home-page-section3__flex8-spacer"></div>
            <div class="home-page-section3__flex8-item">
                <div class="home-page-section3__flex10 layout">
                    <div class="home-page-section3__block13 layout3">
                        <h3 class="home-page-section3__subtitle4 layout3">Bus to the wedding</h3>
                        <div class="home-page-section3__block13-spacer3"></div>
                        <div class="home-page-section3__block13-item">
                            <div class="home-page-section3__block14 layout">
                                <h3 class="home-page-section3__subtitle3 layout3">200$</h3>
                            </div>
                        </div>
                    </div>
                    <div class="home-page-section3__block13 layout4">
                        <h3 class="home-page-section3__subtitle4 layout">Excursion bus</h3>
                        <div class="home-page-section3__block13-spacer4"></div>
                        <div class="home-page-section3__block13-item">
                            <div class="home-page-section3__block14 layout">
                                <h3 class="home-page-section3__subtitle3 layout">120$</h3>
                            </div>
                        </div>
                    </div>
                    <div class="home-page-section3__block13 layout5">
                        <h3 class="home-page-section3__subtitle4 layout4">Tourist trips</h3>
                        <div class="home-page-section3__block13-spacer5"></div>
                        <div class="home-page-section3__block13-item">
                            <div class="home-page-section3__block14 layout">
                                <h3 class="home-page-section3__subtitle3 layout">150$</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="home-page-section3__flex8-spacer1"></div>
            <div class="home-page-section3__flex8-item1">
                <div
                        style="--src:url(${pageContext.request.contextPath}/static/img/41f1d616c71680919aaa0cd5d281138b.png)"
                        class="home-page-section3__image3 layout"
                ></div>
            </div>
        </div>
    </section>
    <comment content="======= End section3 =======" break="true"></comment
    ><!-- ======= section4 ======= -->
    <section id="howWeWork" class="home-page-section4__section4 layout">
        <div class="home-page-section4__flex11 layout">
            <div class="home-page-section4__flex11-item">
                <div class="home-page-section4__flex12 layout">
                    <h1 class="home-page-section4__hero-title1 layout">How we work</h1>
                    <div class="home-page-section4__block17 layout">
                        <div class="home-page-section4__flex13 layout">
                            <div
                                    style="--src:url(${pageContext.request.contextPath}/static/img/1d5d2596aba8885934b6f8ee0ef72d4a.png)"
                                    class="home-page-section4__image6 layout"
                            ></div>
                            <h2 class="home-page-section4__medium-title1 layout">Find a route</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="home-page-section4__flex11-spacer"></div>
            <div class="home-page-section4__flex11-item1">
                <div
                        style="--src:url(${pageContext.request.contextPath}/static/img/30b3028ac871f29586a33b11fedf4683.png)"
                        class="home-page-section4__image7 layout"
                ></div>
            </div>
            <div class="home-page-section4__flex11-spacer"></div>
            <div class="home-page-section4__flex11-item2">
                <div class="home-page-section4__block16 layout">
                    <div class="home-page-section4__flex14 layout">
                        <div
                                style="--src:url(${pageContext.request.contextPath}/static/img/a2b4db580ce1b7ec0e4c7c8852989841.png)"
                                class="home-page-section4__image5 layout"
                        ></div>
                        <h2 class="home-page-section4__medium-title1 layout1">Fill in the details</h2>
                    </div>
                </div>
            </div>
            <div class="home-page-section4__flex11-spacer"></div>
            <div class="home-page-section4__flex11-item3">
                <div
                        style="--src:url(${pageContext.request.contextPath}/static/img/30b3028ac871f29586a33b11fedf4683.png)"
                        class="home-page-section4__image7 layout"
                ></div>
            </div>
            <div class="home-page-section4__flex11-spacer"></div>
            <div class="home-page-section4__flex11-item4">
                <div class="home-page-section4__block15 layout">
                    <div class="home-page-section4__flex15 layout">
                        <div
                                style="--src:url(${pageContext.request.contextPath}/static/img/5f1eeec54ccc205d9b62a9a57342b8d5.png)"
                                class="home-page-section4__image4 layout"
                        ></div>
                        <h2 class="home-page-section4__medium-title1 layout2">Pay</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <comment content="======= End section4 =======" break="true"></comment
    ><!-- ======= section5 ======= -->
    <section id="contacts" class="home-page-section5__section5 layout">
        <div class="home-page-section5__flex16 layout">
            <div class="home-page-section5__flex16-item">
                <div class="home-page-section5__flex17 layout">
                    <h1 class="home-page-section5__hero-title1 layout">Contacts</h1>
                    <h5 class="home-page-section5__highlights2 layout">
                        We will ensure a comfortable move at the best price.
                    </h5>
                    <h4 class="home-page-section5__highlights layout">Ukraine, Lviv</h4>
                    <h4 class="home-page-section5__highlights1 layout">bustravel9@gmail.com</h4>
                    <h4 class="home-page-section5__highlights3 layout">+380 68 52 15 584</h4>
                </div>
            </div>
            <div class="home-page-section5__flex16-spacer"></div>
            <div class="home-page-section5__flex16-item1">
                <div
                        style="--src:url(${pageContext.request.contextPath}/static/img/391de988373006dc11579f4002998ac1.png)"
                        class="home-page-section5__image8 layout"
                ></div>
            </div>
        </div>
    </section>
    <comment content="======= End section5 =======" break="true"></comment
    ><!-- ======= section6 ======= -->
    <section id="footer" class="home-page-section6__section6 layout">
        <div class="home-page-section6__cover-block layout">
            <div class="home-page-section6__flex18 layout">
                <h3 class="home-page-section6__subtitle layout"> </h3>
                <div class="home-page-section6__flex18-spacer"></div>
                <div class="home-page-section6__flex18-item">
                    <div class="home-page-section6__flex19 layout">
                        <h3 class="home-page-section6__subtitle1 layout">CONTACTS</h3>
                        <h4 class="home-page-section6__highlights layout">Ukraine, Lviv</h4>
                        <h4 class="home-page-section6__highlights1 layout">bustravel9@gmail.com</h4>
                        <h4 class="home-page-section6__highlights2 layout">+380 68 52 15 584</h4>
                    </div>
                </div>
                <div class="home-page-section6__flex18-spacer1"></div>
                <div class="home-page-section6__flex18-item1">
                    <div class="home-page-section6__flex20 layout">
                        <h3 class="home-page-section6__subtitle1 layout1">INFO</h3>
                        <h4 class="home-page-section6__highlights11 layout">About us</h4>
                        <h4 class="home-page-section6__highlights12 layout">Bus routes</h4>
                        <h4 class="home-page-section6__highlights13 layout">Sevices</h4>
                        <h4 class="home-page-section6__highlights14 layout">Contacts</h4>
                    </div>
                </div>
                <div class="home-page-section6__flex18-spacer2"></div>
                <div class="home-page-section6__flex18-item2">
                    <div class="home-page-section6__flex21 layout">
                        <h3 class="home-page-section6__subtitle11 layout">HELP &amp; SUPPORT</h3>
                        <h4 class="home-page-section6__highlights15 layout">Terms &amp; Conditions</h4>
                        <h4 class="home-page-section6__highlights16 layout">Privacy &amp; Cookie Policy</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ======= End section6 ======= -->

</main>
<script type="text/javascript">
    AOS.init();
</script>
</body>
</html>
