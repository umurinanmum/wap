package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.CategoryDto;
import com.wap.dto.TaskDto;
import com.wap.dto.TeamDto;
import com.wap.dto.UserDto;
import com.wap.helper.StringHelper;
import com.wap.model.WapResultData;
import lombok.var;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeamDao {

    public WapResultData<ArrayList<TeamDto>> getAll() {
        var result = new WapResultData<ArrayList<TeamDto>>();
        try {
            PreparedStatement ps = WapConnection.getConnection().prepareStatement("SELECT * FROM wap.public.team");
            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<TeamDto>());
            while (rs.next()) {
                TeamDto teamDto = new TeamDto();
                teamDto.setId(rs.getInt("id"));
                teamDto.setName(rs.getString("name"));
                result.getData().add(teamDto);
            }
            result.success();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public WapResultData<ArrayList<TaskDto>> getAllTaskInTheTeam(int idTeam) {
        var result = new WapResultData<ArrayList<TaskDto>>();
        try {
            String query = "SELECT t.id,t.name AS tname,t.required_by,t.priority,t.is_completed,u.id AS uid,u.name AS uname,u.lastname,u.username,u.password,c.id AS cid,c.name AS cname FROM wap.public.task t INNER JOIN wap.public.users u ON t.id_user = u.id INNER JOIN wap.public.category c ON t.id_category = c.id where u.id_team=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);
            ps.setInt(1, idTeam);

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
