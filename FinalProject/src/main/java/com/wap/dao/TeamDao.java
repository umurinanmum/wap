package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.CategoryDto;
import com.wap.dto.TaskDto;
import com.wap.dto.TeamDto;
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

    public WapResultData<ArrayList<TaskDto>> getAllTaskInTheTeam(int idUser) {
        var result = new WapResultData<ArrayList<TaskDto>>();
        try {
            PreparedStatement ps = WapConnection.getConnection().prepareStatement("SELECT * FROM wap.public.team");
            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<TaskDto>());
            while (rs.next()) {
                TaskDto taskDto = new TaskDto();

                result.getData().add(taskDto);
            }
            result.success();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
