package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.TeamDto;
import com.wap.dto.UserDto;
import com.wap.model.WapResult;
import com.wap.model.WapResultData;
import lombok.var;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

public class UserDao {

    public WapResult save(UserDto userDto) {
        var result = new WapResult();
        try {
            String query = "INSERT INTO wap.public.users (id, name, lastname, username, password, mail, phone, lat, longg, id_team) VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);
            ps.setString(1, userDto.getName());
            ps.setString(2, userDto.getLastname());
            ps.setString(3, userDto.getUsername());
            ps.setString(4, userDto.getPassword());
            ps.setString(5, userDto.getMail());
            ps.setString(6, userDto.getPhone());
            ps.setString(7, userDto.getLat());
            ps.setString(8, userDto.getLongg());
            if (userDto.getTeam() != null) {
                ps.setInt(9, userDto.getTeam().getId());
            } else {
                ps.setNull(9, Types.INTEGER);
            }

            ps.executeUpdate();
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

    public WapResultData<ArrayList<UserDto>> getAll() {
        var result = new WapResultData<ArrayList<UserDto>>();
        try {
            String query = "SELECT * FROM wap.public.users";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<UserDto>());

            while (rs.next()) {
                UserDto userDto = new UserDto();
                userDto.setId(rs.getInt("id"));
                userDto.setName(rs.getString("name"));
                userDto.setLastname(rs.getString("lastname"));
                userDto.setUsername(rs.getString("username"));
                userDto.setMail(rs.getString("mail"));
                userDto.setPhone(rs.getString("phone"));
                userDto.setLat(rs.getString("lat"));
                userDto.setLongg(rs.getString("longg"));
                userDto.setTeam(new TeamDto());
                userDto.getTeam().setId(rs.getInt("id_team"));

                result.getData().add(userDto);
            }

            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

    public WapResultData<UserDto> getById(int id) {
        var result = new WapResultData<UserDto>();
        try {
            String query = "SELECT * FROM wap.public.users WHERE id=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            result.setData(new UserDto());

            while (rs.next()) {
                result.getData().setId(id);
                result.getData().setName(rs.getString("name"));
                result.getData().setLastname(rs.getString("lastname"));
                result.getData().setUsername(rs.getString("username"));
                result.getData().setMail(rs.getString("mail"));
                result.getData().setPhone(rs.getString("phone"));
                result.getData().setLat(rs.getString("lat"));
                result.getData().setLongg(rs.getString("longg"));
                result.getData().setTeam(new TeamDto());
                result.getData().getTeam().setId(rs.getInt("id_team"));
            }

            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

}
