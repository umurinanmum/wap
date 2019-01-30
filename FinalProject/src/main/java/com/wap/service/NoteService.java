package com.wap.service;

import com.wap.dao.NoteDao;
import com.wap.dto.NoteDto;
import com.wap.model.WapResultData;

import java.util.ArrayList;

public class NoteService {
    private NoteDao noteDao = new NoteDao();

    public WapResultData<ArrayList<NoteDto>> getNotesByIdTask(int idTask){
        return noteDao.getNotesByIdTask(idTask);
    }
}
