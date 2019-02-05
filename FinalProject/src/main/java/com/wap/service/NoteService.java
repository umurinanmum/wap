package com.wap.service;

import com.wap.dao.NoteDao;
import com.wap.dto.NoteDto;
import com.wap.model.WapResult;
import com.wap.model.WapResultData;

import java.util.ArrayList;

public class NoteService {
    private NoteDao noteDao = new NoteDao();

    public WapResultData<ArrayList<NoteDto>> getNotesByIdTask(int idTask){
        return noteDao.getNotesByIdTask(idTask);
    }

    public WapResult save(NoteDto taskDto) {
        return noteDao.save(taskDto);
    }

    public WapResult update(NoteDto taskDto) {
        return noteDao.update(taskDto);
    }

    public WapResult delete(int id) {
        return noteDao.delete(id);
    }
}
