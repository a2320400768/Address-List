package com.qst.servlet;

import com.qst.bean.User;
import com.qst.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        User user=new User(username,password);
        int judge;

        UserDAO userDAO=new UserDAO();
        boolean flag=userDAO.readUser(user);
        PrintWriter out=response.getWriter();

            if(!username.equals("")) {
                if (flag) {
                    out.write("3");;
                    out.flush();
                    out.close();
                    judge = 7;
                    request.getSession().setAttribute("judge", judge);
                    request.getSession().setAttribute("username", username);
                    request.getRequestDispatcher("MainfaceServlet").forward(request, response);
                } else {
                    out.write("2");;
                    out.flush();
                    out.close();
                    /*judge = 6;
                    request.getSession().setAttribute("judge", judge);
                    response.sendRedirect("login.jsp");*/
                }
            }else {
                out.write("1");;
                out.flush();
                out.close();
                /*judge=5;
                request.getSession().setAttribute("judge", judge);
                response.sendRedirect("login.jsp");*/
            }
    }
}
