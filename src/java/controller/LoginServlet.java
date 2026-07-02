package controller;

import dto.UserDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LoginAuthenticator;

public class LoginServlet extends HttpServlet {

   
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDTO user  = new UserDTO();
        user.setEmail(email);
        user.setPassword(password);
        
    LoginAuthenticator  authenticator = new LoginAuthenticator ();
    boolean login = authenticator.isLogin(user);
    
    if(login)
    {
        HttpSession session= request.getSession(true);
        session.setAttribute("email", email);
        session.setAttribute("name", authenticator.getUserName());
         response.sendRedirect("dashboard.jsp");
    }
    else
    {
        response.sendRedirect("login.jsp");
    }
    
   
 }

}
