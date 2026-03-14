<%--
  Created by IntelliJ IDEA.
  User: 肖从硕
  Date: 2025/12/17
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>志愿者列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 全局样式重置与基础配置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', 'PingFang SC', Arial, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 20px 0;
        }

        /* 标题样式 */
        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #007bff, #0056b3);
            border-radius: 3px;
        }

        /* 搜索表单样式 */
        .search-form {
            text-align: center;
            margin: 0 auto 30px;
            padding: 20px;
            width: 80%;
            max-width: 800px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .search-form input {
            padding: 10px 15px;
            width: 70%;
            max-width: 400px;
            border: 1px solid #e1e5e9;
            border-radius: 6px 0 0 6px;
            font-size: 15px;
            transition: all 0.3s ease;
            outline: none;
        }

        .search-form input:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
        }

        .search-form button {
            padding: 10px 25px;
            background: linear-gradient(90deg, #007bff 0%, #0056b3 100%);
            color: white;
            border: none;
            border-radius: 0 6px 6px 0;
            cursor: pointer;
            font-size: 15px;
            transition: all 0.3s ease;
            margin-left: -1px;
        }

        .search-form button:hover {
            background: linear-gradient(90deg, #0069d9 0%, #004a99 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
        }

        /* 表格样式 */
        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 85%;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        th {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            color: white;
            font-weight: 500;
            padding: 15px 10px;
            text-align: center;
            font-size: 15px;
            position: relative;
        }

        th:not(:last-child)::after {
            content: '';
            position: absolute;
            right: 0;
            top: 10%;
            height: 80%;
            width: 1px;
            background: rgba(255, 255, 255, 0.2);
        }

        td {
            border-bottom: 1px solid #f0f2f5;
            padding: 12px 10px;
            text-align: center;
            font-size: 14px;
            color: #495057;
            transition: background-color 0.3s ease;
        }

        tr:nth-child(even) td {
            background-color: #f8f9fa;
        }

        tr:hover td {
            background-color: #e8f4ff;
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* 操作按钮样式 */
        td a {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 13px;
            margin: 0 3px;
            transition: all 0.2s ease;
        }

        td a:first-child {
            background-color: #28a745;
            color: white;
        }

        td a:first-child:hover {
            background-color: #218838;
            box-shadow: 0 2px 5px rgba(40, 167, 69, 0.2);
        }

        td a:last-child {
            background-color: #dc3545;
            color: white;
        }

        td a:last-child:hover {
            background-color: #c82333;
            box-shadow: 0 2px 5px rgba(220, 53, 69, 0.2);
        }

        /* 添加按钮样式 */
        div[style*="text-align: center"] {
            margin-top: 30px !important;
        }

        div[style*="text-align: center"] a {
            text-decoration: none;
            padding: 10px 25px;
            background: linear-gradient(90deg, #17a2b8 0%, #138496 100%);
            color: white;
            border-radius: 6px;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        div[style*="text-align: center"] a:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(23, 162, 184, 0.2);
        }

        /* 响应式适配 */
        @media (max-width: 768px) {
            h2 {
                font-size: 24px;
            }

            .search-form {
                width: 95%;
                padding: 15px;
            }

            .search-form input {
                width: 65%;
                font-size: 14px;
            }

            .search-form button {
                padding: 10px 20px;
                font-size: 14px;
            }

            table {
                width: 98%;
                font-size: 13px;
            }

            th, td {
                padding: 10px 5px;
            }

            td a {
                padding: 4px 8px;
                font-size: 12px;
                display: inline-block;
                margin: 2px 0;
            }
        }

        /* 滚动条美化 */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb {
            background: #007bff;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<h2>志愿者管理</h2>

<div class="search-form">
    <form action="${pageContext.request.contextPath}/searchVolunteer" method="get" target="_blank">
        <input type="text" name="keyword" placeholder="请输入姓名/手机号/服务类型查询" required>
        <button type="submit">查询</button>
    </form>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>手机号</th>
        <th>服务类型</th>
        <th>服务时长</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${volunteerList}" var="vol">
        <tr>
            <td>${vol.id}</td>
            <td>${vol.name}</td>
            <td>${vol.age}</td>
            <td>${vol.phone}</td>
            <td>${vol.serviceType}</td>
            <td>${vol.serviceTime}</td>
            <td>
                <a href="editVolunteer?id=${vol.id}">编辑</a>
                <a href="deleteVolunteer?id=${vol.id}" onclick="return confirm('确定删除？')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div style="text-align: center; margin-top: 20px;">
    <a href="add.jsp">添加志愿者</a>
</div>
</body>
</html>