package com.qst.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ChangeServlet")
public class ChangeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pagenum=Integer.valueOf(request.getParameter("pagenum"));
        request.getSession().setAttribute("pagenum",pagenum);
        request.getRequestDispatcher("mainface.jsp").forward(request,response);
    }
}
