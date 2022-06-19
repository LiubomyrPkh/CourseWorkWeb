package controllers;

import db.DAOFactory;
import db.entity.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
        String error = (String) session.getAttribute("error");

        if(error != null) {
            request.setAttribute("error", error);
            session.removeAttribute("error");
        }

        if(loggedUser != null) {
            response.sendRedirect("profile");
        } else {
            request.getRequestDispatcher("/views/registration.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        //email already exist in database
        if(DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserDAO().getUserByEmail(email) != null) {
            session.setAttribute("error", "This email already taken");
            return;
        }

        user.setEmail(email);
        user.setPassword(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)));
        user.setFirst_name(request.getParameter("firstName"));
        user.setLast_name(request.getParameter("lastName"));
        user.setRole(User.Role.USER);

        DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserDAO().createUser(user);

        if(user.getUser_id() == 0) {
            //insert new user error
            request.getSession().setAttribute("error", "New user cannot be created");
        } else {
            request.getSession().setAttribute("loggedUser", user);
        }

        response.sendRedirect("registration");
    }
}
