package com.qst.servlet;

import com.qst.bean.LinkMan;
import com.qst.dao.LinkManDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/SelectServlet")
public class SelectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String selectname=request.getParameter("selectlinkman");
        String selectdate=request.getParameter("selectdate");

        List<LinkMan> selectlinkMan=new LinkManDAO().selectLinkMan(selectname,selectdate);

        request.getSession().setAttribute("linkMan",selectlinkMan);

        if(!selectdate.equals("")){
            response.sendRedirect("mainface.jsp");
        }else {
            response.sendRedirect("MainfaceServlet");
        }

    }
}
