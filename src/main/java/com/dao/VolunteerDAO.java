package com.dao;
import com.entity.Volunteer;
import com.util.JDBCUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class VolunteerDAO {
    // 新增
    public void add(Volunteer volunteer) {
        String sql = "INSERT INTO volunteer(name,age,phone,service_type,service_time) VALUES(?,?,?,?,?)";
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, volunteer.getName());
            ps.setInt(2, volunteer.getAge());
            ps.setString(3, volunteer.getPhone());
            ps.setString(4, volunteer.getServiceType());
            ps.setInt(5, volunteer.getServiceTime());
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(conn, ps, null);
        }
    }
    // 删除
    public void delete(Integer id) {
        String sql = "DELETE FROM volunteer WHERE id=?";
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(conn, ps, null);
        }
    }
    // 修改
    public void update(Volunteer volunteer) {
        String sql = "UPDATE volunteer SET name=?,age=?,phone=?,service_type=?,service_time=? WHERE id=?";
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, volunteer.getName());
            ps.setInt(2, volunteer.getAge());
            ps.setString(3, volunteer.getPhone());
            ps.setString(4, volunteer.getServiceType());
            ps.setInt(5, volunteer.getServiceTime());
            ps.setInt(6, volunteer.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(conn, ps, null);
        }
    }
    // 根据ID查询
    public Volunteer findById(Integer id) {
        String sql = "SELECT * FROM volunteer WHERE id=?";
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Volunteer v = new Volunteer();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setAge(rs.getInt("age"));
                v.setPhone(rs.getString("phone"));
                v.setServiceType(rs.getString("service_type"));
                v.setServiceTime(rs.getInt("service_time"));
                return v;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return null;
    }
    // 查询所有志愿者（修正后）
    public List<Volunteer> findAll() {
        String sql = "SELECT * FROM volunteer";
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Volunteer> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Volunteer v = new Volunteer();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setAge(rs.getInt("age"));
                v.setPhone(rs.getString("phone"));
                v.setServiceType(rs.getString("service_type"));
                v.setServiceTime(rs.getInt("service_time"));
                list.add(v);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return list;
    }

    // 按关键词（姓名/手机号/服务类型）模糊查询
    public List<Volunteer> findByKeyword(String keyword) {
        String sql = "SELECT * FROM volunteer WHERE name LIKE ? OR phone LIKE ? OR service_type LIKE ?";
        Connection conn = JDBCUtil.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Volunteer> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement(sql);
            String key = "%" + keyword + "%"; // 模糊查询通配符
            ps.setString(1, key);
            ps.setString(2, key);
            ps.setString(3, key);
            rs = ps.executeQuery();
            while (rs.next()) {
                Volunteer v = new Volunteer();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setAge(rs.getInt("age"));
                v.setPhone(rs.getString("phone"));
                v.setServiceType(rs.getString("service_type"));
                v.setServiceTime(rs.getInt("service_time"));
                list.add(v);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return list;
    }

}