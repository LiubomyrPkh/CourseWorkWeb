package controllers;

import db.DAOFactory;
import db.entity.Journey;
import db.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/journeyDetails")
public class JourneyDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int journeyId;
        List<User> passengers;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");
        if(request.getParameter("id") != null) {
            journeyId = Integer.parseInt(request.getParameter("id"));
            Journey journey = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getJourneyDAO().getJourneyById(journeyId);
            Integer count = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().getOccupiedSeats(journeyId);
            Boolean isUserBoughtTicket = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().isUserBoughtTicket(user.getUser_id(), journeyId);
            passengers = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().getAllUsers(journeyId);
            request.setAttribute("occupiedSeats", count);
            request.setAttribute("isUserBoughtTicket", isUserBoughtTicket);
            request.setAttribute("passengers", passengers);
            request.setAttribute("journey", journey);
        }
        request.getRequestDispatcher("/views/journeyDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int journeyId = 0;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");
        if(request.getParameter("id") != null) {
            journeyId = Integer.parseInt(request.getParameter("id"));
            Boolean isUserBoughtTicket = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().isUserBoughtTicket(user.getUser_id(), journeyId);
            if(isUserBoughtTicket) {
                DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().removeUserJourney(user.getUser_id(), journeyId);
            } else {
                DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserJourneyDAO().createUserJourney(user.getUser_id(), journeyId);
            }
        }
        response.sendRedirect("journeyDetails?id=" + journeyId);
    }
}