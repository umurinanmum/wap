package com.wap.controller;

import com.wap.dao.TaskDao;
import com.wap.dto.TaskDto;
import com.wap.enums.StatusCode;
import com.wap.helper.JsonHelper;
import com.wap.helper.StringHelper;
import com.wap.model.WapResultData;
import lombok.var;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/Task")
public class TaskController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idUserStr = req.getParameter("idUser");
        String orderedByRequiredByStr = req.getParameter("orderedByRequiredBy");

        TaskDao taskDao = new TaskDao();

        if (StringHelper.isNullOrEmpty(idUserStr)) {
            //call get all method
            if (StringHelper.isNullOrEmpty(orderedByRequiredByStr)) {
                var result = taskDao.getAllTask(false);
                var resultJson = JsonHelper.toJson(result);
                resp.getWriter().write(resultJson);
            } else {
                var result = taskDao.getAllTask(true);
                var resultJson = JsonHelper.toJson(result);
                resp.getWriter().write(resultJson);
            }
        }

        int idUser = 0;
        try {
            idUser = Integer.parseInt(idUserStr);
        } catch (Exception e) {
            var result = new WapResultData<ArrayList<TaskDto>>();
            result.setStatusCode(StatusCode.INVALID_PARAMETER);
            var resultJson = JsonHelper.toJson(result);
            resp.getWriter().write(resultJson);
            return;
        }

        if (StringHelper.isNullOrEmpty(orderedByRequiredByStr)) {
            var result = taskDao.getAllTaskByUserId(idUser, false);
            var resultJson = JsonHelper.toJson(result);
            resp.getWriter().write(resultJson);
        } else {
            var result = taskDao.getAllTaskByUserId(idUser, true);
            var resultJson = JsonHelper.toJson(result);
            resp.getWriter().write(resultJson);
        }

    }
}
