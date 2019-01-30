package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.UserDto;
import com.wap.model.WapResultData;
import lombok.var;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

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
            }

            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

}
