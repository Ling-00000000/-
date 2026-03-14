<%--
  Created by IntelliJ IDEA.
  User: 肖从硕
  Date: 2025/12/18
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录 - 社区志愿服务管理平台</title>
    <!-- 引入图标库增强视觉 -->
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* 全局重置与基础样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", "Segoe UI", sans-serif;
        }
        body {
            /* 渐变背景 */
            background: linear-gradient(135deg, #f9f7f5 0%, #e8dcc8 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        /* 登录卡片主体 */
        .login-box {
            width: 100%;
            max-width: 420px;
            padding: 45px;
            background: white;
            border-radius: 20px;
            /* 立体阴影 */
            box-shadow: 0 15px 35px rgba(139, 90, 43, 0.1),
            0 5px 15px rgba(139, 90, 43, 0.07);
            position: relative;
            overflow: hidden;
        }
        /* 顶部装饰渐变条 */
        .login-box::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, #8b5a2b, #a67c52, #8b5a2b);
        }
        /* 登录标题 */
        .login-title {
            text-align: center;
            margin-bottom: 35px;
            color: #333;
            font-size: 24px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .login-title i {
            color: #8b5a2b;
            font-size: 28px;
        }
        /* 错误提示框 */
        .msg {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 8px;
            background: rgba(231, 76, 60, 0.05);
            border: 1px solid rgba(231, 76, 60, 0.2);
            display: ${empty msg ? 'none' : 'block'}; /* 无提示时隐藏 */
        }
        /* 表单项目 */
        .form-item {
            margin-bottom: 25px;
            position: relative;
        }
        .form-item label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }
        /* 输入框样式 */
        .form-item input {
            width: 100%;
            padding: 14px 16px 14px 45px;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #faf9f7;
        }
        /* 输入框聚焦效果 */
        .form-item input:focus {
            outline: none;
            border-color: #8b5a2b;
            box-shadow: 0 0 0 3px rgba(139, 90, 43, 0.1);
            background: white;
        }
        /* 输入框图标 */
        .form-item i {
            position: absolute;
            left: 16px;
            top: 42px;
            color: #8b5a2b;
            font-size: 18px;
        }
        /* 登录按钮 */
        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #8b5a2b, #a67c52);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        .btn:hover {
            background: linear-gradient(135deg, #6d4520, #8b5a2b);
            /* 轻微放大 */
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 90, 43, 0.2);
        }
        .btn:active {
            transform: translateY(0);
        }
        /* 底部版权/提示 */
        .login-footer {
            text-align: center;
            margin-top: 25px;
            color: #999;
            font-size: 13px;
        }
        /* 响应式适配 */
        @media (max-width: 480px) {
            .login-box {
                padding: 30px 25px;
            }
            .login-title {
                font-size: 22px;
            }
            .form-item input {
                padding: 12px 14px 12px 40px;
            }
        }
    </style>
</head>
<body>
<div class="login-box">
    <!-- 登录标题（带图标） -->
    <h3 class="login-title">
        <i class="fas fa-shield-halved"></i>
        管理员登录
    </h3>

    <!-- 错误提示（有内容才显示） -->
    <div class="msg">${msg}</div>

    <!-- 登录表单（保留原有提交路径和参数） -->
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-item">
            <i class="fas fa-user"></i>
            <label>管理员账号</label>
            <input type="text" name="username" required placeholder="请输入账号">
        </div>
        <div class="form-item">
            <i class="fas fa-lock"></i>
            <label>登录密码</label>
            <input type="password" name="password" required placeholder="请输入密码">
        </div>
        <div class="form-item">
            <input type="submit" value="登录系统" class="btn">
        </div>
    </form>

    <!-- 底部装饰 -->
    <div class="login-footer">
        © 2025 社区志愿服务管理平台| 四人小组开发
    </div>
</div>
</body>
</html>