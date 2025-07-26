package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import com.sun.net.httpserver.HttpServer;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.dao.UserDAO;
import com.bean.User;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("signup".equals(action)) {
    	handleSignup(request, response);
      } else if ("login".equals(action)) {
           handleLogin(request, response);
        }
    	PrintWriter pw=response.getWriter();
    	pw.println("<html><body bgcolor='yellow'>Welcome<\\body><\\html>");
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (userDAO.userExists(email)) {
            request.setAttribute("message", "User already exists. Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password); // Add hashing for production

            if (userDAO.registerUser(user)) {
                request.setAttribute("message", "Signup successful. Please login.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Signup failed. Try again.");
                request.getRequestDispatcher("Signup.jsp").forward(request, response);
            }
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (userDAO.validateLogin(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("from.html");
        } else {
            request.setAttribute("message", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}