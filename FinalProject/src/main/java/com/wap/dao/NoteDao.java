package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.NoteDto;
import com.wap.model.WapResultData;
import lombok.var;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoteDao {

    public WapResultData<ArrayList<NoteDto>> getNotesByIdTask(int idTask) {
        var result = new WapResultData<ArrayList<NoteDto>>();
        try {
            String query = "SELECT * FROM wap.public.note WHERE id_task=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);
            ps.setInt(1, idTask);

            ResultSet rs = ps.executeQuery();
            result.setData(new ArrayList<NoteDto>());

            while (rs.next()) {
                NoteDto noteDto = new NoteDto();
                noteDto.setId(rs.getInt("id"));
                noteDto.setNote(rs.getString("note"));
                noteDto.setDate(rs.getDate("date"));
                result.getData().add(noteDto);
            }
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

}
