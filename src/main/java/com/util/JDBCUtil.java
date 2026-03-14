package com.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
public class JDBCUtil {
    private static Properties props = new Properties();
    static {
        try {
            props.load(JDBCUtil.class.getClassLoader().getResourceAsStream("db.properties"));
            Class.forName(props.getProperty("jdbc.driver"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(
                    props.getProperty("jdbc.url"),
                    props.getProperty("jdbc.username"),
                    props.getProperty("jdbc.password")
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}