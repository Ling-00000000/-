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

@WebServlet("/searchVolunteer")
public class SearchVolunteerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // 获取查询关键词
        String keyword = req.getParameter("keyword").trim();
        VolunteerDAO dao = new VolunteerDAO();
        List<Volunteer> volunteerList = dao.findByKeyword(keyword);

        // 传递数据到结果页
        req.setAttribute("volunteerList", volunteerList);
        req.setAttribute("keyword", keyword);
        // 转发到独立的查询结果页面
        req.getRequestDispatcher("/searchResult.jsp").forward(req, resp);
    }
}