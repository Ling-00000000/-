package com.servlet;

import com.dao.VolunteerDAO;
import com.entity.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listVolunteer")
public class ListVolunteerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        VolunteerDAO dao = new VolunteerDAO();
        List<Volunteer> list = dao.findAll();
        req.setAttribute("volunteerList", list);
        req.getRequestDispatcher("/list.jsp").forward(req, resp);
    }
}