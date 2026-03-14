<%--
  Created by IntelliJ IDEA.
  User: 肖从硕
  Date: 2025/12/17
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增志愿者</title>
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
            padding: 40px 20px;
        }

        /* 页面容器 - 卡片式布局 */
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            padding: 30px;
        }

        /* 标题样式 */
        h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, #28a745, #218838);
            border-radius: 3px;
        }

        /* 表单分组样式 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
            font-weight: 500;
            font-size: 15px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e1e5e9;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            outline: none;
        }

        /* 输入框聚焦效果 */
        .form-group input:focus {
            border-color: #28a745;
            box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.1);
        }

        /* 必填项提示 */
        .form-group label.required::after {
            content: '*';
            color: #dc3545;
            margin-left: 5px;
        }

        /* 按钮组样式 */
        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            text-decoration: none;
            border: none;
        }

        /* 提交按钮 */
        .btn-submit {
            background: linear-gradient(90deg, #28a745 0%, #218838 100%);
            color: white;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.2);
        }

        /* 返回按钮 */
        .btn-back {
            background: linear-gradient(90deg, #6c757d 0%, #5a6268 100%);
            color: white;
        }

        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(108, 117, 125, 0.2);
        }

        /* 响应式适配 - 移动端优化 */
        @media (max-width: 480px) {
            .container {
                padding: 20px 15px;
                margin: 0 10px;
            }

            h1 {
                font-size: 22px;
            }

            .form-group input {
                padding: 10px 12px;
                font-size: 14px;
            }

            .btn {
                padding: 10px 20px;
                font-size: 14px;
                flex: 1;
            }

            .btn-group {
                gap: 10px;
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
            background: #28a745;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>新增志愿者信息</h1>
    <form action="addVolunteer" method="post">
        <div class="form-group">
            <label for="name" class="required">姓名</label>
            <input type="text" id="name" name="name" required placeholder="请输入志愿者姓名">
        </div>

        <div class="form-group">
            <label for="age" class="required">年龄</label>
            <input type="number" id="age" name="age" required min="1" max="120" placeholder="请输入志愿者年龄">
        </div>

        <div class="form-group">
            <label for="phone" class="required">联系电话</label>
            <input type="text" id="phone" name="phone" required placeholder="请输入联系电话">
        </div>

        <div class="form-group">
            <label for="serviceType" class="required">服务类型</label>
            <input type="text" id="serviceType" name="serviceType" required placeholder="例如：社区服务、环保志愿、敬老服务">
        </div>

        <div class="form-group">
            <label for="serviceTime">服务时长（小时）</label>
            <input type="number" id="serviceTime" name="serviceTime" value="0" min="0" placeholder="默认初始时长为0">
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-submit">提交新增</button>
            <a href="listVolunteer" class="btn btn-back">返回列表</a>
        </div>
    </form>
</div>
</body>
</html>