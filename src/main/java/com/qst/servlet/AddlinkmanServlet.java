package com.qst.servlet;

import com.qst.bean.LinkMan;
import com.qst.dao.LinkManDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/AddlinkmanServlet")
public class AddlinkmanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkMan man=(LinkMan)request.getSession().getAttribute("man");

        int addjudge;
        LinkManDAO linkManDAO=new LinkManDAO();

        boolean flag=linkManDAO.addLinkMan(man);
        PrintWriter out=response.getWriter();

        if(flag){
            out.write("4");
            out.flush();
            out.close();
            addjudge=1;
            request.getSession().setAttribute("addjudge",addjudge);
            response.sendRedirect("MainfaceServlet");
        }
        else {
            out.write("3");
            out.flush();
            out.close();
            addjudge=2;
            request.getSession().setAttribute("addjudge",addjudge);
            response.sendRedirect("addlinkman.jsp");
        }
    }
}
