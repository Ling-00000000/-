package com.servlet;

import com.dao.VolunteerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteVolunteer")
public class DeleteVolunteerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        VolunteerDAO dao = new VolunteerDAO();
        dao.delete(id);
        resp.sendRedirect(req.getContextPath() + "/listVolunteer");
    }
}