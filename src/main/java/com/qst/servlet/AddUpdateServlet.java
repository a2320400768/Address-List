package com.qst.servlet;

import com.qst.bean.LinkMan;
import com.qst.dao.LinkManDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/AddUpdateServlet")
public class AddUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String username=(String)request.getSession().getAttribute("username");
        String name=request.getParameter("name");
        String telephonenumber=request.getParameter("telephonenumber");
        String remark=request.getParameter("remark");


        int judgement=(int)request.getSession().getAttribute("judgement");

        LinkMan man=new LinkMan(username,name,telephonenumber,remark);
        request.getSession().setAttribute("man",man);

        if(judgement==1){
            request.getRequestDispatcher("AddlinkmanServlet").forward(request,response);
        }else {
            request.getRequestDispatcher("UpdateServlet").forward(request,response);
        }


    }
}
