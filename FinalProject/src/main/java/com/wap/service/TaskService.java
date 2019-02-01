package com.wap.service;

import com.wap.dao.TaskDao;
import com.wap.dto.TaskDto;
import com.wap.model.WapResult;
import com.wap.model.WapResultData;

import java.util.ArrayList;

public class TaskService {

    private TaskDao taskDao = new TaskDao();

    public WapResultData<TaskDto> getById(int id) {
        return taskDao.getById(id);
    }

    public WapResult save(TaskDto taskDto) {
        return taskDao.save(taskDto);
    }

    public WapResult delete(int id) {
        return taskDao.delete(id);
    }

    public WapResult update(TaskDto taskDto) {
        return taskDao.update(taskDto);
    }

    public WapResultData<ArrayList<TaskDto>> getAllTask() {
        return taskDao.getAllTask(false);
    }

    public WapResultData<ArrayList<TaskDto>> getAllTaskOrderedByRequiredBy() {
        return taskDao.getAllTask(true);
    }

    public WapResultData<ArrayList<TaskDto>> getAllTaskByUserId(int userId) {
        return taskDao.getAllTaskByUserId(userId, false);
    }

    public WapResultData<ArrayList<TaskDto>> getAllTaskByUserIdOrderedByRequiredBy(int userId) {
        return taskDao.getAllTaskByUserId(userId, true);
    }

}
