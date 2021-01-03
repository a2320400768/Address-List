package com.qst.servlet;

import com.qst.bean.User;
import com.qst.dao.UserDAO;

import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        User user = new User(username, password);
        int judge;

        PrintWriter out=response.getWriter();


        if((user!=null)&&(!user.getUsername().equals(""))) {
            if (!(password.equals(""))) {
                if(!(password2.equals(""))){
                    if(password.equals(password2)){
                        UserDAO userDAO = new UserDAO();
                        boolean flag = userDAO.saveUser(user);
                        if (flag) {
                            /*out.write("{\"flag\":true}");*/
                            out.write("6");
                            out.flush();
                            out.close();
                            judge=4;
                            request.getSession().setAttribute("judge",judge);
                            response.sendRedirect("login.jsp");
                        } else {
                            /*out.write("{\"flag\":false}");*/
                            out.write("5");
                            out.flush();
                            out.close();
                            judge=3;
                            request.getSession().setAttribute("judge",judge);
                            //request.getRequestDispatcher("register.jsp").forward(request, response);
                        }
                    }else {
                        out.write("4");
                        out.flush();
                        out.close();
                    }

                }else {
                    out.write("3");
                    out.flush();
                    out.close();
                }


            }else {
                /*ut.write("{\"flag\":false}");*/
                out.write("2");
                out.flush();
                out.close();
                //judge=2;
                //request.getSession().setAttribute("judge",judge);
                ///response.sendRedirect("register.jsp");
            }
        }else{
           /* out.write("{\"flag\":false}");*/
            out.write("1");
            out.flush();
            out.close();
           // judge=1;
            //request.getSession().setAttribute("judge",judge);
            //response.sendRedirect("register.jsp");
        }
    }
}
