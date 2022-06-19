package controllers;

import db.DAOFactory;
import db.entity.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
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
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession session =  request.getSession();

        User user = DAOFactory.getDAOFactory(DAOFactory.DBTypes.MySQL).getUserDAO().getUserByEmail(email);

        if(user == null || !BCrypt.checkpw(request.getParameter("password"), user.getPassword())) {
            session.setAttribute("error", "Wrong email or password");
        } else {
            session.setAttribute("loggedUser", user);
        }

        response.sendRedirect("login");
    }
}
