package controllers;

import db.DAOFactory;
import db.entity.Journey;
import db.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/journeys")
public class JourneysServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Journey> journeyList;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String journeyId = request.getParameter("id");
        String myJourney = request.getParameter("param");
        Journey criteria = new Journey();

        if (journeyId != null) {
            getServletContext().getRequestDispatcher("/journeyDetails").forward(request, response);
            return;
        }

        if (from != null) {
            if (!from.trim().isEmpty()) {
                criteria.setFrom_city(from);
                request.setAttribute("from", from);
            }
        }

        if (to != null) {
            if (!to.trim().isEmpty()) {
                criteria.setTo_city(to);
                request.setAttribute("to", to);
            }
        }

        if(myJourney != null && myJourney.equals("my")) {
            journeyList = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().getAllUserJourneys(user.getUser_id());

            if(from != null) {
                journeyList = journeyList.stream().filter(x -> x.getFrom_city().equals(from)).collect(Collectors.toList());
            }

            if(to != null) {
                journeyList = journeyList.stream().filter(x -> x.getFrom_city().equals(to)).collect(Collectors.toList());
            }
        } else {
            journeyList = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getJourneyDAO().getAllJourneys(criteria);
        }

        request.setAttribute("journeyList", journeyList);

        request.getRequestDispatcher("/views/journeys.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("journeys");
    }
}