package com.servlet;

import com.dao.VolunteerDAO;
import com.entity.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addVolunteer")
public class AddVolunteerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // 获取表单参数
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String phone = req.getParameter("phone");
        String serviceType = req.getParameter("serviceType");
        int serviceTime = Integer.parseInt(req.getParameter("serviceTime"));

        // 调用DAO新增
        VolunteerDAO dao = new VolunteerDAO();
        dao.add(new Volunteer(name, age, phone, serviceType, serviceTime));

        // 重定向到列表页
        resp.sendRedirect(req.getContextPath() + "/listVolunteer");
    }
}