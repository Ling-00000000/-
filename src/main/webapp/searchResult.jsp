<%--
  Created by IntelliJ IDEA.
  User: 肖从硕
  Date: 2025/12/18
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>志愿者查询结果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* 全局样式重置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', 'Arial', sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }

        /* 容器样式 */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            padding: 30px;
            overflow: hidden;
        }

        /* 标题样式 */
        .title {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 10px;
            position: relative;
            padding-bottom: 15px;
        }

        .title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: #007bff;
            border-radius: 3px;
        }

        /* 关键词样式 */
        .keyword {
            text-align: center;
            margin: 20px 0 30px;
            color: #666;
            font-size: 16px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 8px;
        }

        .keyword span {
            color: #007bff;
            font-weight: 500;
            padding: 2px 8px;
            background-color: rgba(0, 123, 255, 0.1);
            border-radius: 4px;
        }

        /* 表格样式 */
        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        th {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            color: white;
            font-weight: 500;
            padding: 15px 10px;
            text-align: center;
            position: relative;
        }

        th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 1px;
            background-color: rgba(255, 255, 255, 0.2);
        }

        td {
            padding: 12px 10px;
            text-align: center;
            border-bottom: 1px solid #e9ecef;
            color: #495057;
            transition: background-color 0.3s ease;
        }

        tr:nth-child(even) td {
            background-color: #f8f9fa;
        }

        tr:hover td {
            background-color: #e8f4ff;
            transform: scale(1.01);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* 无数据样式 */
        .no-data {
            text-align: center;
            margin: 50px 0;
            color: #999;
            font-size: 18px;
            padding: 40px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 1px dashed #dee2e6;
        }

        .no-data::before {
            content: '📋';
            font-size: 36px;
            display: block;
            margin-bottom: 15px;
        }

        /* 动画效果 */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            animation: fadeIn 0.5s ease-out;
        }

        table {
            animation: fadeIn 0.7s ease-out;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px 15px;
                margin: 20px auto;
            }

            .title {
                font-size: 24px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px 5px;
            }

            .keyword {
                font-size: 14px;
                padding: 8px;
            }

            .no-data {
                padding: 20px;
                font-size: 16px;
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
<div class="container">
    <h2 class="title">志愿者查询结果</h2>
    <div class="keyword">查询关键词：<span>${keyword}</span></div>

    <c:if test="${not empty volunteerList}">
        <table>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>手机号</th>
                <th>服务类型</th>
                <th>服务时长</th>
            </tr>
            <c:forEach items="${volunteerList}" var="vol">
                <tr>
                    <td>${vol.id}</td>
                    <td>${vol.name}</td>
                    <td>${vol.age}</td>
                    <td>${vol.phone}</td>
                    <td>${vol.serviceType}</td>
                    <td>${vol.serviceTime}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty volunteerList}">
        <div class="no-data">暂无匹配的志愿者信息</div>
    </c:if>
</div>
</body>
</html>