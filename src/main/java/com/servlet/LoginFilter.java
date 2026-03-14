package com.servlet;
import com.entity.Admin;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
// 拦截除登录页、登录接口外的所有请求
@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String url = request.getRequestURI();

        // 放行登录页、登录接口、静态资源
        if (url.contains("login.jsp") || url.contains("login") || url.contains("css") || url.contains("js")) {
            chain.doFilter(req, resp);
            return;
        }

        // 检查Session中的管理员信息
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("loginAdmin");
        if (admin != null) {
            // 已登录，放行
            chain.doFilter(req, resp);
        } else {
            // 未登录，重定向到登录页
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}