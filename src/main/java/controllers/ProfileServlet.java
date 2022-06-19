package controllers;

import db.DAOFactory;
import db.entity.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String error = (String) session.getAttribute("error");
        String message = (String) session.getAttribute("message");

        if(error != null) {
            request.setAttribute("error", error);
            session.removeAttribute("error");
        }

        if(message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message");
        }

        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");
        String email = request.getParameter("email");
        User userForUpdate = new User();
        boolean firstNameTest = !Objects.equals(request.getParameter("firstName"), user.getFirst_name());
        boolean lastNameTest = !Objects.equals(request.getParameter("lastName"), user.getLast_name());
        boolean emailTest = !Objects.equals(email, user.getEmail());
        boolean passwordTest = !BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)).equals(user.getPassword()) &&
                request.getParameter("password") != null &&
                !request.getParameter("password").equals("");


        if(firstNameTest || lastNameTest || emailTest || passwordTest) {
            if(firstNameTest) {
                userForUpdate.setFirst_name(request.getParameter("firstName"));
            } else {
                userForUpdate.setFirst_name(user.getFirst_name());
            }

            if(lastNameTest) {
                userForUpdate.setLast_name(request.getParameter("lastName"));
            } else {
                userForUpdate.setLast_name(user.getLast_name());
            }

            if(emailTest) {
                if(DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserDAO().getUserByEmail(email) != null) {
                    session.setAttribute("error", "This email already taken");
                    return;
                }
                userForUpdate.setEmail(email);
            } else {
                userForUpdate.setEmail(user.getEmail());
            }

            if(passwordTest) {
                userForUpdate.setPassword(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(10)));
            } else {
                userForUpdate.setPassword(user.getPassword());
            }

            userForUpdate.setRole(user.getRole());
            userForUpdate.setUser_id(user.getUser_id());

            if(DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserDAO().updateUser(userForUpdate)) {
                session.removeAttribute("loggedUser");
                session.setAttribute("loggedUser", userForUpdate);
                session.setAttribute("message", "User has been updated");
            } else {
                session.setAttribute("error", "User cannot be update");
            }
        } else {
            session.setAttribute("message", "Nothing to update");
        }

        response.sendRedirect("profile");
    }
}