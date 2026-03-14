package com.servlet;
import com.dao.VolunteerDAO;
import com.entity.Volunteer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/editVolunteer")
public class EditVolunteerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String phone = req.getParameter("phone");
        String serviceType = req.getParameter("serviceType");
        int serviceTime = Integer.parseInt(req.getParameter("serviceTime"));
        Volunteer v = new Volunteer();
        v.setId(id);
        v.setName(name);
        v.setAge(age);
        v.setPhone(phone);
        v.setServiceType(serviceType);
        v.setServiceTime(serviceTime);

        VolunteerDAO dao = new VolunteerDAO();
        dao.update(v);
        resp.sendRedirect(req.getContextPath() + "/listVolunteer");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        VolunteerDAO dao = new VolunteerDAO();
        Volunteer volunteer = dao.findById(id);
        req.setAttribute("volunteer", volunteer);
        req.getRequestDispatcher("/edit.jsp").forward(req, resp);
    }
}