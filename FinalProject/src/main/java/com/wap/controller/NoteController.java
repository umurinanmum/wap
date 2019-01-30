package com.wap.controller;

import com.wap.dto.NoteDto;
import com.wap.enums.StatusCode;
import com.wap.helper.JsonHelper;
import com.wap.model.WapResultData;
import com.wap.service.NoteService;
import lombok.var;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/Note")
public class NoteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String idTaskStr = req.getParameter("idTask");
        if (idTaskStr == null || idTaskStr.trim().isEmpty()) {
            var result = new WapResultData<ArrayList<NoteDto>>();
            result.setStatusCode(StatusCode.MISSING_PARAMETER);
            var resultJson = JsonHelper.toJson(result);
            resp.getWriter().write(resultJson);
            return;
        }

        int idTask = 0;
        try {
            idTask = Integer.parseInt(idTaskStr);
        } catch (Exception e) {
            var result = new WapResultData<ArrayList<NoteDto>>();
            result.setStatusCode(StatusCode.INVALID_PARAMETER);
            var resultJson = JsonHelper.toJson(result);
            resp.getWriter().write(resultJson);
            return;
        }

        NoteService noteService = new NoteService();
        var result = noteService.getNotesByIdTask(idTask);
        var resultJson = JsonHelper.toJson(result);
        resp.getWriter().write(resultJson);
    }
}
