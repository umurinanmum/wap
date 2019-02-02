package com.wap.controller;

import com.wap.dto.TaskDto;
import com.wap.enums.StatusCode;
import com.wap.helper.JsonHelper;
import com.wap.helper.StringHelper;
import com.wap.model.WapResult;
import com.wap.service.TaskService;
import lombok.var;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Task")
public class TaskController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String json = req.getParameter("source");
        try {
            TaskDto taskDto = (TaskDto) JsonHelper.fromJson(json, TaskDto.class);
            if (taskDto.getId() != 0) {
                req.setAttribute("source", taskDto);
                doPut(req, resp);
            } else {
                if (taskDto != null) {
                    TaskService taskService = new TaskService();
                    var result = taskService.save(taskDto);
                    resp.getWriter().write(result.asJson());
                }
            }
        } catch (Exception e) {

        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idStr = req.getParameter("id");
        TaskService taskService = new TaskService();
        if (!StringHelper.isNullOrEmpty(idStr)) {
            int id = 0;
            try {
                id = Integer.parseInt(idStr);
                var result = taskService.delete(id);
                resp.getWriter().write(result.asJson());
            } catch (Exception e) {
                var result = new WapResult();
                result.setStatusCode(StatusCode.INVALID_PARAMETER);
                var resultJson = JsonHelper.toJson(result);
                resp.getWriter().write(resultJson);
                return;
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        TaskDto taskDto = ((TaskDto) req.getAttribute("source"));
        try {
            if (taskDto != null) {
                TaskService taskService = new TaskService();
                var result = taskService.update(taskDto);
                resp.getWriter().write(result.asJson());
            }
        } catch (Exception e) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idUserStr = req.getParameter("idUser");
        String orderedByRequiredByStr = req.getParameter("orderedByRequiredBy");
        String idStr = req.getParameter("id");

        TaskService taskService = new TaskService();
        int id = 0;

        if (!StringHelper.isNullOrEmpty(idStr)) {
            try {
                id = Integer.parseInt(idStr);
            } catch (Exception e) {

            }
        }

        if (id != 0) {
            var result = taskService.getById(id);
            resp.getWriter().write(result.asJson());
        } else {
            if (StringHelper.isNullOrEmpty(idUserStr)) {
                //call get all method
                if (StringHelper.isNullOrEmpty(orderedByRequiredByStr)) {
                    var result = taskService.getAllTask();
                    resp.getWriter().write(result.asJson());
                } else {
                    var result = taskService.getAllTaskOrderedByRequiredBy();
                    resp.getWriter().write(result.asJson());
                }
            } else {
                int idUser = 0;
                try {
                    idUser = Integer.parseInt(idUserStr);
                } catch (Exception e) {

                }

                if (StringHelper.isNullOrEmpty(orderedByRequiredByStr)) {
                    var result = taskService.getAllTaskByUserId(idUser);
                    resp.getWriter().write(result.asJson());
                } else {
                    var result = taskService.getAllTaskByUserIdOrderedByRequiredBy(idUser);
                    resp.getWriter().write(result.asJson());
                }
            }
        }
    }
}
