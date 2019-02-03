package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.CategoryDto;
import com.wap.dto.TaskDto;
import com.wap.dto.UserDto;
import com.wap.enums.StatusCode;
import com.wap.model.WapResult;
import com.wap.model.WapResultData;
import lombok.var;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TaskDao {

    public WapResult save(TaskDto taskDto) {
        var result = new WapResult();
        try {
            String query = "INSERT INTO wap.public.task (id, name, required_by, id_category, priority, id_user, is_completed) " +
                    "VALUES  (DEFAULT,?,?,?,?,?,?)";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ps.setString(1, taskDto.getName());
            ps.setDate(2, taskDto.getRequiredBy());
            ps.setInt(3, taskDto.getCategory().getId());
            ps.setInt(4, taskDto.getPriority());
            ps.setInt(5, taskDto.getUser().getId());
            ps.setBoolean(6, taskDto.isCompleted());

            ps.executeUpdate();
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

    public WapResult delete(int id) {
        var result = new WapResult();
        try {
            String query = "DELETE FROM wap.public.task WHERE id=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

    public WapResult update(TaskDto taskDto) {
        var result = new WapResult();
        try {
            String query = "UPDATE wap.public.task SET name =?, required_by=?, id_category =?, priority=?,id_user=?," +
                    "is_completed=? WHERE id=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ps.setString(1, taskDto.getName());
            ps.setDate(2, taskDto.getRequiredBy());
            ps.setInt(3, taskDto.getCategory().getId());
            ps.setInt(4, taskDto.getPriority());
            ps.setInt(5, taskDto.getUser().getId());
            ps.setBoolean(6, taskDto.isCompleted());
            ps.setInt(7, taskDto.getId());

            ps.executeUpdate();
            result.success();
        } catch (SQLException e) {
            result.setStatusCode(StatusCode.UNKNOWN_ERROR);
        }
        return result;
    }

    public WapResultData<TaskDto> getById(int id) {
        var result = new WapResultData<TaskDto>();
        try {
            String query = "SELECT t.id,t.name AS tname,t.required_by,t.priority,t.is_completed,u.id AS uid," +
                    "u.name AS uname,u.lastname,u.username,u.password,c.id AS cid,c.name AS cname " +
                    "FROM wap.public.task t INNER JOIN wap.public.users u ON t.id_user = u.id " +
                    "INNER JOIN wap.public.category c ON " +
                    "t.id_category = c.id WHERE t.id= ?";

            PreparedStatement ps = WapConnection.getConnection()
                    .prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TaskDto taskDto = new TaskDto();
                taskDto.setId(rs.getInt("id"));
                taskDto.setName(rs.getString("tname"));
                taskDto.setRequiredBy(rs.getDate("required_by"));
                taskDto.setPriority(rs.getInt("priority"));
                taskDto.setCompleted(rs.getBoolean("is_completed"));

                taskDto.setUser(new UserDto());
                taskDto.getUser().setId(rs.getInt("uid"));
                taskDto.getUser().setName(rs.getString("uname"));
                taskDto.getUser().setLastname(rs.getString("lastname"));
                taskDto.getUser().setUsername(rs.getString("username"));
                taskDto.getUser().setPassword(rs.getString("password"));

                taskDto.setCategory(new CategoryDto());
                taskDto.getCategory().setId(rs.getInt("cid"));
                taskDto.getCategory().setName(rs.getString("cname"));

                result.setData(taskDto);
            }
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

    public WapResultData<ArrayList<TaskDto>> getAllTask(boolean orderedByRequiredBy) {
        var result = new WapResultData<ArrayList<TaskDto>>();
        try {
            String query = "SELECT t.id,t.name AS tname,t.required_by,t.priority,t.is_completed,u.id AS uid," +
                    "u.name AS uname,u.lastname,u.username,u.password,c.id AS cid,c.name AS cname FROM wap.public.task t " +
                    "INNER JOIN wap.public.users u ON t.id_user = u.id " +
                    "INNER JOIN wap.public.category c ON t.id_category = c.id";

            if (orderedByRequiredBy) {
                query += " ORDER BY t.required_by";
            } else {
                query += " ORDER BY t.priority ASC";
            }

            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<TaskDto>());

            while (rs.next()) {
                TaskDto taskDto = new TaskDto();
                taskDto.setId(rs.getInt("id"));
                taskDto.setName(rs.getString("tname"));
                taskDto.setRequiredBy(rs.getDate("required_by"));
                taskDto.setPriority(rs.getInt("priority"));
                taskDto.setCompleted(rs.getBoolean("is_completed"));

                taskDto.setUser(new UserDto());
                taskDto.getUser().setId(rs.getInt("uid"));
                taskDto.getUser().setName(rs.getString("uname"));
                taskDto.getUser().setLastname(rs.getString("lastname"));
                taskDto.getUser().setUsername(rs.getString("username"));
                taskDto.getUser().setPassword(rs.getString("password"));

                taskDto.setCategory(new CategoryDto());
                taskDto.getCategory().setId(rs.getInt("cid"));
                taskDto.getCategory().setName(rs.getString("cname"));

                result.getData().add(taskDto);
            }
            result.success();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public WapResultData<ArrayList<TaskDto>> getAllTaskByUserId(int userId, boolean orderedByRequiredBy) {
        var result = new WapResultData<ArrayList<TaskDto>>();
        try {

            String query = "SELECT t.id,t.name AS tname,t.required_by,t.priority,t.is_completed,u.id AS uid," +
                    "u.name AS uname,u.lastname,u.username,u.password,c.id AS cid,c.name AS cname FROM wap.public.task t " +
                    "INNER JOIN wap.public.users u ON t.id_user = u.id " +
                    "INNER JOIN wap.public.category c ON t.id_category = c.id WHERE u.id =?";
            if (orderedByRequiredBy) {
                query += " ORDER BY t.required_by";
            } else {
                query += " ORDER BY t.priority ASC";
            }

            PreparedStatement ps = WapConnection.getConnection()
                    .prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<TaskDto>());

            while (rs.next()) {
                TaskDto taskDto = new TaskDto();
                taskDto.setId(rs.getInt("id"));
                taskDto.setName(rs.getString("tname"));
                taskDto.setRequiredBy(rs.getDate("required_by"));
                taskDto.setPriority(rs.getInt("priority"));
                taskDto.setCompleted(rs.getBoolean("is_completed"));

                taskDto.setUser(new UserDto());
                taskDto.getUser().setId(rs.getInt("uid"));
                taskDto.getUser().setName(rs.getString("uname"));
                taskDto.getUser().setLastname(rs.getString("lastname"));
                taskDto.getUser().setUsername(rs.getString("username"));
                taskDto.getUser().setPassword(rs.getString("password"));

                taskDto.setCategory(new CategoryDto());
                taskDto.getCategory().setId(rs.getInt("cid"));
                taskDto.getCategory().setName(rs.getString("cname"));

                result.getData().add(taskDto);
            }
            result.success();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
