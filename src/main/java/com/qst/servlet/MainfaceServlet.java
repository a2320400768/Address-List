package com.qst.servlet;

import com.qst.bean.LinkMan;
import com.qst.dao.LinkManDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/MainfaceServlet")
public class MainfaceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username=(String)request.getSession().getAttribute("username");

        List<LinkMan> linkMan=new ArrayList<>();
        LinkManDAO linkManDAO=new LinkManDAO();
        linkMan=linkManDAO.showLinkMan(username);

        request.getSession().setAttribute("linkMan",linkMan);
        int pagenum=1;
        request.getSession().setAttribute("pagenum",pagenum);
        request.getRequestDispatcher("mainface.jsp").forward(request,response);
    }
}
