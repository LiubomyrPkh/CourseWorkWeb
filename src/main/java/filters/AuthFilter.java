package filters;

import db.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        Map<User.Role,List<String>> allowedPages = new HashMap<User.Role,List<String>>() {{
            put(User.Role.USER, Arrays.asList("home", "journeys", "profile", "login", "registration", "journeyDetails", "logout"));
            put(User.Role.ADMIN, Arrays.asList("home", "journeys", "profile", "addJourney", "login", "registration", "journeyDetails", "logout"));
        }};

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);

        String loginURI = request.getContextPath() + "/login";
        String registerURI = request.getContextPath() + "/registration";
        String mainPage = request.getContextPath() + "/home";
        String staticDirectory = "/static/";
        String requestURI = request.getRequestURI();

        boolean loggedIn = session != null && session.getAttribute("loggedUser") != null;
        boolean loginRequest = requestURI.equals(loginURI);
        boolean registerRequest = requestURI.equals(registerURI);
        boolean mainPageRequest = requestURI.equals(mainPage);
        boolean isStaticResource = requestURI.contains(staticDirectory);

        if(loggedIn) {
            User.Role role = ((User) session.getAttribute("loggedUser")).getRole();
            List<String> pages = allowedPages.get(role);
            if(pages.stream().anyMatch(requestURI::endsWith)) {
                filterChain.doFilter(request, response);
            } else {
                if (registerRequest || loginRequest || mainPageRequest || isStaticResource) {
                    filterChain.doFilter(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
                }
            }
        } else {
            if (registerRequest || loginRequest || mainPageRequest || isStaticResource) {
                filterChain.doFilter(request, response);
            } else {
                response.sendRedirect(loginURI);
            }
        }


    }
}
