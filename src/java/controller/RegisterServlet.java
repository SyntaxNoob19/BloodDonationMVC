package controller;

import dto.UserDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.RegistrationAuthenticator;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDTO user = new UserDTO();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setBloodGroup(request.getParameter("blood_group"));
        user.setCity(request.getParameter("location"));
        user.setPhone(request.getParameter("phone")); 

        RegistrationAuthenticator authenticator = new RegistrationAuthenticator();
        boolean registered = authenticator.register(user);

        if (registered) {
            HttpSession session = request.getSession(true);
            session.setAttribute("email", user.getEmail());
            session.setAttribute("name", user.getName());
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }
}
