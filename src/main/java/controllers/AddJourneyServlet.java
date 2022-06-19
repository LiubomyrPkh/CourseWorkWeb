package controllers;

import db.DAOFactory;
import db.entity.Address;
import db.entity.Journey;
import db.entity.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/addJourney")
public class AddJourneyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/addJourney.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Journey journey = new Journey();
        HttpSession session = request.getSession();

        journey.setFrom_city(request.getParameter("from"));
        journey.setTo_city(request.getParameter("to"));
        journey.setCost(Double.valueOf(request.getParameter("price")));
        journey.setPlaces(Integer.valueOf(request.getParameter("places")));
        journey.setBus_number(request.getParameter("busNumber"));
        journey.setStart_time(request.getParameter("startTime"));
        journey.setEnd_time(request.getParameter("endTime"));

        Address startAddress = new Address(request.getParameter("startPlace").trim().replaceAll("[^a-zA-Z0-9 ]", "").split(" "));
        Address startAddressDublicateTest = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressByStreetAndHouseNumber(startAddress.getStreet(), startAddress.getHouse_num());
        if(startAddressDublicateTest == null) {
            DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().createAddress(startAddress);
        } else {
            startAddress = startAddressDublicateTest;
        }

        Address endAddress = new Address(request.getParameter("endPlace").trim().replaceAll("[^a-zA-Z0-9 ]", "").split(" "));
        Address endAddressDublicateTest = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().getAddressByStreetAndHouseNumber(endAddress.getStreet(), endAddress.getHouse_num());
        if(endAddressDublicateTest == null) {
            DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getAddressDAO().createAddress(endAddress);
        } else {
            endAddress = endAddressDublicateTest;
        }

        journey.setStart_address_id(startAddress);
        journey.setEnd_address_id(endAddress);

        DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getJourneyDAO().createJourney(journey);

        if(journey.getJourney_id() == 0) {
            //insert new user error
            session.setAttribute("error", "New journey cannot be created");
        }

        response.sendRedirect("journeys");
    }
}