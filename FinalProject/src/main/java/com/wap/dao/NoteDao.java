package com.wap.dao;

import com.wap.db.WapConnection;
import com.wap.dto.NoteDto;
import com.wap.enums.StatusCode;
import com.wap.model.WapResult;
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

    public WapResult update(NoteDto noteDto) {
        var result = new WapResult();
        try {
            String query = "UPDATE wap.public.note SET note =?, date=?, id_task =? WHERE id=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ps.setString(1, noteDto.getNote());
            ps.setDate(2, noteDto.getDate());
            ps.setInt(3, noteDto.getTaskDto().getId());

            ps.executeUpdate();
            result.success();
        } catch (SQLException e) {
            result.setStatusCode(StatusCode.UNKNOWN_ERROR);
        }
        return result;
    }

    public WapResult delete(int id) {
        var result = new WapResult();
        try {
            String query = "DELETE FROM wap.public.note WHERE id=?";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }

    public WapResult save(NoteDto noteDto) {
        var result = new WapResult();
        try {
            String query = "INSERT INTO wap.public.note (id, note, date, id_task) " +
                    "VALUES  (DEFAULT,?,?,?)";
            PreparedStatement ps = WapConnection.getConnection().prepareStatement(query);

            ps.setString(1, noteDto.getNote());
            ps.setDate(2, noteDto.getDate());
            ps.setInt(3, noteDto.getTaskDto().getId());

            ps.executeUpdate();
            result.success();

        } catch (SQLException e) {

        }
        return result;
    }
}
