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

@WebServlet(urlPatterns = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkMan man=(LinkMan)request.getSession().getAttribute("man");
        String telephonenumber=(String)request.getSession().getAttribute("telephonenumber");

        int updatejudge;
        LinkManDAO linkManDAO=new LinkManDAO();
        PrintWriter out=response.getWriter();

        boolean flag=linkManDAO.updateLinkMan(man,telephonenumber);
        if(flag){
            out.write("2");
            out.flush();
            out.close();
            updatejudge=1;
            request.getSession().setAttribute("updatejudge",updatejudge);
            request.getRequestDispatcher("MainfaceServlet").forward(request,response);
        }
        else {
            out.write("1");
            out.flush();
            out.close();
            updatejudge=2;
            request.getSession().setAttribute("updatejudge",updatejudge);
            request.getRequestDispatcher("modifylinkman.jsp").forward(request,response);
        }

    }
}
