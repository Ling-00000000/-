# 志愿者管理系统
一个基于 Java Web 的志愿者信息管理平台，用于高效管理志愿者数据与业务流程。

## 技术栈
- **后端**：Java 8 + Servlet + JSTL
- **数据库**：MySQL 8.0
- **数据访问**：JDBC（PreparedStatement 防 SQL 注入）
- **服务器**：Tomcat 9
- **构建工具**：Maven

## 核心功能
- 用户登录/认证
- 志愿者信息增删改查
- 数据统计与可视化
- MVC 分层架构设计

## 项目亮点
- 采用分层架构（DAO/Service/Servlet），代码结构清晰易维护
- 实现 SQL 注入防护，保障数据安全
- 完整的数据库初始化脚本，开箱即用

## 🚀 项目运行演示
| 登录页面 | 主页面 | 新增页面 |
|:---:|:---:|:---:|
|![登录页](https://raw.githubusercontent.com/Ling-00000000/volunteer-management-system/main/picture/登录页.png)|![主页面](https://raw.githubusercontent.com/Ling-00000000/volunteer-management-system/main/picture/主页面.png)|![新增页面](https://raw.githubusercontent.com/Ling-00000000/volunteer-management-system/main/picture/新增页面.png)|

| 查询页面 | 更新页面 | 删除页面 |
|:---:|:---:|:---:|
|![查询页面](https://raw.githubusercontent.com/Ling-00000000/volunteer-management-system/main/picture/查询页面.png)|![更新页面](https://raw.githubusercontent.com/Ling-00000000/volunteer-management-system/main/picture/更新页面.png)|![删除页面](https://raw.githubusercontent.com/Ling-00000000/volunteer-management-system/main/picture/删除页面.png)|

## 使用说明
1. 导入 database 目录下的 SQL 脚本，初始化数据库
2. 修改 db.properties 中的数据库连接信息（用户名/密码）
3. 使用 Maven 构建项目，部署到 Tomcat 9 服务器
4. 访问 http://localhost:8080/项目名 即可使用

> 注意：数据库密码请勿上传至公开仓库，db.properties 仅提供配置模板。
