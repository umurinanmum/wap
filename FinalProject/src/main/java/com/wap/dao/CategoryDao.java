package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.CategoryDto;
import com.wap.model.WapResultData;
import lombok.var;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDao {

    public WapResultData<ArrayList<CategoryDto>> getAll() {
        var result = new WapResultData<ArrayList<CategoryDto>>();
        try {
            PreparedStatement ps = WapConnection.getConnection().prepareStatement("SELECT * FROM wap.public.category");
            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<CategoryDto>());
            while (rs.next()){
                CategoryDto categoryDto = new CategoryDto();
                categoryDto.setId(rs.getInt("id"));
                categoryDto.setName(rs.getString("name"));
                result.getData().add(categoryDto);
            }
            result.success();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
