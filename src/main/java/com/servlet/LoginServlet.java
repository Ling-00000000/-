package com.servlet;
import com.dao.AdminDAO;
import com.entity.Admin;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 解决中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        // 获取表单参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        // 调用DAO验证
        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.login(username, password);
        if (admin != null) {
            // 登录成功，存入Session
            HttpSession session = req.getSession();
            session.setAttribute("loginAdmin", admin);
            // 重定向到志愿者列表页
            resp.sendRedirect(req.getContextPath() + "/listVolunteer");
        } else {
            // 登录失败，返回登录页并提示
            req.setAttribute("msg", "账号或密码错误！");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}